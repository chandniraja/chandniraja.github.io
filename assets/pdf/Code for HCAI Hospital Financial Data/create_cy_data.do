clear
set more off
set type double

gl path "[[INSERT PATH HERE]]"
gl data "[[LOCATION OF THE PROCESSED DATA FILES FROM EARLIER PROGRAMS]]"
gl temp "[[LOCATION OF THE FINAL DATA SET TO BE PRODUCED IN THIS PROGRAM]]"

// External data ////////////////////////////////////////////

// Edited ownership names for 1995 tables (edited myself) 
// In the future can do this name standardization for all years


import excel "$data/ownership_sheet_edited", firstrow clear
keep oshpd_facnum ownername ownername_edited
duplicates drop
g fiscal_year = 1995
save "$temp/ownnames", replace

// Case Mix Index from OSHPD (https://data.chhs.ca.gov/dataset/case-mix-index)


import excel "$path/Data/casemixindex_1996_2020", firstrow clear
ren *, lower
ren oshpd_id oshpd_facnum
ren fy* costmix* 
ren cy* costmix*
g cmi = costmix1996
replace oshpd_facnum = "106" + oshpd_facnum
destring oshpd_facnum, replace
save "$temp/cmi", replace // for the 1995 tables

reshape long costmix, i(oshpd_facnum county facility_name) j(calendar_year)
save "$temp/cmi_reshape", replace

// Pivot tables from OSHPD with acute beds, GAC, small/rural hospital, and DSH designations, how much LTC is on-site, health system


foreach file of numlist 1995/2020 {
	import excel "$path/Data/HCAI Pivot Tables/hafd`file'pivot.xls", sheet("Data") firstrow clear

	ren FAC_NO oshpd_facnum
	g fiscal_year = `file'
	
	if `file' == 1995 | `file' == 1996 | `file' == 1997 | `file' == 1998 {
		keep oshpd_facnum fiscal_year TYPE_CNTRL HealthSystem TYPE_CARE TEACH_RURL DSHhosp ltcrange BED_ACUTE hsaname FAC_NAME
	}
	
	if `file' == 1999 {
		keep oshpd_facnum fiscal_year TYPE_CNTRL SYSTEM2HOSP TYPE_CARE TEACH_RURL DSHhosp ltcrange BED_ACUTE HSAname FAC_NAME
	}
	
	if `file' == 2000 | `file' == 2001 | `file' == 2002 | `file' == 2003 | `file' == 2004 | `file' == 2005 | ///
	`file' == 2006 | `file' == 2007 | `file' == 2008 | `file' == 2009 | `file' == 2011 | `file' == 2012 | ///
	`file' == 2013 | `file' == 2014 | `file' == 2015 | `file' == 2016 | `file' == 2017 | `file' == 2018 | ///
	`file' == 2019 {
		keep oshpd_facnum fiscal_year TYPE_CNTRL SYSTEM3HOSP TYPE_CARE TEACH_RURL DSHhosp ltcrange BED_ACUTE HSAname FAC_NAME
	}
	
	if `file' == 2010 | `file' == 2015 | `file' == 2020 {
		keep oshpd_facnum fiscal_year TYPE_CNTRL SYSTEM3HOSP TYPE_CARE TEACH_RURL DSHhosp ltcrange BED_ACUTE HSA FAC_NAME
	}
	
	destring oshpd_facnum, replace
	drop if oshpd_facnum == .
	
	unique oshpd fiscal
	duplicates tag oshpd fiscal, g(dup)
	bysort oshpd: g obs = _n
	drop if dup != 0 & obs > 1
	
	save "$temp/pivot_`file'", replace
}


// OSHPD Financial data ////////////////////////////////////////////

	use "$data/fy1990_2020_panel", clear

	replace oshpd_facnum = state_facnum if oshpd_facnum == "" 

	drop if pagenum == . // nonnumeric (missing) values of oshpd_facnum
	
	drop if oshpd_facnum == "State (OSHPD) Facility Number"
	destring oshpd_facnum, replace
	
	
	
	// Did not import these as alternate control types so recoding here rather than in the original import
	ren (ctrlstate ctrlcounty ctrlcitycounty ctrlcity ctrldistrict) (ctrltype_st ctrltype_co ctrltype_cityco ctrltype_city ctrltype_dist)
	la var ctrltype_st "Type of control (one only) - state"
	la var ctrltype_co "Type of control (one only) - county"
	la var ctrltype_cityco "Type of control (one only) - city/county" 
	la var ctrltype_city "Type of control (one only) - city"
	la var ctrltype_dist "Type of control (one only) - district"

// Key variables 
	
	foreach unit in msa peda psya psyac obst reh defo otha ///
	msic cic pic nic burn psyi oic nur sa sn psyl intc res ods tot {
		destring `unit'_adultpatdays `unit'_pedpatdays, replace
		egen `unit'_totapatdays = rowtotal(`unit'_adultpatdays `unit'_pedpatdays)
	}

	foreach unit in msa peda psya psyac obst reh defo otha ///
	msic cic pic nic burn psyi oic nur sa sn psyl intc res ods tot {
		
		foreach var in rnhrs lvnhrs regnhrs physcompprof physhrlywage physhrs aidehrs rnhrlywage lvnhrlywage regnhrlywage {
			destring `unit'_`var', replace
		}
				
		foreach var in rn lvn regn {
			replace `unit'_`var'hrs = 0 if `unit'_`var'hrs == . 
		}
		
		egen `unit'_nursehrs = rowtotal(`unit'_rnhrs `unit'_lvnhrs `unit'_regnhrs)
		
		g `unit'_sharern = `unit'_rnhrs/`unit'_nursehrs 
		g `unit'_sharelvn = `unit'_lvnhrs/`unit'_nursehrs
		g `unit'_shareregn = `unit'_regnhrs/`unit'_nursehrs
		
		g `unit'_consphyshrs_est = `unit'_physcompprof/`unit'_physhrlywage
		egen `unit'_totphyshrs_est = rowtotal(`unit'_consphyshrs_est `unit'_physhrs)
		
		foreach var in rnhrlywage lvnhrlywage regnhrlywage {
			destring `unit'_`var', replace
		}
		
		g `unit'_rnwagewtd = `unit'_rnhrlywage*`unit'_sharern
		g `unit'_lvnwagewtd = `unit'_lvnhrlywage*`unit'_sharelvn
		g `unit'_regnwagewtd = `unit'_regnhrlywage*`unit'_shareregn
		
		egen `unit'_avenursewage = rowtotal(`unit'_rnwagewtd `unit'_lvnwagewtd `unit'_regnwagewtd)
		replace `unit'_avenursewage = . if `unit'_avenursewage == 0 
	}
	
	
	// The following is only prepared for FY 1996-1997 onwards because prior to that there were 3 payer categories
	
	// Patient days by payer type
	
	// FY 2000-2001 onwards
	foreach unit in acu psy cd reb lt oth {
		foreach var in trmedicare mcmedicare trmedical mcmedical ///
		trindig mcindig trthird mcthird othindig othpay {
			destring `unit'_`var'patdays, replace
		}
		
		// Aggregate patient days and revenues by payer type into 5 payers instead of 9 for FY 2000-2001 onwards
		// See the spreadsheet that TP sent
		egen `unit'_mcarepatdays = rowtotal(`unit'_trmedicarepatdays) // Medicare
		egen `unit'_mcalpatdays = rowtotal(`unit'_trmedicalpatdays) // Medicaid
		egen `unit'_indigpatdays = rowtotal(`unit'_trindigpatdays) // County indigent programs
		egen `unit'_thirdpatdays = rowtotal(`unit'_trthirdpatdays `unit'_mcthirdpatdays `unit'_mcmedicarepatdays `unit'_mcmedicalpatdays `unit'_mcindigpatdays) // Other third party payers
		egen `unit'_othpatdays = rowtotal(`unit'_othindigpatdays `unit'_othpaypatdays) // Other payers
	}
	
	// Pre-FY 2000-2001
	foreach unit in msa peda psya psyac obst reh defo otha altb ///
	msic cic pic nic burn psyi oic nur sa sn psyl intc res ods sap ols chem {
		rename (`unit'_medicarepatdays `unit'_medicalpatdays) (`unit'_mcarepatdays `unit'_mcalpatdays)
		
		foreach var in mcare mcal indig third othpay {
			destring `unit'_`var'inpatrev, replace
			destring `unit'_`var'inpatadj, replace
			destring `unit'_`var'patdays, replace
		}
	}
	
	// See p. 7020.17 of the accounting manual 
	foreach var in mcare mcal indig third othpay { 
		egen acu_`var'patdays_n = rowtotal(msic_`var'patdays cic_`var'patdays pic_`var'patdays nic_`var'patdays burn_`var'patdays oic_`var'patdays defo_`var'patdays msa_`var'patdays peda_`var'patdays obst_`var'patdays altb_`var'patdays otha_`var'patdays)
		egen psy_`var'patdays_n = rowtotal(psyi_`var'patdays psya_`var'patdays psyac_`var'patdays psyl_`var'patdays)
		egen lt_`var'patdays_n = rowtotal(sa_`var'patdays sap_`var'patdays sn_`var'patdays intc_`var'patdays ols_`var'patdays)
		egen oth_`var'patdays_n = rowtotal(res_`var'patdays ods_`var'patdays)
		g cd_`var'patdays_n = chem_`var'patdays
		g reb_`var'patdays_n = reh_`var'patdays
	}
	
	foreach unit in acu psy lt oth cd reb {
		g `unit'_othpatdays_n = `unit'_othpaypatdays_n if (fiscal_year < 2001 | fiscal_year == 19931 | fiscal_year == 19932)
		
		foreach var in mcare mcal indig third oth { 
			replace `unit'_`var'patdays = `unit'_`var'patdays_n if (`unit'_`var'patdays == . | `unit'_`var'patdays == 0) & (fiscal_year < 2001 | fiscal_year == 19931 | fiscal_year == 19932)
			drop `unit'_`var'patdays_n
		}
	}		
		
	// Revenues by payer type 
	
	// FY 2000-2001 onwards 
	foreach unit in msa peda psya psyac obst reh defo otha altb ///
	msic cic pic nic burn psyi oic nur sa sn psyl intc res ods sap ols chem {
		destring `unit'_trmcareinpatrev `unit'_trmcalinpatrev `unit'_trindiginpatrev `unit'_trthirdinpatrev `unit'_mcthirdinpatrev `unit'_mcmcareinpatrev `unit'_mcmcalinpatrev `unit'_mcindiginpatrev `unit'_othindiginpatrev `unit'_othpayinpatrev, replace
	
		// Aggregate patient days and revenues by payer type into 5 payers instead of 9 for FY 2000-2001 onwards
		// See the spreadsheet that TP sent
		egen `unit'_mcareinpatrev_n = rowtotal(`unit'_trmcareinpatrev) // Medicare
		egen `unit'_mcalinpatrev_n = rowtotal(`unit'_trmcalinpatrev) // Medicaid
		egen `unit'_indiginpatrev_n = rowtotal(`unit'_trindiginpatrev) // County indigent programs
		egen `unit'_thirdinpatrev_n = rowtotal(`unit'_trthirdinpatrev `unit'_mcthirdinpatrev `unit'_mcmcareinpatrev `unit'_mcmcalinpatrev `unit'_mcindiginpatrev) // Other third party payers
		egen `unit'_othpayinpatrev_n = rowtotal(`unit'_othindiginpatrev `unit'_othpayinpatrev) // Other payers
		
		foreach var in mcare mcal indig third othpay {
			replace `unit'_`var'inpatrev = `unit'_`var'inpatrev_n if (`unit'_`var'inpatrev == . | `unit'_`var'inpatrev == 0) & (fiscal_year >= 2001 & fiscal_year != 19931 & fiscal_year != 19932)
			drop `unit'_`var'inpatrev_n
		}
		
	}
	
	// FY 2000-2001 onwards & Pre-FY 2000-2001		
	foreach var in mcare mcal indig third othpay { 
	
		egen acu_`var'inpatrev = rowtotal(msic_`var'inpatrev cic_`var'inpatrev pic_`var'inpatrev nic_`var'inpatrev burn_`var'inpatrev oic_`var'inpatrev defo_`var'inpatrev msa_`var'inpatrev peda_`var'inpatrev obst_`var'inpatrev altb_`var'inpatrev otha_`var'inpatrev)
		egen psy_`var'inpatrev = rowtotal(psyi_`var'inpatrev psya_`var'inpatrev psyac_`var'inpatrev psyl_`var'inpatrev)
		egen lt_`var'inpatrev = rowtotal(sa_`var'inpatrev sap_`var'inpatrev sn_`var'inpatrev intc_`var'inpatrev ols_`var'inpatrev)
		egen oth_`var'inpatrev = rowtotal(res_`var'inpatrev ods_`var'inpatrev)
		g cd_`var'inpatrev = chem_`var'inpatrev
		g reb_`var'inpatrev = reh_`var'inpatrev
	}
	
	foreach unit in acu psy lt oth cd reb {
		ren `unit'_othpayinpatrev `unit'_othinpatrev
	}
			
// Hospital characteristics

	foreach file of numlist 1995/2020 {
		merge m:1 oshpd_facnum fiscal_year using "$temp/pivot_`file'", update
		drop if _m == 2
		drop _m
	}
	
	// Assign GAC designation to 1990-1994 FY hospitals where we don't have pivot tables
	
	replace HealthSystem = SYSTEM3HOSP if HealthSystem == "" & SYSTEM3HOSP != ""
	replace HealthSystem = SYSTEM2HOSP if HealthSystem == "" & SYSTEM2HOSP != ""
	replace hsaname = HSAname if hsaname == "" & HSAname != ""
	replace hsaname = HSA if hsaname == "" & HSA != ""
	drop SYSTEM3HOSP HSAname HSA
	sort oshpd_facnum fiscal_year
	
	foreach var in TYPE_CNTRL HealthSystem TYPE_CARE TEACH_RURL DSHhosp ltcrange hsaname {
		bysort oshpd_facnum: replace `var' = `var'[_n+1] if (`var' == "" & fiscal_year < 1995 & fiscal_year[_n+1] == 1995)
		bysort oshpd_facnum: replace `var' = `var'[_n+1] if (`var' == "" & fiscal_year < 1995 & fiscal_year[_n+1] == 1994)
		bysort oshpd_facnum: replace `var' = `var'[_n+1] if (`var' == "" & fiscal_year < 1995 & fiscal_year[_n+1] == 1993)
		bysort oshpd_facnum: replace `var' = `var'[_n+1] if (`var' == "" & fiscal_year < 1995 & fiscal_year[_n+1] == 1992)
		bysort oshpd_facnum: replace `var' = `var'[_n+1] if (`var' == "" & fiscal_year < 1995 & fiscal_year[_n+1] == 1991)
	}
	bysort oshpd_facnum: replace BED_ACUTE = BED_ACUTE[_n+1] if (BED_ACUTE == . & fiscal_year < 1995 & fiscal_year[_n+1] == 1995)
	bysort oshpd_facnum: replace BED_ACUTE = BED_ACUTE[_n+1] if (BED_ACUTE == . & fiscal_year < 1995 & fiscal_year[_n+1] == 1994)
	bysort oshpd_facnum: replace BED_ACUTE = BED_ACUTE[_n+1] if (BED_ACUTE == . & fiscal_year < 1995 & fiscal_year[_n+1] == 1993)
	bysort oshpd_facnum: replace BED_ACUTE = BED_ACUTE[_n+1] if (BED_ACUTE == . & fiscal_year < 1995 & fiscal_year[_n+1] == 1992)
	bysort oshpd_facnum: replace BED_ACUTE = BED_ACUTE[_n+1] if (BED_ACUTE == . & fiscal_year < 1995 & fiscal_year[_n+1] == 1991)
	
	foreach var in TYPE_CNTRL TYPE_CARE TEACH_RURL DSHhosp hsaname {
		g l`var' = lower(`var')
		drop `var'
		ren l`var' `var'
	}
	replace TYPE_CARE = "general acute" if TYPE_CARE == "general"
	replace TYPE_CARE = "children" if TYPE_CARE == "childrens"
	

// Address duplicate reports by hospital - fiscal year

	bysort oshpd_facnum: egen obs_count = sum(obs) // how many observations per facility

	unique oshpd_facnum fiscal_year

	duplicates tag oshpd_facnum fiscal_year, g(dup_hosp)

	br if dup_hosp
	
	// Average over the number of days to obtain 365 day measures
	
	foreach var in beg end {
	
		split rep_`var', p("/")
		g rep_`var'_len = strlen(rep_`var'1)
		g rep_`var'_mth = rep_`var'1 if rep_`var'_len == 1 | rep_`var'_len == 2
		replace rep_`var'_mth = substr(rep_`var', 5, 2) if rep_`var'_len == 8
		g rep_`var'_dt = rep_`var'2 if rep_`var'_len == 1 | rep_`var'_len == 2
		replace rep_`var'_dt = substr(rep_`var', 7, 2) if rep_`var'_len == 8
		g rep_`var'_yr = rep_`var'3 if rep_`var'_len == 1 | rep_`var'_len == 2
		replace rep_`var'_yr = substr(rep_`var', 1, 4) if rep_`var'_len == 8
		replace rep_`var'_mth = "1" if substr(rep_`var'1, 3, 3) == "jan" & rep_`var'_len == 9
		replace rep_`var'_mth = "2" if substr(rep_`var'1, 3, 3) == "feb" & rep_`var'_len == 9
		replace rep_`var'_mth = "3" if substr(rep_`var'1, 3, 3) == "mar" & rep_`var'_len == 9
		replace rep_`var'_mth = "4" if substr(rep_`var'1, 3, 3) == "apr" & rep_`var'_len == 9
		replace rep_`var'_mth = "5" if substr(rep_`var'1, 3, 3) == "may" & rep_`var'_len == 9
		replace rep_`var'_mth = "6" if substr(rep_`var'1, 3, 3) == "jun" & rep_`var'_len == 9
		replace rep_`var'_mth = "7" if substr(rep_`var'1, 3, 3) == "jul" & rep_`var'_len == 9
		replace rep_`var'_mth = "8" if substr(rep_`var'1, 3, 3) == "aug" & rep_`var'_len == 9
		replace rep_`var'_mth = "9" if substr(rep_`var'1, 3, 3) == "sep" & rep_`var'_len == 9
		replace rep_`var'_mth = "10" if substr(rep_`var'1, 3, 3) == "oct" & rep_`var'_len == 9
		replace rep_`var'_mth = "11" if substr(rep_`var'1, 3, 3) == "nov" & rep_`var'_len == 9
		replace rep_`var'_mth = "12" if substr(rep_`var'1, 3, 3) == "dec" & rep_`var'_len == 9
		replace rep_`var'_dt = substr(rep_`var', 1, 2) if rep_`var'_len == 9 
		replace rep_`var'_yr = substr(rep_`var', 6, 4) if rep_`var'_len == 9
	
	}
	
	destring rep_beg_mth rep_beg_dt rep_beg_yr rep_end_mth rep_end_dt rep_end_yr, replace
	g rep_beg_date = mdy(rep_beg_mth, rep_beg_dt, rep_beg_yr)
	g rep_end_date = mdy(rep_end_mth, rep_end_dt, rep_end_yr)
	format rep_beg_date rep_end_date %td
	g rep_days_elaps = rep_end_date - rep_beg_date
	
	// For the time being leave the duplicate obs by hospital ID and fiscal year in the data set
	// Depending on which variables are going to be used can take a weighted average of those variables prior to analysis
	bysort oshpd_facnum fiscal_year: egen sum_days_elaps = sum(rep_days_elaps)
	
	// 90 percent of hospitals have report for 365 days, others need to be adjusted
	destring msa_mgmthrs msa_techhrs msa_physhrs msa_mphrs msa_envhrs msa_clerhrs msa_othhrs ///
	msa_mgmthrlywage msa_techhrlywage msa_physhrlywage msa_mphrlywage msa_envhrlywage msa_clerhrlywage msa_othhrlywage msa_aidehrlywage msa_rnhrlywage msa_lvnhrlywage ///
	msic_mgmthrs msic_techhrs msic_physhrs msic_mphrs msic_envhrs msic_clerhrs msic_othhrs ///
	msic_mgmthrlywage msic_techhrlywage msic_physhrlywage msic_mphrlywage msic_envhrlywage msic_clerhrlywage msic_othhrlywage msic_aidehrlywage msic_rnhrlywage msic_lvnhrlywage ///
	tot_mgmthrs tot_techhrs tot_physhrs tot_mphrs tot_envhrs tot_clerhrs tot_othhrs ///
	tot_mgmthrlywage tot_techhrlywage tot_physhrlywage tot_mphrlywage tot_envhrlywage tot_clerhrlywage tot_othhrlywage tot_aidehrlywage tot_rnhrlywage tot_lvnhrlywage ///
	msa_adultpatdays msa_pedpatdays msa_rnhrs msa_lvnhrs msa_regnhrs msa_aidehrs msa_prodhrs ///
	msa_servdisch msa_hospdisch msa_availbeds_ave msa_mcarepatdays msa_mcalpatdays msa_indigpatdays msa_thirdpatdays msa_othpaypatdays ///
	msa_mcareinpatrev msa_mcareinpatadj msa_mcalinpatrev msa_mcalinpatadj msa_othinpatrev msa_othinpatadj msa_indiginpatrev msa_indiginpatadj ///
	msa_thirdinpatrev msa_thirdinpatadj msa_othpayinpatrev msa_othpayinpatadj msa_totinpatrev msa_totinpatadj msa_p10unitsserv msa_p10adjdirexp ///
	msa_p10alloccost msa_p10patcarecost msa_p10renetcosts msa_p10adjprofcomp msa_p10netprof msa_expsalaries msa_expbenefits msa_exptotal msa_expadjtotal msa_p10netrev ///
	msa_expproffees msa_exppurchserv msa_expsupplies msa_explease msa_expother ///
	msic_adultpatdays msic_pedpatdays msic_rnhrs msic_lvnhrs msic_regnhrs msic_aidehrs msic_prodhrs ///
	msic_servdisch msic_hospdisch msic_availbeds_ave msic_mcarepatdays msic_mcalpatdays msic_indigpatdays msic_thirdpatdays msic_othpaypatdays ///
	msic_mcareinpatrev msic_mcareinpatadj msic_mcalinpatrev msic_mcalinpatadj msic_othinpatrev msic_othinpatadj msic_indiginpatrev msic_indiginpatadj ///
	msic_thirdinpatrev msic_thirdinpatadj msic_othpayinpatrev msic_othpayinpatadj msic_totinpatrev msic_totinpatadj msic_p10unitsserv msic_p10adjdirexp ///
	msic_p10alloccost msic_p10patcarecost msic_p10renetcosts msic_p10adjprofcomp msic_p10netprof msic_expsalaries msic_expbenefits msic_exptotal msic_expadjtotal msic_p10netrev ///
	msic_expproffees msic_exppurchserv msic_expsupplies msic_explease msic_expother ///
	tot_adultpatdays tot_pedpatdays tot_rnhrs tot_lvnhrs tot_regnhrs tot_aidehrs tot_prodhrs ///
	tot_servdisch tot_hospdisch tot_availbeds_ave tot_totinpatrev tot_totinpatadj tot_p10adjdirexp ///
	tot_p10alloccost tot_p10patcarecost tot_p10renetcosts tot_p10adjprofcomp tot_p10netprof tot_expsalaries tot_expbenefits tot_exptotal tot_expadjtotal tot_p10netrev ///
	acu_trthirdpatdays acu_mcthirdpatdays acu_mcmedicarepatdays acu_mcmedicalpatdays acu_mcindigpatdays ///
	peda_rnhrs peda_lvnhrs peda_totapatdays peda_regnhrs peda_aidehrs peda_prodhrs ///
	obst_rnhrs obst_lvnhrs obst_totapatdays obst_regnhrs obst_aidehrs obst_prodhrs ///
	reh_rnhrs reh_lvnhrs reh_totapatdays reh_regnhrs reh_aidehrs reh_prodhrs ///
	otha_rnhrs otha_lvnhrs otha_totapatdays otha_regnhrs otha_aidehrs otha_prodhrs ///
	pic_totapatdays pic_rnhrs pic_lvnhrs pic_regnhrs pic_aidehrs pic_prodhrs ///
	msa_avenursewage msa_avehrlywage msic_avenursewage msic_avehrlywage tot_avenursewage tot_avehrlywage ///
	amb_rnhrs amb_lvnhrs anc_rnhrs anc_lvnhrs msa_staffbeds_ave msic_staffbeds_ave tot_staffbeds_ave ///
	msic_alloc* msa_alloc* *_inpatunits *_outpatunits ///
	msic_phys* msa_phys* tot_phys* *_curr *_prior *_begbal *_endbal *_addpurch *_adddonat *_transfer *_dispret ///
	aero_* *_mdhosp_bc *_mdhosp_be *_mdhosp_oth *_mdnon_bc *_mdnon_be *_mdnon_oth *_residents *_fellows ///
	lab_phys* *_physjoint *_physcont *_physrent *_physindep *_physagency *_physsalary *_physother ///
	physcont_* cic_* defo_* ///
	, replace
	save "$temp/int_cy_panel", replace

	use "$temp/int_cy_panel", clear
	
	// Fix the residents + fellows issue for FY prior to 38 (prior to 2003)
	foreach var of varlist *_residents *_fellows {
		replace `var' = `var'/100 if fiscal_year <= 2002
	}
	
	br oshpd_facnum fiscal_year rep_beg_yr rep_end_yr rep_beg_date rep_end_date
	drop sum_days_elaps 
	replace fiscal_year = 1993 if fiscal_year == 19931 | fiscal_year == 19932
	drop rep_beg1-rep_beg_len
	drop rep_end1-rep_end_len
	g calendar_year1 = rep_beg_yr 
	g calendar_year2 = rep_end_yr
	g cy_end1 = mdy(12, 31, calendar_year1)
	g cy_start2 = mdy(1, 1, calendar_year2)
	format cy_end1 cy_start2 %td
	
	g cy_year1_days = rep_days_elaps if calendar_year1 == calendar_year2
	replace cy_year1_days = cy_end1 - rep_beg_date if cy_year1_days == .
	g cy_year2_days = (rep_end_date - cy_start2 + 1) if calendar_year1 != calendar_year2
	replace cy_year2_days = 0 if cy_year2_days == .
	egen cy_year_test = rowtotal(cy_year1_days cy_year2_days)
	assert cy_year_test == rep_days_elaps
	
	// Medicare Provider Number to merge with CMI calculated by CMS
	g medicare_pnum_new = subinstr(medicare_pnum, "-", "",.)
	g len_pnum_new = strlen(medicare_pnum_new)
	g st_pnum_new = (substr(medicare_pnum_new, 1, 2) == "05")
	g nonnum_pnum_new = real(medicare_pnum_new) == . 
	replace medicare_pnum_new = "" if (len_pnum_new != 6 | st_pnum_new != 1 | nonnum_pnum_new == 1)
	
	destring medicare_pnum_new, replace
	bysort oshpd: egen max_pnum_new = max(medicare_pnum_new)
	bysort oshpd: egen min_pnum_new = min(medicare_pnum_new)
	count if max_pnum_new == .
	count if max_pnum_new != min_pnum_new
	
	// CMS Case Mix Index
	g provider = max_pnum_new 
	g fyear = fiscal_year
	
	merge m:1 provider fyear using "$temp/impactfiles"
	drop if _m == 2 
	drop _m provider
	ren tacmiv tacmiv1
	
	g provider = min_pnum_new
	
	merge m:1 provider fyear using "$temp/impactfiles"
	drop if _m == 2 
	drop _m provider
	ren tacmiv tacmiv2
	
	g tacmiv = tacmiv1 if tacmiv1 != . & tacmiv2 == .
	replace tacmiv = tacmiv2 if tacmiv1 == . & tacmiv2 != .
	replace tacmiv = tacmiv1 if tacmiv1 == tacmiv2 & tacmiv1 != .
	
	tempfile forcyfile
	save `forcyfile', replace
	
// Calendar Year file 

	destring ctrltype*, replace
	g ctrl_type = 1 if ctrltype_church == 1
	replace ctrl_type = 2 if ctrltype_npcorp == 1
	replace ctrl_type = 3 if ctrltype_npoth == 1
	replace ctrl_type = 4 if ctrltype_ind == 1
	replace ctrl_type = 5 if ctrltype_ptr == 1
	replace ctrl_type = 6 if ctrltype_corp == 1
	replace ctrl_type = 7 if ctrltype_st == 1
	replace ctrl_type = 8 if ctrltype_co == 1
	replace ctrl_type = 9 if ctrltype_cityco == 1
	replace ctrl_type = 10 if ctrltype_city == 1
	replace ctrl_type = 11 if ctrltype_dist == 1
	la define ctrl_lab 1 "Church" 2 "Non-profit corporation" 3 "Non-profit other" 4 "Investor - individual" 5 "Investor - partnership" 6 "Investor - corporation" ///
	7 "State" 8 "County" 9 "City/county" 10 "City" 11 "District"
	
	la values ctrl_type ctrl_lab
	g chnp_ctrl = (ctrl_type == 1 | ctrl_type == 2 | ctrl_type == 3)
	g inv_ctrl = (ctrl_type == 4 | ctrl_type == 5 | ctrl_type == 6)
	g govt_ctrl = (ctrl_type > 7 & ctrl_type != .)
	g teaching = (TEACH_RURL == "teaching")
	g smrur = (TEACH_RURL == "small/rural" | TEACH_RURL == "rural")
	g dsh = DSHhosp == "dsh"
	g gac = TYPE_CARE == "general acute"
	
	
	ren HealthSystem healthsys
	replace healthsys = "ADVENTIST HEALTH" if inlist(healthsys, "ADVENTIST HEALTH SYSTEM", "ADVENTIST HEALTH SYSTEMS")
	replace healthsys = "AHMC HEALTHCARE INC." if inlist(healthsys, "AHMC HEALTHCARE, INC.")
	replace healthsys = "ALTA HEALTHCARE SYSTEM" if inlist(healthsys, "ALTA HOSPITALS SYSTEM")
	replace healthsys = "AURORA BEHAVIORAL HEALTH CARE" if inlist(healthsys, "AURORA BEHAVIORAL HEALTHCARE")
	replace healthsys = "BEHAVIORAL HEALTHCARE CORP" if inlist(healthsys, "BEHAVIORAL HEALTHCARE CORPORATION")
	replace healthsys = "COLUMBIA HCA" if inlist(healthsys, "COLUMBIA/HCA HEALTHCARE CORP.")
	replace healthsys = "DAUGHTERS OF CHARITY HEALTH SYSTEM" if inlist(healthsys, "DAUGHTERS OF CHARITY HEALTH SYSTEMS")
	replace healthsys = "HCA - THE HEALTHCARE COMPANY" if inlist(healthsys, "HCA HEALTHCARE CORPORATION")
	replace healthsys = "INTEGRATED HEALTHCARE HOLDINGS" if inlist(healthsys, "INTEGRATED HEALTHCARE HOLDINGS, INC.")
	replace healthsys = "KINDRED HEALTHCARE" if inlist(healthsys, "KINDRED HEALTHCARE, INC.")
	replace healthsys = "MEMORIAL HEALTH SERVICES" if inlist(healthsys, "MEMORIALCARE")
	replace healthsys = "PRIME HEALTHCARE SERVICES" if inlist(healthsys, "PRIME HEALTHCARE SERVICES INC.")
	replace healthsys = "PROVIDENCE HEALTH & SERVICES" if inlist(healthsys, "PROVIDENCE HEALTH AND SERVICES")
	replace healthsys = "SHARP HEALTHCARE" if inlist(healthsys, "SHARP HEALTHCARE ")
	replace healthsys = "ST JOSEPH HEALTH SYSTEM" if inlist(healthsys, "ST. JOSEPH HEALTH SYSTEM")
	replace healthsys = "SUN HEALTHCARE GROUP  INC." if inlist(healthsys, "SUN HEALTHCARE GROUP INC.")
	replace healthsys = "SUTTER HEALTH" if inlist(healthsys, "SUTTER HEALTH ")
	replace healthsys = "TENET HEALTHCARE" if inlist(healthsys, "TENET HEALTHCARE CORPORATION")
	replace healthsys = "UNIVERSAL HEALTH SERVICES INC." if inlist(healthsys, "UNIVERSAL HEALTH SERVICES, INC.", "UNIVERSAL HEALTH SYSTEMS INC.")
	
	keep zipcode ownername healthsys oshpd_facnum medicare_pnum provname address city zipcode tacmiv ///
	msa_mgmthrs msa_techhrs msa_physhrs msa_mphrs msa_envhrs msa_clerhrs msa_othhrs ///
	msa_rnhrlywage msa_lvnhrlywage msa_regnhrlywage msa_aidehrlywage msa_mgmthrlywage msa_techhrlywage msa_physhrlywage msa_mphrlywage msa_envhrlywage msa_clerhrlywage msa_othhrlywage ///
	cic_mgmthrs cic_techhrs cic_physhrs cic_mphrs cic_envhrs cic_clerhrs cic_othhrs ///
cic_rnhrlywage cic_lvnhrlywage cic_regnhrlywage cic_aidehrlywage cic_mgmthrlywage cic_techhrlywage cic_physhrlywage cic_mphrlywage cic_envhrlywage cic_clerhrlywage cic_othhrlywage ///
	msic_mgmthrs msic_techhrs msic_physhrs msic_mphrs msic_envhrs msic_clerhrs msic_othhrs ///
	msic_mgmthrlywage msic_techhrlywage msic_physhrlywage msic_mphrlywage msic_envhrlywage msic_clerhrlywage msic_othhrlywage msic_aidehrlywage msic_rnhrlywage msic_lvnhrlywage msic_regnhrlywage ///
	tot_mgmthrs tot_techhrs tot_physhrs tot_mphrs tot_envhrs tot_clerhrs tot_othhrs ///
	tot_mgmthrlywage tot_techhrlywage tot_physhrlywage tot_mphrlywage tot_envhrlywage tot_clerhrlywage tot_othhrlywage tot_aidehrlywage tot_rnhrlywage tot_lvnhrlywage tot_regnhrlywage ///
	cic_totapatdays cic_adultpatdays cic_pedpatdays cic_rnhrs cic_lvnhrs cic_regnhrs cic_aidehrs cic_prodhrs ///
	cic_servdisch cic_hospdisch cic_availbeds_ave cic_mcarepatdays cic_mcalpatdays cic_indigpatdays cic_thirdpatdays cic_othpaypatdays ///
	cic_mcareinpatrev cic_mcareinpatadj cic_mcalinpatrev cic_mcalinpatadj cic_othinpatrev cic_othinpatadj cic_indiginpatrev cic_indiginpatadj ///
	cic_thirdinpatrev cic_thirdinpatadj cic_othpayinpatrev cic_othpayinpatadj cic_totinpatrev cic_totinpatadj ///
	msa_totapatdays msa_adultpatdays msa_pedpatdays msa_rnhrs msa_lvnhrs msa_regnhrs msa_aidehrs msa_prodhrs ///
	msa_servdisch msa_hospdisch msa_availbeds_ave msa_mcarepatdays msa_mcalpatdays msa_indigpatdays msa_thirdpatdays msa_othpaypatdays ///
	msa_mcareinpatrev msa_mcareinpatadj msa_mcalinpatrev msa_mcalinpatadj msa_othinpatrev msa_othinpatadj msa_indiginpatrev msa_indiginpatadj ///
	msa_thirdinpatrev msa_thirdinpatadj msa_othpayinpatrev msa_othpayinpatadj msa_totinpatrev msa_totinpatadj msa_p10unitsserv msa_p10adjdirexp ///
	msa_p10alloccost msa_p10patcarecost msa_p10renetcosts msa_p10adjprofcomp msa_p10netprof msa_expsalaries msa_expbenefits msa_exptotal msa_expadjtotal msa_p10netrev ///
	msa_expproffees msa_exppurchserv msa_expsupplies msa_explease msa_expother ///
	msic_totapatdays msic_adultpatdays msic_pedpatdays msic_rnhrs msic_lvnhrs msic_regnhrs msic_aidehrs msic_prodhrs ///
	msic_servdisch msic_hospdisch msic_availbeds_ave msic_mcarepatdays msic_mcalpatdays msic_indigpatdays msic_thirdpatdays msic_othpaypatdays ///
	msic_mcareinpatrev msic_mcareinpatadj msic_mcalinpatrev msic_mcalinpatadj msic_othinpatrev msic_othinpatadj msic_indiginpatrev msic_indiginpatadj ///
	msic_thirdinpatrev msic_thirdinpatadj msic_othpayinpatrev msic_othpayinpatadj msic_totinpatrev msic_totinpatadj msic_p10unitsserv msic_p10adjdirexp ///
	msic_p10alloccost msic_p10patcarecost msic_p10renetcosts msic_p10adjprofcomp msic_p10netprof msic_expsalaries msic_expbenefits msic_exptotal msic_expadjtotal msic_p10netrev ///
	msic_expproffees msic_exppurchserv msic_expsupplies msic_explease msic_expother ///
	tot_totapatdays tot_adultpatdays tot_pedpatdays tot_rnhrs tot_lvnhrs tot_regnhrs tot_aidehrs tot_prodhrs ///
	tot_servdisch tot_hospdisch tot_availbeds_ave tot_totinpatrev tot_totinpatadj tot_p10adjdirexp ///
	tot_p10alloccost tot_p10patcarecost tot_p10renetcosts tot_p10adjprofcomp tot_p10netprof tot_expsalaries tot_expbenefits tot_exptotal tot_expadjtotal tot_p10netrev ///
	cic_rnhrs cic_lvnhrs cic_regnhrs cic_aidehrs cic_prodhrs ///
	defo_totapatdays defo_adultpatdays defo_pedpatdays defo_rnhrs defo_lvnhrs defo_regnhrs defo_aidehrs defo_prodhrs ///
	defo_servdisch defo_hospdisch defo_availbeds_ave defo_totinpatrev defo_totinpatadj ///
	peda_rnhrs peda_lvnhrs peda_totapatdays peda_regnhrs peda_aidehrs peda_prodhrs ///
	obst_rnhrs obst_lvnhrs obst_totapatdays obst_regnhrs obst_aidehrs obst_prodhrs ///
	reh_rnhrs reh_lvnhrs reh_totapatdays reh_regnhrs reh_aidehrs reh_prodhrs ///
	otha_rnhrs otha_lvnhrs otha_totapatdays otha_regnhrs otha_aidehrs otha_prodhrs ///
	pic_totapatdays pic_rnhrs pic_lvnhrs pic_regnhrs pic_aidehrs pic_prodhrs ///
	msa_avenursewage msa_avehrlywage msic_avenursewage msic_avehrlywage tot_avenursewage tot_avehrlywage ///
	acu_trthirdpatdays acu_mcthirdpatdays acu_mcmedicarepatdays acu_mcmedicalpatdays acu_mcindigpatdays ///
	acu_mcareinpatrev acu_mcalinpatrev acu_indiginpatrev acu_thirdinpatrev acu_othinpatrev ///
	acu_mcarepatdays acu_mcalpatdays acu_indigpatdays acu_thirdpatdays acu_othpatdays ///
	psy_mcareinpatrev psy_mcalinpatrev psy_indiginpatrev psy_thirdinpatrev psy_othinpatrev ///
	psy_mcarepatdays psy_mcalpatdays psy_indigpatdays psy_thirdpatdays psy_othpatdays ///
	cd_mcareinpatrev cd_mcalinpatrev cd_indiginpatrev cd_thirdinpatrev cd_othinpatrev ///
	cd_mcarepatdays cd_mcalpatdays cd_indigpatdays cd_thirdpatdays cd_othpatdays ///
	reb_mcareinpatrev reb_mcalinpatrev reb_indiginpatrev reb_thirdinpatrev reb_othinpatrev ///
	reb_mcarepatdays reb_mcalpatdays reb_indigpatdays reb_thirdpatdays reb_othpatdays ///
	lt_mcareinpatrev lt_mcalinpatrev lt_indiginpatrev lt_thirdinpatrev lt_othinpatrev ///
	lt_mcarepatdays lt_mcalpatdays lt_indigpatdays lt_thirdpatdays lt_othpatdays ///
	oth_mcareinpatrev oth_mcalinpatrev oth_indiginpatrev oth_thirdinpatrev oth_othinpatrev ///
	oth_mcarepatdays oth_mcalpatdays oth_indigpatdays oth_thirdpatdays oth_othpatdays ///	
	amb_rnhrs amb_lvnhrs anc_rnhrs anc_lvnhrs msa_staffbeds_ave msic_staffbeds_ave tot_staffbeds_ave ///
	ctrl_type chnp_ctrl inv_ctrl govt_ctrl teaching smrur dsh gac ctrltype_co ctrltype_cityco ///
	msic_alloc* msa_alloc* *_inpatunits *_outpatunits ///
	msic_phys* msa_phys* tot_phys* *_curr *_prior *_begbal *_endbal *_addpurch *_adddonat *_transfer *_dispret ///
	aero_* *_mdhosp_bc *_mdhosp_be *_mdhosp_oth *_mdnon_bc *_mdnon_be *_mdnon_oth *_residents *_fellows ///
	lab_phys* *_physjoint *_physcont *_physrent *_physindep *_physagency *_physsalary *_physother ///
	physcont_* ///
	calendar_year1 calendar_year2 cy_year1_days cy_year2_days rep_days_elaps rep_beg_date rep_end_date
	duplicates tag oshpd_facnum rep_beg_date rep_end_date, g(dup)
	bysort oshpd_facnum rep_beg_date rep_end_date: drop if dup != 0 & _n != 1
	drop dup
	expand 2
	bysort oshpd_facnum rep_beg_date rep_end_date: drop if _n != 1 & calendar_year1 == calendar_year2
	g cy_year1_wt = cy_year1_days/rep_days_elaps
	g cy_year2_wt = cy_year2_days/rep_days_elaps
	
	g cy_days = .
	bysort oshpd_facnum rep_beg_date rep_end_date: replace cy_days = cy_year1_days if _n == 1
	bysort oshpd_facnum rep_beg_date rep_end_date: replace cy_days = cy_year2_days if _n == 2
			
	foreach var of varlist msa_mgmthrs msa_techhrs msa_mphrs msa_envhrs msa_clerhrs msa_othhrs ///
	msa_rnhrlywage msa_lvnhrlywage msa_regnhrlywage msa_aidehrlywage msa_mgmthrlywage msa_techhrlywage msa_mphrlywage msa_envhrlywage msa_clerhrlywage msa_othhrlywage ///
	cic_mgmthrs cic_techhrs cic_physhrs cic_mphrs cic_envhrs cic_clerhrs cic_othhrs ///
cic_rnhrlywage cic_lvnhrlywage cic_regnhrlywage cic_aidehrlywage cic_mgmthrlywage cic_techhrlywage cic_physhrlywage cic_mphrlywage cic_envhrlywage cic_clerhrlywage cic_othhrlywage ///
	msic_mgmthrs msic_techhrs msic_mphrs msic_envhrs msic_clerhrs msic_othhrs ///
	msic_mgmthrlywage msic_techhrlywage msic_mphrlywage msic_envhrlywage msic_clerhrlywage msic_othhrlywage msic_aidehrlywage msic_rnhrlywage msic_lvnhrlywage msic_regnhrlywage ///
	tot_mgmthrs tot_techhrs tot_mphrs tot_envhrs tot_clerhrs tot_othhrs ///
	tot_mgmthrlywage tot_techhrlywage tot_mphrlywage tot_envhrlywage tot_clerhrlywage tot_othhrlywage tot_aidehrlywage tot_rnhrlywage tot_lvnhrlywage tot_regnhrlywage ///
	cic_totapatdays cic_adultpatdays cic_pedpatdays cic_rnhrs cic_lvnhrs cic_regnhrs cic_aidehrs cic_prodhrs ///
	cic_servdisch cic_hospdisch cic_availbeds_ave cic_mcarepatdays cic_mcalpatdays cic_indigpatdays cic_thirdpatdays cic_othpaypatdays ///
	cic_mcareinpatrev cic_mcareinpatadj cic_mcalinpatrev cic_mcalinpatadj cic_othinpatrev cic_othinpatadj cic_indiginpatrev cic_indiginpatadj ///
	cic_thirdinpatrev cic_thirdinpatadj cic_othpayinpatrev cic_othpayinpatadj cic_totinpatrev cic_totinpatadj ///
	msa_totapatdays msa_adultpatdays msa_pedpatdays msa_rnhrs msa_lvnhrs msa_regnhrs msa_aidehrs msa_prodhrs ///
	msa_servdisch msa_hospdisch msa_availbeds_ave msa_mcarepatdays msa_mcalpatdays msa_indigpatdays msa_thirdpatdays msa_othpaypatdays ///
	msa_mcareinpatrev msa_mcareinpatadj msa_mcalinpatrev msa_mcalinpatadj msa_othinpatrev msa_othinpatadj msa_indiginpatrev msa_indiginpatadj ///
	msa_thirdinpatrev msa_thirdinpatadj msa_othpayinpatrev msa_othpayinpatadj msa_totinpatrev msa_totinpatadj msa_p10unitsserv msa_p10adjdirexp ///
	msa_p10alloccost msa_p10patcarecost msa_p10renetcosts msa_p10adjprofcomp msa_p10netprof msa_expsalaries msa_expbenefits msa_exptotal msa_expadjtotal msa_p10netrev ///
	msa_expproffees msa_exppurchserv msa_expsupplies msa_explease msa_expother ///
	msic_totapatdays msic_adultpatdays msic_pedpatdays msic_rnhrs msic_lvnhrs msic_regnhrs msic_aidehrs msic_prodhrs ///
	msic_servdisch msic_hospdisch msic_availbeds_ave msic_mcarepatdays msic_mcalpatdays msic_indigpatdays msic_thirdpatdays msic_othpaypatdays ///
	msic_mcareinpatrev msic_mcareinpatadj msic_mcalinpatrev msic_mcalinpatadj msic_othinpatrev msic_othinpatadj msic_indiginpatrev msic_indiginpatadj ///
	msic_thirdinpatrev msic_thirdinpatadj msic_othpayinpatrev msic_othpayinpatadj msic_totinpatrev msic_totinpatadj msic_p10unitsserv msic_p10adjdirexp ///
	msic_p10alloccost msic_p10patcarecost msic_p10renetcosts msic_p10adjprofcomp msic_p10netprof msic_expsalaries msic_expbenefits msic_exptotal msic_expadjtotal msic_p10netrev ///
	msic_expproffees msic_exppurchserv msic_expsupplies msic_explease msic_expother ///
	tot_totapatdays tot_adultpatdays tot_pedpatdays tot_rnhrs tot_lvnhrs tot_regnhrs tot_aidehrs tot_prodhrs ///
	tot_servdisch tot_hospdisch tot_availbeds_ave tot_totinpatrev tot_totinpatadj tot_p10adjdirexp ///
	tot_p10alloccost tot_p10patcarecost tot_p10renetcosts tot_p10adjprofcomp tot_p10netprof tot_expsalaries tot_expbenefits tot_exptotal tot_expadjtotal tot_p10netrev ///
	defo_totapatdays defo_adultpatdays defo_pedpatdays defo_rnhrs defo_lvnhrs defo_regnhrs defo_aidehrs defo_prodhrs ///
	defo_servdisch defo_hospdisch defo_availbeds_ave defo_totinpatrev defo_totinpatadj ///
	peda_rnhrs peda_lvnhrs peda_totapatdays peda_regnhrs peda_aidehrs peda_prodhrs ///
	obst_rnhrs obst_lvnhrs obst_totapatdays obst_regnhrs obst_aidehrs obst_prodhrs ///
	reh_rnhrs reh_lvnhrs reh_totapatdays reh_regnhrs reh_aidehrs reh_prodhrs ///
	otha_rnhrs otha_lvnhrs otha_totapatdays otha_regnhrs otha_aidehrs otha_prodhrs ///
	pic_totapatdays pic_rnhrs pic_lvnhrs pic_regnhrs pic_aidehrs pic_prodhrs ///
	msa_avenursewage msa_avehrlywage msic_avenursewage msic_avehrlywage tot_avenursewage tot_avehrlywage ///
	acu_trthirdpatdays acu_mcthirdpatdays acu_mcmedicarepatdays acu_mcmedicalpatdays acu_mcindigpatdays ///
	acu_mcareinpatrev acu_mcalinpatrev acu_indiginpatrev acu_thirdinpatrev acu_othinpatrev ///
	acu_mcarepatdays acu_mcalpatdays acu_indigpatdays acu_thirdpatdays acu_othpatdays ///
	psy_mcareinpatrev psy_mcalinpatrev psy_indiginpatrev psy_thirdinpatrev psy_othinpatrev ///
	psy_mcarepatdays psy_mcalpatdays psy_indigpatdays psy_thirdpatdays psy_othpatdays ///
	cd_mcareinpatrev cd_mcalinpatrev cd_indiginpatrev cd_thirdinpatrev cd_othinpatrev ///
	cd_mcarepatdays cd_mcalpatdays cd_indigpatdays cd_thirdpatdays cd_othpatdays ///
	reb_mcareinpatrev reb_mcalinpatrev reb_indiginpatrev reb_thirdinpatrev reb_othinpatrev ///
	reb_mcarepatdays reb_mcalpatdays reb_indigpatdays reb_thirdpatdays reb_othpatdays ///
	lt_mcareinpatrev lt_mcalinpatrev lt_indiginpatrev lt_thirdinpatrev lt_othinpatrev ///
	lt_mcarepatdays lt_mcalpatdays lt_indigpatdays lt_thirdpatdays lt_othpatdays ///
	oth_mcareinpatrev oth_mcalinpatrev oth_indiginpatrev oth_thirdinpatrev oth_othinpatrev ///
	oth_mcarepatdays oth_mcalpatdays oth_indigpatdays oth_thirdpatdays oth_othpatdays ///
	amb_rnhrs amb_lvnhrs anc_rnhrs anc_lvnhrs tacmiv msa_staffbeds_ave msic_staffbeds_ave tot_staffbeds_ave *_mdhosp_bc *_mdhosp_be *_mdhosp_oth *_mdnon_bc *_mdnon_be *_mdnon_oth *_residents *_fellows msa_alloc* msic_alloc* *_inpatunits *_outpatunits msic_phys* msa_phys* tot_phys* *_curr *_prior *_begbal *_endbal *_addpurch *_adddonat *_transfer *_dispret ///
	{
		g `var'_new = .
		bysort oshpd_facnum rep_beg_date rep_end_date: replace `var'_new = `var'*cy_year1_wt if _n == 1
		bysort oshpd_facnum rep_beg_date rep_end_date: replace `var'_new = `var'*cy_year2_wt if _n == 2
		drop `var'
	}
			
	g calendar_year = .
	bysort oshpd_facnum rep_beg_date rep_end_date: replace calendar_year = calendar_year1 if _n == 1
	bysort oshpd_facnum rep_beg_date rep_end_date: replace calendar_year = calendar_year2 if _n == 2
		
	foreach var of varlist medicare_pnum provname zipcode ownername address city zipcode healthsys physcont_* {
		g `var'_new = ""
		bysort oshpd_facnum calendar_year: replace `var'_new = `var' if _n == 1
		bysort oshpd_facnum calendar_year: replace `var'_new = `var'_new[_n-1] if `var'_new == "" & `var'_new[_n-1] != ""
		drop `var'
		rename `var'_new `var'
	}
	
	foreach var of varlist ctrl_type chnp_ctrl inv_ctrl govt_ctrl teaching smrur dsh gac ctrltype_co ctrltype_cityco *_physjoint *_physcont *_physrent *_physindep *_physagency *_physsalary *_physother  {
		g `var'_new = .
		bysort oshpd_facnum calendar_year: replace `var'_new = `var' if _n == 1
		bysort oshpd_facnum calendar_year: replace `var'_new = `var'_new[_n-1] if `var'_new == . & `var'_new[_n-1] != .
		drop `var'
		rename `var'_new `var'
	}
			
	collapse (sum) cy_days msa_mgmthrs msa_techhrs msa_mphrs msa_envhrs msa_clerhrs msa_othhrs ///
	msa_rnhrlywage msa_lvnhrlywage msa_regnhrlywage msa_aidehrlywage msa_mgmthrlywage msa_techhrlywage msa_mphrlywage msa_envhrlywage msa_clerhrlywage msa_othhrlywage ///
	cic_mgmthrs cic_techhrs cic_physhrs cic_mphrs cic_envhrs cic_clerhrs cic_othhrs ///
cic_rnhrlywage cic_lvnhrlywage cic_regnhrlywage cic_aidehrlywage cic_mgmthrlywage cic_techhrlywage cic_physhrlywage cic_mphrlywage cic_envhrlywage cic_clerhrlywage cic_othhrlywage ///
	msic_mgmthrs msic_techhrs msic_mphrs msic_envhrs msic_clerhrs msic_othhrs ///
	msic_mgmthrlywage msic_techhrlywage msic_mphrlywage msic_envhrlywage msic_clerhrlywage msic_othhrlywage msic_aidehrlywage msic_rnhrlywage msic_lvnhrlywage msic_regnhrlywage ///
	tot_mgmthrs tot_techhrs tot_mphrs tot_envhrs tot_clerhrs tot_othhrs ///
	tot_mgmthrlywage tot_techhrlywage tot_mphrlywage tot_envhrlywage tot_clerhrlywage tot_othhrlywage tot_aidehrlywage tot_rnhrlywage tot_lvnhrlywage tot_regnhrlywage ///
	cic_totapatdays cic_adultpatdays cic_pedpatdays cic_rnhrs cic_lvnhrs cic_regnhrs cic_aidehrs cic_prodhrs ///
	cic_servdisch cic_hospdisch cic_availbeds_ave cic_mcarepatdays cic_mcalpatdays cic_indigpatdays cic_thirdpatdays cic_othpaypatdays ///
	cic_mcareinpatrev cic_mcareinpatadj cic_mcalinpatrev cic_mcalinpatadj cic_othinpatrev cic_othinpatadj cic_indiginpatrev cic_indiginpatadj ///
	cic_thirdinpatrev cic_thirdinpatadj cic_othpayinpatrev cic_othpayinpatadj cic_totinpatrev cic_totinpatadj ///
	msa_totapatdays msa_adultpatdays msa_pedpatdays msa_rnhrs msa_lvnhrs msa_regnhrs msa_aidehrs msa_prodhrs ///
	msa_servdisch msa_hospdisch msa_availbeds_ave msa_mcarepatdays msa_mcalpatdays msa_indigpatdays msa_thirdpatdays msa_othpaypatdays ///
	msa_mcareinpatrev msa_mcareinpatadj msa_mcalinpatrev msa_mcalinpatadj msa_othinpatrev msa_othinpatadj msa_indiginpatrev msa_indiginpatadj ///
	msa_thirdinpatrev msa_thirdinpatadj msa_othpayinpatrev msa_othpayinpatadj msa_totinpatrev msa_totinpatadj msa_p10unitsserv msa_p10adjdirexp ///
	msa_p10alloccost msa_p10patcarecost msa_p10renetcosts msa_p10adjprofcomp msa_p10netprof msa_expsalaries msa_expbenefits msa_exptotal msa_expadjtotal msa_p10netrev ///
	msa_expproffees msa_exppurchserv msa_expsupplies msa_explease msa_expother ///
	msic_totapatdays msic_adultpatdays msic_pedpatdays msic_rnhrs msic_lvnhrs msic_regnhrs msic_aidehrs msic_prodhrs ///
	msic_servdisch msic_hospdisch msic_availbeds_ave msic_mcarepatdays msic_mcalpatdays msic_indigpatdays msic_thirdpatdays msic_othpaypatdays ///
	msic_mcareinpatrev msic_mcareinpatadj msic_mcalinpatrev msic_mcalinpatadj msic_othinpatrev msic_othinpatadj msic_indiginpatrev msic_indiginpatadj ///
	msic_thirdinpatrev msic_thirdinpatadj msic_othpayinpatrev msic_othpayinpatadj msic_totinpatrev msic_totinpatadj msic_p10unitsserv msic_p10adjdirexp ///
	msic_p10alloccost msic_p10patcarecost msic_p10renetcosts msic_p10adjprofcomp msic_p10netprof msic_expsalaries msic_expbenefits msic_exptotal msic_expadjtotal msic_p10netrev ///
	msic_expproffees msic_exppurchserv msic_expsupplies msic_explease msic_expother ///
	tot_totapatdays tot_adultpatdays tot_pedpatdays tot_rnhrs tot_lvnhrs tot_regnhrs tot_aidehrs tot_prodhrs ///
	tot_servdisch tot_hospdisch tot_availbeds_ave tot_totinpatrev tot_totinpatadj tot_p10adjdirexp ///
	tot_p10alloccost tot_p10patcarecost tot_p10renetcosts tot_p10adjprofcomp tot_p10netprof tot_expsalaries tot_expbenefits tot_exptotal tot_expadjtotal tot_p10netrev ///
	defo_totapatdays defo_adultpatdays defo_pedpatdays defo_rnhrs defo_lvnhrs defo_regnhrs defo_aidehrs defo_prodhrs ///
	defo_servdisch defo_hospdisch defo_availbeds_ave defo_totinpatrev defo_totinpatadj ///
	peda_rnhrs peda_lvnhrs peda_totapatdays peda_regnhrs peda_aidehrs peda_prodhrs ///
	obst_rnhrs obst_lvnhrs obst_totapatdays obst_regnhrs obst_aidehrs obst_prodhrs ///
	reh_rnhrs reh_lvnhrs reh_totapatdays reh_regnhrs reh_aidehrs reh_prodhrs ///
	otha_rnhrs otha_lvnhrs otha_totapatdays otha_regnhrs otha_aidehrs otha_prodhrs ///
	pic_totapatdays pic_rnhrs pic_lvnhrs pic_regnhrs pic_aidehrs pic_prodhrs ///
	msa_avenursewage msa_avehrlywage msic_avenursewage msic_avehrlywage tot_avenursewage tot_avehrlywage ///
	acu_trthirdpatdays acu_mcthirdpatdays acu_mcmedicarepatdays acu_mcmedicalpatdays acu_mcindigpatdays ///
	acu_mcareinpatrev acu_mcalinpatrev acu_indiginpatrev acu_thirdinpatrev acu_othinpatrev ///
	acu_mcarepatdays acu_mcalpatdays acu_indigpatdays acu_thirdpatdays acu_othpatdays ///
	psy_mcareinpatrev psy_mcalinpatrev psy_indiginpatrev psy_thirdinpatrev psy_othinpatrev ///
	psy_mcarepatdays psy_mcalpatdays psy_indigpatdays psy_thirdpatdays psy_othpatdays ///
	cd_mcareinpatrev cd_mcalinpatrev cd_indiginpatrev cd_thirdinpatrev cd_othinpatrev ///
	cd_mcarepatdays cd_mcalpatdays cd_indigpatdays cd_thirdpatdays cd_othpatdays ///
	reb_mcareinpatrev reb_mcalinpatrev reb_indiginpatrev reb_thirdinpatrev reb_othinpatrev ///
	reb_mcarepatdays reb_mcalpatdays reb_indigpatdays reb_thirdpatdays reb_othpatdays ///
	lt_mcareinpatrev lt_mcalinpatrev lt_indiginpatrev lt_thirdinpatrev lt_othinpatrev ///
	lt_mcarepatdays lt_mcalpatdays lt_indigpatdays lt_thirdpatdays lt_othpatdays ///
	oth_mcareinpatrev oth_mcalinpatrev oth_indiginpatrev oth_thirdinpatrev oth_othinpatrev ///
	oth_mcarepatdays oth_mcalpatdays oth_indigpatdays oth_thirdpatdays oth_othpatdays ///
	amb_rnhrs amb_lvnhrs anc_rnhrs anc_lvnhrs tacmiv msa_staffbeds_ave msic_staffbeds_ave tot_staffbeds_ave *_mdhosp_bc* *_mdhosp_be* *_mdhosp_oth* *_mdnon_bc* *_mdnon_be* *_mdnon_oth* *_residents* *_fellows* ///
	msa_alloc* msic_alloc* *_inpatunits_new *_outpatunits_new msic_phys* msa_phys* tot_phys* *_curr_new *_prior_new *_begbal_new *_endbal_new *_addpurch_new *_adddonat_new *_transfer_new *_dispret_new ///
	, by(oshpd_facnum medicare_pnum provname ownername healthsys address city zipcode calendar_year ctrl_type chnp_ctrl inv_ctrl govt_ctrl teaching smrur dsh gac zipcode ctrltype_co ctrltype_cityco *_physjoint *_physcont *_physrent *_physindep *_physagency *_physsalary *_physother physcont_*)
	
	destring oshpd_facnum, replace
	merge 1:1 oshpd_facnum calendar_year using "$temp/cmi_reshape"
	drop if _m == 2
	drop _m
	
	ren *_new *
	
	// Inflation-adjusted wages

	// https://www.dir.ca.gov/oprl/CPI/EntireCCPI.PDF
	local cpi2020 285.315
	local cpi2019 280.638
	local cpi2018 272.510
	local cpi2017 262.802
	local cpi2016 255.303
	local cpi2015 249.666
	local cpi2014 246.055
	local cpi2013 241.623
	local cpi2012 238.155
	local cpi2011 232.930
	local cpi2010 226.919
	local cpi2009 224.110
	local cpi2008 224.807
	local cpi2007 217.424
	local cpi2006 210.5
	local cpi2005 202.6
	local cpi2004 195.4
	local cpi2003 190.4
	local cpi2002 186.1
	local cpi2001 181.7
	local cpi2000 174.8
	local cpi1999 168.5
	local cpi1998 163.7
	local cpi1997 160.5
	local cpi1996 157.1
	local cpi1995 154.0
	local cpi1994 151.5
	local cpi1993 149.4
	local cpi1992 145.6
	local cpi1991 140.6
	local cpi1990 135.0
	
	foreach unit in msa /*peda psya psyac obst reh defo otha*/ ///
	msic tot /*cic pic nic burn psyi oic nur sa sn psyl intc res ods*/ {
		g `unit'_avenursewage_adj = .

		forvalues x = 1990/2020 {
			replace `unit'_avenursewage_adj = `unit'_avenursewage*(`cpi1990'/`cpi`x'') if calendar_year == `x'
		}
	}
	
	// Inflation-adjusted revenues and expenses
		
	foreach var of varlist msa_rnhrlywage msa_lvnhrlywage msa_regnhrlywage msa_aidehrlywage msa_mgmthrlywage msa_techhrlywage msa_physhrlywage msa_mphrlywage msa_envhrlywage msa_clerhrlywage msa_othhrlywage ///
	cic_rnhrlywage cic_lvnhrlywage cic_regnhrlywage cic_aidehrlywage cic_mgmthrlywage cic_techhrlywage cic_physhrlywage cic_mphrlywage cic_envhrlywage cic_clerhrlywage cic_othhrlywage ///
	msic_mgmthrlywage msic_techhrlywage msic_physhrlywage msic_mphrlywage msic_envhrlywage msic_clerhrlywage msic_othhrlywage msic_aidehrlywage msic_rnhrlywage msic_lvnhrlywage msic_regnhrlywage ///
	tot_mgmthrlywage tot_techhrlywage tot_physhrlywage tot_mphrlywage tot_envhrlywage tot_clerhrlywage tot_othhrlywage tot_aidehrlywage tot_rnhrlywage tot_lvnhrlywage tot_regnhrlywage ///
	msa_mcareinpatrev msa_mcareinpatadj msa_mcalinpatrev msa_mcalinpatadj msa_othinpatrev msa_othinpatadj msa_indiginpatrev msa_indiginpatadj ///
	msa_thirdinpatrev msa_thirdinpatadj msa_othpayinpatrev msa_othpayinpatadj msa_totinpatrev msa_totinpatadj msa_p10unitsserv msa_p10adjdirexp ///
	msa_p10alloccost msa_p10patcarecost msa_p10renetcosts msa_p10adjprofcomp msa_p10netprof msa_expsalaries msa_expbenefits msa_exptotal msa_expadjtotal msa_p10netrev ///
	msa_expproffees msa_exppurchserv msa_expsupplies msa_explease msa_expother ///
	cic_mcareinpatrev cic_mcareinpatadj cic_mcalinpatrev cic_mcalinpatadj cic_othinpatrev cic_othinpatadj cic_indiginpatrev cic_indiginpatadj ///
	cic_thirdinpatrev cic_thirdinpatadj cic_othpayinpatrev cic_othpayinpatadj cic_totinpatrev cic_totinpatadj ///
	msic_mcareinpatrev msic_mcareinpatadj msic_mcalinpatrev msic_mcalinpatadj msic_othinpatrev msic_othinpatadj msic_indiginpatrev msic_indiginpatadj ///
	msic_thirdinpatrev msic_thirdinpatadj msic_othpayinpatrev msic_othpayinpatadj msic_totinpatrev msic_totinpatadj msic_p10unitsserv msic_p10adjdirexp ///
	msic_p10alloccost msic_p10patcarecost msic_p10renetcosts msic_p10adjprofcomp msic_p10netprof msic_expsalaries msic_expbenefits msic_exptotal msic_expadjtotal msic_p10netrev ///
	msic_expproffees msic_exppurchserv msic_expsupplies msic_explease msic_expother ///
	tot_totinpatrev tot_totinpatadj tot_p10adjdirexp ///
	tot_p10alloccost tot_p10patcarecost tot_p10renetcosts tot_p10adjprofcomp tot_p10netprof tot_expsalaries tot_expbenefits tot_exptotal tot_expadjtotal tot_p10netrev ///
	defo_totinpatrev defo_totinpatadj ///
	acu_mcareinpatrev acu_mcalinpatrev acu_indiginpatrev acu_thirdinpatrev acu_othinpatrev ///
	psy_mcareinpatrev psy_mcalinpatrev psy_indiginpatrev psy_thirdinpatrev psy_othinpatrev ///
	cd_mcareinpatrev cd_mcalinpatrev cd_indiginpatrev cd_thirdinpatrev cd_othinpatrev ///
	reb_mcareinpatrev reb_mcalinpatrev reb_indiginpatrev reb_thirdinpatrev reb_othinpatrev ///
	lt_mcareinpatrev lt_mcalinpatrev lt_indiginpatrev lt_thirdinpatrev lt_othinpatrev ///
	oth_mcareinpatrev oth_mcalinpatrev oth_indiginpatrev oth_thirdinpatrev oth_othinpatrev /// 
	msa_avehrlywage msic_avehrlywage tot_avehrlywage msic_alloc* msa_alloc* ///
	msic_physcomp* msic_physhrsres msic_physhrsme msic_physhrsadmin msic_physhrsnurs msic_physhrscare msic_physhrssup msic_physhrsalloc ///
	msa_physcomp* msa_physhrsres msa_physhrsme msa_physhrsadmin msa_physhrsnurs msa_physhrscare msa_physhrssup msa_physhrsalloc ///
	tot_physcomp* tot_physhrsres tot_physhrsme tot_physhrsadmin tot_physhrsnurs tot_physhrscare tot_physhrssup tot_physhrsalloc *_curr *_prior *_begbal *_endbal *_addpurch *_adddonat *_transfer *_dispret {
		g `var'_adj = . 
		
		forvalues x = 1990/2020 {
			replace `var'_adj = `var'*(`cpi1990'/`cpi`x'') if calendar_year == `x'
		}
	}
	
	replace tacmiv = . if tacmiv == 0 
			
	save "$temp/cy1988_2020_panel", replace
