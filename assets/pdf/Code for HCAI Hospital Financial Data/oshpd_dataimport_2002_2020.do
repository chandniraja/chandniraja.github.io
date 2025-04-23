clear
set more off
set type double

gl path "[[INSERT PATH HERE]]"

forvalues x = 1/18 {
	
	if `x' == 1 { // 2002-2003
		local file fy-2002-2003-28hospitaldata
		local sheet "Financial and Utilization Data"
		gl data "$path/Data/Post_2002_Excel"
		gl output "$path/Data/Processed/2002-2003"
	}
	
	if `x' == 2 { // 2003-2004 same as 2002-2003
		local file fy-2003-2004-29hospitaldata
		local sheet "Financial and Utilization Data"
		gl data "$path/Data/Post_2002_Excel"
		gl output "$path/Data/Processed/2003-2004"
	}
	
	if `x' == 3 { // 2004-2005 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2004-2005-30hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2004-2005"
	}
	
	if `x' == 4 { // 2005-2006 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2005-2006-31hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2005-2006"
	}
	
	if `x' == 5 { // 2006-2007 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2006-2007-32hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2006-2007"
	}
	
	if `x' == 6 { // 2007-2008 modified from 2002-2003 structure 
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2007-2008-33hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2007-2008"
	}
	
	if `x' == 7 { // 2008-2009 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2008-2009-34hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2008-2009"
	}
	
	if `x' == 8 { // 2009-2010 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2009-2010-35hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2009-2010"
	}
	
	if `x' == 9 { // 2010-2011 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2010-2011-36hospitaladr51612_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2010-2011"
	}
	
	if `x' == 10 { // 2011-2012 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file fy-2011-2012-37hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2011-2012"
	}
	
	if `x' == 11 { // 2012-2013 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 38hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2012-2013"
	}
	
	if `x' == 12 { // 2013-2014 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 39hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2013-2014"
	}
	
	if `x' == 13 { // 2014-2015 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 40hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2014-2015"
	}
	
	if `x' == 14 { // 2015-2016 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 41hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2015-2016"
	}
	
	if `x' == 15 { // 2016-2017 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 42hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2016-2017"
	}
	
	if `x' == 16 { // 2017-2018 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 43hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2017-2018"
	}
	
	if `x' == 17 { // 2018-2019 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 44hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2018-2019"
	}
	
	if `x' == 18 { // 2019-2020 modified from 2002-2003 structure
		// everything can be done with Vlookup except the report dates which are copy pasted 
		local file 45hospitaldata_forimport //_modified creates the restructured data and _forimport is for import since _modified is too large of a file
		local sheet "Vlookup Transposed"
		gl data "$path/Data/Post_2002_Excel/Modified"
		gl output "$path/Data/Processed/2019-2020"
	}

//Page 0 (general info)
import excel ///
desc_date=B ///
provname=C state_facnum=D dba=E phone=F medical_pnum=G medical_nc_pnum=H medicare_pnum=I address=J ///
city=K zipcode=L mailingaddress=M mailingcity=N mailingzip=O ceo=P title=Q cmpltdby=R cmpltdby_phone=S ///
cmpltdby_fax=T cmpltdby_address=U cmpltdby_city=V cmpltdby_state=W cmpltdby_zip=X ownername=Y prov_prevname=Z ///
rep_beg=AA rep_end=AB medical_beg=AC medical_end=AD ///
using "$data/`file'.xlsx", sheet("`sheet'") allstring clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 0
drop if provname == "" // last line
drop if (state_facnum == "" | state_facnum == "0")

if `x' == 3 | `x' == 4 | `x' == 6 {
	destring desc_date, replace
	g desc_date2 = desc_date + td(30dec1899)
	drop desc_date
	ren desc_date2 desc_date
	tostring desc_date, replace
}

save "$output/page0", replace

//Page 1 (hospital desc - only through line 1790 for now)
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
licbeds_end=AH ctrltype_church=CQ caretype_stgen=FC /// line 5
availbeds_ave=AI ctrltype_npcorp=CR caretype_stchild=FD /// line 10
staffbeds_ave=AJ ctrltype_npoth=CS caretype_stpsy=FE /// line 15
hsanum=AK ctrltype_ind=CT caretype_stspec=FF /// line 20
ctrltype_ptr=CU caretype_ltgen=FG /// line 25
traumactr=AL ctrltype_corp=CV caretype_ltchild=FH /// line 30
ctrlstate=CW caretype_ltpsy=FI /// line 35
ctrlcounty=CX caretype_ltspec=FJ /// line 40 
ctrlcitycounty=CY /// line 45
ctrlcity=CZ /// line 50
ctrldistrict=DA /// line 55
govt_medicare=AP ppp_hospital=DB cov24_er=FK /// line 60
govt_medical=AQ ppp_parentorg=DC cov24_psyer=FL /// line 65
govt_crippled=AR ppp_statecont=DD cov24_phys=FM /// line 70
govt_shortdoyle=AS ppp_fedcont=DE cov24_pharma=FN /// line 75
govt_champus=AT ppp_foundcont=DF cov24_or=FO /// line 80
govt_ctyindig=AU ppp_complan=DG cov24_lab=FP /// line 85
cov24_xray=FQ /// line 90
cov24_anesth=FR /// line 95
aero_mdhosp_bc=AZ aero_mdhosp_be=DL aero_mdhosp_oth=FS aero_mdnon_bc=HJ aero_mdnon_be=JA aero_mdnon_oth=KR aero_residents=MI aero_fellows=NZ ///
alle_mdhosp_bc=BA alle_mdhosp_be=DM alle_mdhosp_oth=FT alle_mdnon_bc=HK alle_mdnon_be=JB alle_mdnon_oth=KS alle_residents=MJ alle_fellows=OA ///
anes_mdhosp_bc=BB anes_mdhosp_be=DN anes_mdhosp_oth=FU anes_mdnon_bc=HL anes_mdnon_be=JC anes_mdnon_oth=KT anes_residents=MK anes_fellows=OB ///
cardio_mdhosp_bc=BC cardio_mdhosp_be=DO cardio_mdhosp_oth=FV cardio_mdnon_bc=HM cardio_mdnon_be=JD cardio_mdnon_oth=KU cardio_residents=ML cardio_fellows=OC ///
chpsy_mdhosp_bc=BD chpsy_mdhosp_be=DP chpsy_mdhosp_oth=FW chpsy_mdnon_bc=HN chpsy_mdnon_be=JE chpsy_mdnon_oth=KV chpsy_residents=MM chpsy_fellows=OD ///
colrec_mdhosp_bc=BE colrec_mdhosp_be=DQ colrec_mdhosp_oth=FX colrec_mdnon_bc=HO colrec_mdnon_be=JF colrec_mdnon_oth=KW colrec_residents=MN colrec_fellows=OE ///
dent_mdhosp_bc=BF dent_mdhosp_be=DR dent_mdhosp_oth=FY dent_mdnon_bc=HP dent_mdnon_be=JG dent_mdnon_oth=KX dent_residents=MO dent_fellows=OF ///
derm_mdhosp_bc=BG derm_mdhosp_be=DS derm_mdhosp_oth=FZ derm_mdnon_bc=HQ derm_mdnon_be=JH derm_mdnon_oth=KY derm_residents=MP derm_fellows=OG ///
dirad_mdhosp_bc=BH dirad_mdhosp_be=DT dirad_mdhosp_oth=GA dirad_mdnon_bc=HR dirad_mdnon_be=JI dirad_mdnon_oth=KZ dirad_residents=MQ dirad_fellows=OH ///
forpa_mdhosp_bc=BI forpa_mdhosp_be=DU forpa_mdhosp_oth=GB forpa_mdnon_bc=HS forpa_mdnon_be=JJ forpa_mdnon_oth=LA forpa_residents=MR forpa_fellows=OI ///
gastro_mdhosp_bc=BJ gastro_mdhosp_be=DV gastro_mdhosp_oth=GC gastro_mdnon_bc=HT gastro_mdnon_be=JK gastro_mdnon_oth=LB gastro_residents=MS gastro_fellows=OJ ///
genpr_mdhosp_bc=BK genpr_mdhosp_be=DW genpr_mdhosp_oth=GD genpr_mdnon_bc=HU genpr_mdnon_be=JL genpr_mdnon_oth=LC genpr_residents=MT genpr_fellows=OK ///
genmed_mdhosp_bc=BL genmed_mdhosp_be=DX genmed_mdhosp_oth=GE genmed_mdnon_bc=HV genmed_mdnon_be=JM genmed_mdnon_oth=LD genmed_residents=MU genmed_fellows=OL ///
gensur_mdhosp_bc=BM gensur_mdhosp_be=DY gensur_mdhosp_oth=GF gensur_mdnon_bc=HW gensur_mdnon_be=JN gensur_mdnon_oth=LE gensur_residents=MV gensur_fellows=OM ///
intmed_mdhosp_bc=BN intmed_mdhosp_be=DZ intmed_mdhosp_oth=GG intmed_mdnon_bc=HX intmed_mdnon_be=JO intmed_mdnon_oth=LF intmed_residents=MW intmed_fellows=ON ///
neusur_mdhosp_bc=BO neusur_mdhosp_be=EA neusur_mdhosp_oth=GH neusur_mdnon_bc=HY neusur_mdnon_be=JP neusur_mdnon_oth=LG neusur_residents=MX neusur_fellows=OO ///
neuro_mdhosp_bc=BP neuro_mdhosp_be=EB neuro_mdhosp_oth=GI neuro_mdnon_bc=HZ neuro_mdnon_be=JQ neuro_mdnon_oth=LH neuro_residents=MY neuro_fellows=OP ///
nucmed_mdhosp_bc=BQ nucmed_mdhosp_be=EC nucmed_mdhosp_oth=GJ nucmed_mdnon_bc=IA nucmed_mdnon_be=JR nucmed_mdnon_oth=LI nucmed_residents=MZ nucmed_fellows=OQ ///
obgyn_mdhosp_bc=BR obgyn_mdhosp_be=ED obgyn_mdhosp_oth=GK obgyn_mdnon_bc=IB obgyn_mdnon_be=JS obgyn_mdnon_oth=LJ obgyn_residents=NA obgyn_fellows=OR ///
ocmed_mdhosp_bc=BS ocmed_mdhosp_be=EE ocmed_mdhosp_oth=GL ocmed_mdnon_bc=IC ocmed_mdnon_be=JT ocmed_mdnon_oth=LK ocmed_residents=NB ocmed_fellows=OS ///
onco_mdhosp_bc=BT onco_mdhosp_be=EF onco_mdhosp_oth=GM onco_mdnon_bc=ID onco_mdnon_be=JU onco_mdnon_oth=LL onco_residents=NC onco_fellows=OT ///
ophth_mdhosp_bc=BU ophth_mdhosp_be=EG ophth_mdhosp_oth=GN ophth_mdnon_bc=IE ophth_mdnon_be=JV ophth_mdnon_oth=LM ophth_residents=ND ophth_fellows=OU ///
orsurg_mdhosp_bc=BV orsurg_mdhosp_be=EH orsurg_mdhosp_oth=GO orsurg_mdnon_bc=IF orsurg_mdnon_be=JW orsurg_mdnon_oth=LN orsurg_residents=NE orsurg_fellows=OV ///
ortho_mdhosp_bc=BW ortho_mdhosp_be=EI ortho_mdhosp_oth=GP ortho_mdnon_bc=IG ortho_mdnon_be=JX ortho_mdnon_oth=LO ortho_residents=NF ortho_fellows=OW ///
otolar_mdhosp_bc=BX otolar_mdhosp_be=EJ otolar_mdhosp_oth=GQ otolar_mdnon_bc=IH otolar_mdnon_be=JY otolar_mdnon_oth=LP otolar_residents=NG otolar_fellows=OX ///
patho_mdhosp_bc=BY patho_mdhosp_be=EK patho_mdhosp_oth=GR patho_mdnon_bc=II patho_mdnon_be=JZ patho_mdnon_oth=LQ patho_residents=NH patho_fellows=OY ///
pedall_mdhosp_bc=BZ pedall_mdhosp_be=EL pedall_mdhosp_oth=GS pedall_mdnon_bc=IJ pedall_mdnon_be=KA pedall_mdnon_oth=LR pedall_residents=NI pedall_fellows=OZ ///
pedcar_mdhosp_bc=CA pedcar_mdhosp_be=EM pedcar_mdhosp_oth=GT pedcar_mdnon_bc=IK pedcar_mdnon_be=KB pedcar_mdnon_oth=LS pedcar_residents=NJ pedcar_fellows=PA ///
pedsurg_mdhosp_bc=CB pedsurg_mdhosp_be=EN pedsurg_mdhosp_oth=GU pedsurg_mdnon_bc=IL pedsurg_mdnon_be=KC pedsurg_mdnon_oth=LT pedsurg_residents=NK pedsurg_fellows=PB ///
pedmed_mdhosp_bc=CC pedmed_mdhosp_be=EO pedmed_mdhosp_oth=GV pedmed_mdnon_bc=IM pedmed_mdnon_be=KD pedmed_mdnon_oth=LU pedmed_residents=NL pedmed_fellows=PC ///
rehab_mdhosp_bc=CD rehab_mdhosp_be=EP rehab_mdhosp_oth=GW rehab_mdnon_bc=IN rehab_mdnon_be=KE rehab_mdnon_oth=LV rehab_residents=NM rehab_fellows=PD ///
plast_mdhosp_bc=CE plast_mdhosp_be=EQ plast_mdhosp_oth=GX plast_mdnon_bc=IO plast_mdnon_be=KF plast_mdnon_oth=LW plast_residents=NN plast_fellows=PE ///
podi_mdhosp_bc=CF podi_mdhosp_be=ER podi_mdhosp_oth=GY podi_mdnon_bc=IP podi_mdnon_be=KG podi_mdnon_oth=LX podi_residents=NO podi_fellows=PF ///
psych_mdhosp_bc=CG psych_mdhosp_be=ES psych_mdhosp_oth=GZ psych_mdnon_bc=IQ psych_mdnon_be=KH psych_mdnon_oth=LY psych_residents=NP psych_fellows=PG ///
pubhe_mdhosp_bc=CH pubhe_mdhosp_be=ET pubhe_mdhosp_oth=HA pubhe_mdnon_bc=IR pubhe_mdnon_be=KI pubhe_mdnon_oth=LZ pubhe_residents=NQ pubhe_fellows=PH ///
pulm_mdhosp_bc=CI pulm_mdhosp_be=EU pulm_mdhosp_oth=HB pulm_mdnon_bc=IS pulm_mdnon_be=KJ pulm_mdnon_oth=MA pulm_residents=NR pulm_fellows=PI ///
radio_mdhosp_bc=CJ radio_mdhosp_be=EV radio_mdhosp_oth=HC radio_mdnon_bc=IT radio_mdnon_be=KK radio_mdnon_oth=MB radio_residents=NS radio_fellows=PJ ///
thera_mdhosp_bc=CK thera_mdhosp_be=EW thera_mdhosp_oth=HD thera_mdnon_bc=IU thera_mdnon_be=KL thera_mdnon_oth=MC thera_residents=NT thera_fellows=PK ///
thora_mdhosp_bc=CL thora_mdhosp_be=EX thora_mdhosp_oth=HE thora_mdnon_bc=IV thora_mdnon_be=KM thora_mdnon_oth=MD thora_residents=NU thora_fellows=PL ///
urol_mdhosp_bc=CM urol_mdhosp_be=EY urol_mdhosp_oth=HF urol_mdnon_bc=IW urol_mdnon_be=KN urol_mdnon_oth=ME urol_residents=NV urol_fellows=PM ///
vasc_mdhosp_bc=CN vasc_mdhosp_be=EZ vasc_mdhosp_oth=HG vasc_mdnon_bc=IX vasc_mdnon_be=KO vasc_mdnon_oth=MF vasc_residents=NW vasc_fellows=PN ///
oth_mdhosp_bc=CO oth_mdhosp_be=FA oth_mdhosp_oth=HH oth_mdnon_bc=IY oth_mdnon_be=KP oth_mdnon_oth=MG oth_residents=NX oth_fellows=PO ///
tot_mdhosp_bc=CP tot_mdhosp_be=FB tot_mdhosp_oth=HI tot_mdnon_bc=IZ tot_mdnon_be=KQ tot_mdnon_oth=MH tot_residents=NY tot_fellows=PP ///
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 1
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page1", replace

//Page 3.2 (physician financial arrangements)
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
lab_physjoint=ADI lab_physcont=ADX lab_physrent=AEM lab_physindep=AFB lab_physagency=AFQ lab_physsalary=AGF lab_physother=AGU ///
radio_physjoint=ADJ radio_physcont=ADY radio_physrent=AEN radio_physindep=AFC radio_physagency=AFR radio_physsalary=AGG radio_physother=AGV ///
nuc_physjoint=ADK nuc_physcont=ADZ nuc_physrent=AEO nuc_physindep=AFD nuc_physagency=AFS nuc_physsalary=AGH nuc_physother=AGW ///
cardio_physjoint=ADL cardio_physcont=AEA cardio_physrent=AEP cardio_physindep=AFE cardio_physagency=AFT cardio_physsalary=AGI cardio_physother=AGX ///
emerg_physjoint=ADM emerg_physcont=AEB emerg_physrent=AEQ emerg_physindep=AFF emerg_physagency=AFU emerg_physsalary=AGJ emerg_physother=AGY ///
gastro_physjoint=ADN gastro_physcont=AEC gastro_physrent=AER gastro_physindep=AFG gastro_physagency=AFV gastro_physsalary=AGK gastro_physother=AGZ ///
pulm_physjoint=ADO pulm_physcont=AED pulm_physrent=AES pulm_physindep=AFH  pulm_physagency=AFW pulm_physsalary=AGL pulm_physother=AHA ///
psych_physjoint=ADP psych_physcont=AEE psych_physrent=AET psych_physindep=AFI psych_physagency=AFX psych_physsalary=AGM psych_physother=AHB ///
anes_physjoint=ADQ anes_physcont=AEF anes_physrent=AEU anes_physindep=AFJ anes_physagency=AFY anes_physsalary=AGN anes_physother=AHC ///
oth_physjoint=ADR oth_physcont=AEG oth_physrent=AEV oth_physindep=AFK oth_physagency=AFZ oth_physsalary=AGO oth_physother=AHD ///
physcont_center1=ACY physcont_center2=ACZ physcont_center3=ADA physcont_center4=ADB ///
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 32
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page32", replace

//Page 4.0, 4.1 (patient census statistics)
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
msic_licbeds_end=AQE msic_availbeds_ave=ATR msic_staffbeds_ave=AUT msic_adultpatdays=AVV msic_pedpatdays=AWW msic_servdisch=AZS msic_hospdisch=BAT /// line 5
cic_licbeds_end=AQF cic_availbeds_ave=ATS cic_staffbeds_ave=AUU cic_adultpatdays=AVW cic_pedpatdays=AWX cic_servdisch=AZT cic_hospdisch=BAU /// line 10
pic_licbeds_end=AQG pic_availbeds_ave=ATT pic_staffbeds_ave=AUV pic_adultpatdays=AVX pic_pedpatdays=AWY pic_servdisch=AZU pic_hospdisch=BAV /// line 15
nic_licbeds_end=AQH nic_availbeds_ave=ATU nic_staffbeds_ave=AUW nic_adultpatdays=AVY nic_pedpatdays=AWZ nic_servdisch=AZV nic_hospdisch=BAW /// line 20
psyi_licbeds_end=AQI psyi_availbeds_ave=ATV psyi_staffbeds_ave=AUX psyi_adultpatdays=AVZ psyi_pedpatdays=AXA psyi_servdisch=AZW psyi_hospdisch=BAX /// line 25
burn_licbeds_end=AQJ burn_availbeds_ave=ATW burn_staffbeds_ave=AUY burn_adultpatdays=AWA burn_pedpatdays=AXB burn_servdisch=AZX burn_hospdisch=BAY /// line 30
oic_licbeds_end=AQK oic_availbeds_ave=ATX oic_staffbeds_ave=AUZ oic_adultpatdays=AWB oic_pedpatdays=AXC oic_servdisch=AZY oic_hospdisch=BAZ /// line 35
defo_licbeds_end=AQL defo_availbeds_ave=ATY defo_staffbeds_ave=AVA defo_adultpatdays=AWC defo_pedpatdays=AXD defo_servdisch=AZZ defo_hospdisch=BBA /// line 40
msa_licbeds_end=AQM msa_availbeds_ave=ATZ msa_staffbeds_ave=AVB msa_adultpatdays=AWD msa_pedpatdays=AXE msa_servdisch=BAA msa_hospdisch=BBB /// line 45
peda_licbeds_end=AQN peda_availbeds_ave=AUA peda_staffbeds_ave=AVC peda_adultpatdays=AWE peda_pedpatdays=AXF peda_servdisch=BAB peda_hospdisch=BBC /// line 50
psya_licbeds_end=AQO psya_availbeds_ave=AUB psya_staffbeds_ave=AVD psya_adultpatdays=AWF psya_pedpatdays=AXG psya_servdisch=BAC psya_hospdisch=BBD /// line 55
psyac_licbeds_end=AQP psyac_availbeds_ave=AUC psyac_staffbeds_ave=AVE psyac_adultpatdays=AWG psyac_pedpatdays=AXH psyac_servdisch=BAD psyac_hospdisch=BBE /// line 60
obst_licbeds_end=AQQ obst_availbeds_ave=AUD obst_staffbeds_ave=AVF obst_adultpatdays=AWH obst_pedpatdays=AXI obst_servdisch=BAE obst_hospdisch=BBF /// line 65
altb_licbeds_end=AQR altb_availbeds_ave=AUE altb_staffbeds_ave=AVG altb_adultpatdays=AWI altb_pedpatdays=AXJ altb_servdisch=BAF altb_hospdisch=BBG /// line 70
chem_licbeds_end=AQS chem_availbeds_ave=AUF chem_staffbeds_ave=AVH chem_adultpatdays=AWJ chem_pedpatdays=AXK chem_servdisch=BAG chem_hospdisch=BBH /// line 75
reh_licbeds_end=AQT reh_availbeds_ave=AUG reh_staffbeds_ave=AVI reh_adultpatdays=AWK reh_pedpatdays=AXL reh_servdisch=BAH reh_hospdisch=BBI /// line 80
hosp_licbeds_end=AQU hosp_availbeds_ave=AUH hosp_staffbeds_ave=AVJ hosp_adultpatdays=AWL hosp_pedpatdays=AXM hosp_servdisch=BAI hosp_hospdisch=BBJ /// line 85
otha_licbeds_end=AQV otha_availbeds_ave=AUI otha_staffbeds_ave=AVK otha_adultpatdays=AWM otha_pedpatdays=AXN otha_servdisch=BAJ otha_hospdisch=BBK /// line 90
sa_licbeds_end=AQW sa_availbeds_ave=AUJ sa_staffbeds_ave=AVL sa_adultpatdays=AWN sa_pedpatdays=AXO sa_servdisch=BAK sa_hospdisch=BBL /// line 100
sap_licbeds_end=AQX sap_availbeds_ave=AUK sap_staffbeds_ave=AVM sap_adultpatdays=AWO sap_pedpatdays=AXP sap_servdisch=BAL sap_hospdisch=BBM /// line 101
sn_licbeds_end=AQY sn_availbeds_ave=AUL sn_staffbeds_ave=AVN sn_adultpatdays=AWP sn_pedpatdays=AXQ sn_servdisch=BAM sn_hospdisch=BBN /// line 105
psyl_licbeds_end=AQZ psyl_availbeds_ave=AUM psyl_staffbeds_ave=AVO psyl_adultpatdays=AWQ psyl_pedpatdays=AXR psyl_servdisch=BAN psyl_hospdisch=BBO /// line 110
intc_licbeds_end=ARA intc_availbeds_ave=AUN intc_staffbeds_ave=AVP intc_adultpatdays=AWR intc_pedpatdays=AXS intc_servdisch=BAO intc_hospdisch=BBP /// line 115
res_licbeds_end=ARB res_availbeds_ave=AUO res_staffbeds_ave=AVQ res_adultpatdays=AWS res_pedpatdays=AXT res_servdisch=BAP res_hospdisch=BBQ /// line 120
ols_licbeds_end=ARC ols_availbeds_ave=AUP ols_staffbeds_ave=AVR ols_adultpatdays=AWT ols_pedpatdays=AXU ols_servdisch=BAQ ols_hospdisch=BBR /// line 125
ods_licbeds_end=ARD ods_availbeds_ave=AUQ ods_staffbeds_ave=AVS ods_adultpatdays=AWU ods_pedpatdays=AXV ods_servdisch=BAR ods_hospdisch=BBS /// line 145
tot_licbeds_end=ARE tot_availbeds_ave=AUR tot_staffbeds_ave=AVT tot_adultpatdays=AWV tot_pedpatdays=AXW tot_servdisch=BAS tot_hospdisch=BBT /// line 150
nur_licbeds_end=ARE nur_availbeds_ave=AUR nur_staffbeds_ave=AVU /// line 155
es_inpatunits=AXX es_outpatunits=BBU /// line 160
mts_inpatunits=AXY mts_outpatunits=BBV /// line 165
pes_inpatunits=AXZ pes_outpatunits=BBW /// line 170
clinic_inpatunits=AYA clinic_outpatunits=BBX /// line 175
sat_inpatunits=AYB sat_outpatunits=BBY /// line 180
sas_inpatunits=AYC sas_outpatunits=BBZ /// line 185
ocd_outpatunits=BCA /// line 190
obs_inpatunits=AYD obs_outpatunits=BCB /// line 195
php_outpatunits=BCC /// line 200
hhc_outpatunits=BCD /// line 205
hospice_outpatunits=BCE /// line 210
adday_outpatunits=BCF /// line 215
lds_inpatunits=AYE lds_outpatunits=BCG /// line 230
surg_inpatunits=AYF surg_outpatunits=BCH /// line 235
ambsurg_inpatunits=AYG ambsurg_outpatunits=BCI /// line 240
anesth_inpatunits=AYH anesth_outpatunits=BCJ /// line 245
clinlab_inpatunits=AYI clinlab_outpatunits=BCK /// line 260
pathlab_inpatunits=AYJ pathlab_outpatunits=BCL /// line 265
blood_inpatunits=AYK blood_outpatunits=BCM /// line 270
echo_inpatunits=AYL echo_outpatunits=BCN /// line 275
cath_inpatunits=AYM cath_outpatunits=BCO /// line 280
cardio_inpatunits=AYN cardio_outpatunits=BCP /// line 285
electro_inpatunits=AYO electro_outpatunits=BCQ /// line 290
eec_inpatunits=AYP eec_outpatunits=BCR /// line 295
drad_inpatunits=AYQ drad_outpatunits=BCS /// line 3000
trad_inpatunits=AYR trad_outpatunits=BCT /// line 305
nuc_inpatunits=AYS nuc_outpatunits=BCU /// line 310
mri_inpatunits=AYT mri_outpatunits=BCV /// line 315
sassurg_inpatunits=AZH sassurg_outpatunits=BDJ /// line 505
sarsurg_inpatunits=AZI sarsurg_outpatunits=BDK /// line 515
ohmins_inpatunits=AZJ ohsurg_inpatunits=AZK /// line 520
assurg_inpatunits=AZL assurg_outpatunits=BDL /// line 535
obscare_inpatunits=AZM obscare_outpatunits=BDM /// line 545
refvis_outpatunits=BDO /// line 555
tot_outpatunits=BDP /// line 560
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 40
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page40", replace

import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
acu_trmedicarepatdays=BDU acu_mcmedicarepatdays=BEN acu_trmedicalpatdays=BFG acu_mcmedicalpatdays=BFZ acu_trindigpatdays=BGS acu_mcindigpatdays=BHL acu_trthirdpatdays=BIE acu_mcthirdpatdays=BIX acu_othindigpatdays=BJQ acu_othpaypatdays=BKJ acu_totpatdays=BLC ///
acu_trmedicaredisch=BLV acu_mcmedicaredisch=BME acu_trmedicaldisch=BMN acu_mcmedicaldisch=BMW acu_trindigdisch=BNF acu_mcindigdisch=BNO acu_trthirddisch=BNX acu_mcthirddisch=BOG acu_othindigdisch=BOP acu_othpaydisch=BOY acu_totdisch=BPH ///
psy_trmedicarepatdays=BDV psy_mcmedicarepatdays=BEO psy_trmedicalpatdays=BFH psy_mcmedicalpatdays=BGA psy_trindigpatdays=BGT psy_mcindigpatdays=BHM psy_trthirdpatdays=BIF psy_mcthirdpatdays=BIY psy_othindigpatdays=BJR psy_othpaypatdays=BKK psy_totpatdays=BLD ///
psy_trmedicaredisch=BLW psy_mcmedicaredisch=BMF psy_trmedicaldisch=BMO psy_mcmedicaldisch=BMX psy_trindigdisch=BNG psy_mcindigdisch=BNP psy_trthirddisch=BNY psy_mcthirddisch=BOH psy_othindigdisch=BOQ psy_othpaydisch=BOZ psy_totdisch=BPI ///
cd_trmedicarepatdays=BDW cd_mcmedicarepatdays=BEP cd_trmedicalpatdays=BFI cd_mcmedicalpatdays=BGB cd_trindigpatdays=BGU cd_mcindigpatdays=BHN cd_trthirdpatdays=BIG cd_mcthirdpatdays=BIZ cd_othindigpatdays=BJS cd_othpaypatdays=BKL cd_totpatdays=BLE ///
cd_trmedicaredisch=BLX cd_mcmedicaredisch=BMG cd_trmedicaldisch=BMP cd_mcmedicaldisch=BMY cd_trindigdisch=BNH cd_mcindigdisch=BNQ cd_trthirddisch=BNZ cd_mcthirddisch=BOI cd_othindigdisch=BOR cd_othpaydisch=BPA cd_totdisch=BPJ ///
reb_trmedicarepatdays=BDX reb_mcmedicarepatdays=BEQ reb_trmedicalpatdays=BFJ reb_mcmedicalpatdays=BGC reb_trindigpatdays=BGV reb_mcindigpatdays=BHO reb_trthirdpatdays=BIH reb_mcthirdpatdays=BJA reb_othindigpatdays=BJT reb_othpaypatdays=BKM reb_totpatdays=BLF ///
reb_trmedicaredisch=BLY reb_mcmedicaredisch=BMH reb_trmedicaldisch=BMQ reb_mcmedicaldisch=BMZ reb_trindigdisch=BNI reb_mcindigdisch=BNR reb_trthirddisch=BOA reb_mcthirddisch=BOJ reb_othindigdisch=BOS reb_othpaydisch=BPB reb_totdisch=BPK ///
lt_trmedicarepatdays=BDY lt_mcmedicarepatdays=BER lt_trmedicalpatdays=BFK lt_mcmedicalpatdays=BGD lt_trindigpatdays=BGW lt_mcindigpatdays=BHP lt_trthirdpatdays=BII lt_mcthirdpatdays=BJB lt_othindigpatdays=BJU lt_othpaypatdays=BKN lt_totpatdays=BLG ///
lt_trmedicaredisch=BLZ lt_mcmedicaredisch=BMI lt_trmedicaldisch=BMR lt_mcmedicaldisch=BNA lt_trindigdisch=BNJ lt_mcindigdisch=BNS lt_trthirddisch=BOB lt_mcthirddisch=BOK lt_othindigdisch=BOT lt_othpaydisch=BPC lt_totdisch=BPL ///
oth_trmedicarepatdays=BDZ oth_mcmedicarepatdays=BES oth_trmedicalpatdays=BFL oth_mcmedicalpatdays=BGE oth_trindigpatdays=BGX oth_mcindigpatdays=BHQ oth_trthirdpatdays=BIJ oth_mcthirdpatdays=BJC oth_othindigpatdays=BJV oth_othpaypatdays=BKO oth_totpatdays=BLH ///
oth_trmedicaredisch=BMA oth_mcmedicaredisch=BMJ oth_trmedicaldisch=BMS oth_mcmedicaldisch=BNB oth_trindigdisch=BNK oth_mcindigdisch=BNT oth_trthirddisch=BOC oth_mcthirddisch=BOL oth_othindigdisch=BOU oth_othpaydisch=BPD oth_totdisch=BPM ///
tot_trmedicarepatdays=BEA tot_mcmedicarepatdays=BET tot_trmedicalpatdays=BFM tot_mcmedicalpatdays=BGF tot_trindigpatdays=BGY tot_mcindigpatdays=BHR tot_trthirdpatdays=BIK tot_mcthirdpatdays=BJD tot_othindigpatdays=BJW tot_othpaypatdays=BKP tot_totpatdays=BLI ///
tot_trmedicaredisch=BMB tot_mcmedicaredisch=BMK tot_trmedicaldisch=BMT tot_mcmedicaldisch=BNC tot_trindigdisch=BNL tot_mcindigdisch=BNU tot_trthirddisch=BOD tot_mcthirddisch=BOM tot_othindigdisch=BOV tot_othpaydisch=BPE tot_totdisch=BPN ///
nura_trmedicarepatdays=BEB nura_mcmedicarepatdays=BEU nura_trmedicalpatdays=BFN nura_mcmedicalpatdays=BGG nura_trindigpatdays=BGZ nura_mcindigpatdays=BHS nura_trthirdpatdays=BIL nura_mcthirdpatdays=BJE nura_othindigpatdays=BJX nura_othpaypatdays=BKQ nura_totpatdays=BLJ ///
nura_trmedicaredisch=BMC nura_mcmedicaredisch=BML nura_trmedicaldisch=BMU nura_mcmedicaldisch=BND nura_trindigdisch=BNM nura_mcindigdisch=BNV nura_trthirddisch=BOE nura_mcthirddisch=BON nura_othindigdisch=BOW nura_othpaydisch=BPF nura_totdisch=BPO ///
pis_trmedicarepatdays=BEC pis_mcmedicarepatdays=BEV pis_trmedicalpatdays=BFO pis_mcmedicalpatdays=BGH pis_trindigpatdays=BHA pis_mcindigpatdays=BHT pis_trthirdpatdays=BIM pis_mcthirdpatdays=BJF pis_othindigpatdays=BJY pis_othpaypatdays=BKR pis_totpatdays=BLK ///
pis_trmedicaredisch=BMD pis_mcmedicaredisch=BMM pis_trmedicaldisch=BMV pis_mcmedicaldisch=BNE pis_trindigdisch=BNN pis_mcindigdisch=BNW pis_trthirddisch=BOF pis_mcthirddisch=BOO pis_othindigdisch=BOX pis_othpaydisch=BPG pis_totdisch=BPP ///
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 41
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page41", replace


//Page 5 (balance sheet, unrestricted fund)
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
land_curr=BQF land_prior=BRT ///
landimp_curr=BQG landimp_prior=BRU ///
bldgimp_curr=BQH bldgimp_prior=BRV ///
leaseimp_curr=BQI leaseimp_prior=BRW ///
equip_curr=BQJ equip_prior=BRX ///
totppe_curr=BQK totppe_prior=BRY ///
totppe_deprec_curr=BQL totppe_deprec_prior=BRZ ///
nettotppe_curr=BQM nettotppe_prior=BSA ///
construct_curr=BQN construct_prior=BSB ///
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 50
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page5", replace


//Page 5.2 (statement of changes to plant, property, and equipment)
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
land_begbal=CIG land_addpurch=CIN land_adddonat=CIU land_transfer=CJB land_dispret=CJI land_endbal=CJP ///
landimp_begbal=CIH landimp_addpurch=CIO landimp_adddonat=CIV landimp_transfer=CJC landimp_dispret=CJJ landimp_endbal=CJQ ///
bldgimp_begbal=CII bldgimp_addpurch=CIP bldgimp_adddonat=CIW bldgimp_transfer=CJD bldgimp_dispret=CJK bldgimp_endbal=CJR ///
leaseimp_begbal=CIJ leaseimp_addpurch=CIQ leaseimp_adddonat=CIX leaseimp_transfer=CJE leaseimp_dispret=CJL leaseimp_endbal=CJS ///
equip_begbal=CIK equip_addpurch=CIR equip_adddonat=CIY equip_transfer=CJF equip_dispret=CJM equip_endbal=CJT ///
construct_begbal=CIL construct_addpurch=CIS construct_adddonat=CIZ construct_transfer=CJG construct_dispret=CJN construct_endbal=CJU ///
tot_begbal=CIM tot_addpurch=CIT tot_adddonat=CJA tot_transfer=CJH tot_dispret=CJO tot_endbal=CJV ///
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 52
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page52", replace


//Page 10 (costs)
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
msic_p10unitsserv=DDK msic_p10adjdirexp=DGF msic_p10alloccost=DJM msic_p10patcarecost=DMR msic_p10avepccpunit=DPY msic_p10rerescosts=DST ///
msic_p10reeduccosts=DVW msic_p10opcosttransf=DYZ msic_p10renetcosts=ECB msic_p10avecostpunit=EFI msic_p10grossrev=EID msic_p10deducrev=ELF ///
msic_p10adjprofcomp=EOH msic_p10netrev=ERJ msic_p10averevpunit=EUM msic_p10netprof=EXG msic_p10profpunit=FAN ///
msa_p10unitsserv=DDS msa_p10adjdirexp=DGN msa_p10alloccost=DJU msa_p10patcarecost=DMZ msa_p10avepccpunit=DQG msa_p10rerescosts=DTB /// 
msa_p10reeduccosts=DWE msa_p10opcosttransf=DZH msa_p10renetcosts=ECJ msa_p10avecostpunit=EFQ msa_p10grossrev=EIL msa_p10deducrev=ELN ///
msa_p10adjprofcomp=EOP msa_p10netrev=ERR msa_p10averevpunit=EUU msa_p10netprof=EXO msa_p10profpunit=FAV ///
tot_p10adjdirexp=DHG tot_p10alloccost=DKN tot_p10patcarecost=DNS tot_p10rerescosts=DTU ///
tot_p10reeduccosts=DWX tot_p10opcosttransf=EAA tot_p10renetcosts=EDC tot_p10grossrev=EJE tot_p10deducrev=EMG ///
tot_p10adjprofcomp=EPI tot_p10netrev=ESK tot_p10netprof=EYH ///
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 10
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page10", replace



//Page 12 (patient revenue producing centers)
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
msic_trmcareinpatrev=FDI msic_mcmcareinpatrev=FIP msic_trmcalinpatrev=FNR msic_mcmcalinpatrev=FST msic_trindiginpatrev=FXW ///
msic_mcindiginpatrev=GDF msic_trthirdinpatrev=GII msic_mcthirdinpatrev=GNR msic_othindiginpatrev=GSU msic_othpayinpatrev=GYF ///
msic_totinpatrev=HDQ msic_totrev=HIL ///
cic_trmcareinpatrev=FDJ cic_mcmcareinpatrev=FIQ cic_trmcalinpatrev=FNS cic_mcmcalinpatrev=FSU cic_trindiginpatrev=FXX ///
cic_mcindiginpatrev=GDG cic_trthirdinpatrev=GIJ cic_mcthirdinpatrev=GNS cic_othindiginpatrev=GSV cic_othpayinpatrev=GYG ///
cic_totinpatrev=HDR cic_totrev=HIM ///
pic_trmcareinpatrev=FDK pic_mcmcareinpatrev=FIR pic_trmcalinpatrev=FNT pic_mcmcalinpatrev=FSV pic_trindiginpatrev=FXY ///
pic_mcindiginpatrev=GDH pic_trthirdinpatrev=GIK pic_mcthirdinpatrev=GNT pic_othindiginpatrev=GSW pic_othpayinpatrev=GYH ///
pic_totinpatrev=HDS pic_totrev=HIN ///
nic_trmcareinpatrev=FDL nic_mcmcareinpatrev=FIS nic_trmcalinpatrev=FNU nic_mcmcalinpatrev=FSW nic_trindiginpatrev=FXZ ///
nic_mcindiginpatrev=GDI nic_trthirdinpatrev=GIL nic_mcthirdinpatrev=GNU nic_othindiginpatrev=GSX nic_othpayinpatrev=GYI ///
nic_totinpatrev=HDT nic_totrev=HIO ///
psyi_trmcareinpatrev=FDM psyi_mcmcareinpatrev=FIT psyi_trmcalinpatrev=FNV psyi_mcmcalinpatrev=FSX psyi_trindiginpatrev=FYA ///
psyi_mcindiginpatrev=GDJ psyi_trthirdinpatrev=GIM psyi_mcthirdinpatrev=GNV psyi_othindiginpatrev=GSY psyi_othpayinpatrev=GYJ ///
psyi_totinpatrev=HDU psyi_totrev=HIP ///
burn_trmcareinpatrev=FDN burn_mcmcareinpatrev=FIU burn_trmcalinpatrev=FNW burn_mcmcalinpatrev=FSY burn_trindiginpatrev=FYB ///
burn_mcindiginpatrev=GDK burn_trthirdinpatrev=GIN burn_mcthirdinpatrev=GNW burn_othindiginpatrev=GSZ burn_othpayinpatrev=GYK ///
burn_totinpatrev=HDV burn_totrev=HIQ ///
oic_trmcareinpatrev=FDO oic_mcmcareinpatrev=FIV oic_trmcalinpatrev=FNX oic_mcmcalinpatrev=FSZ oic_trindiginpatrev=FYC ///
oic_mcindiginpatrev=GDL oic_trthirdinpatrev=GIO oic_mcthirdinpatrev=GNX oic_othindiginpatrev=GTA oic_othpayinpatrev=GYL ///
oic_totinpatrev=HDW oic_totrev=HIR ///
defo_trmcareinpatrev=FDP defo_mcmcareinpatrev=FIW defo_trmcalinpatrev=FNY defo_mcmcalinpatrev=FTA defo_trindiginpatrev=FYD ///
defo_mcindiginpatrev=GDM defo_trthirdinpatrev=GIP defo_mcthirdinpatrev=GNY defo_othindiginpatrev=GTB defo_othpayinpatrev=GYM ///
defo_totinpatrev=HDX defo_totrev=HIS ///
msa_trmcareinpatrev=FDQ msa_mcmcareinpatrev=FIX msa_trmcalinpatrev=FNZ msa_mcmcalinpatrev=FTB msa_trindiginpatrev=FYE ///
msa_mcindiginpatrev=GDN msa_trthirdinpatrev=GIQ msa_mcthirdinpatrev=GNZ msa_othindiginpatrev=GTC msa_othpayinpatrev=GYN ///
msa_totinpatrev=HDY msa_totrev=HIT ///
peda_trmcareinpatrev=FDR peda_mcmcareinpatrev=FIY peda_trmcalinpatrev=FOA peda_mcmcalinpatrev=FTC peda_trindiginpatrev=FYF ///
peda_mcindiginpatrev=GDO peda_trthirdinpatrev=GIR peda_mcthirdinpatrev=GOA peda_othindiginpatrev=GTD peda_othpayinpatrev=GYO ///
peda_totinpatrev=HDZ peda_totrev=HIU ///
psya_trmcareinpatrev=FDS psya_mcmcareinpatrev=FIZ psya_trmcalinpatrev=FOB psya_mcmcalinpatrev=FTD psya_trindiginpatrev=FYG ///
psya_mcindiginpatrev=GDP psya_trthirdinpatrev=GIS psya_mcthirdinpatrev=GOB psya_othindiginpatrev=GTE psya_othpayinpatrev=GYP ///
psya_totinpatrev=HEA psya_totrev=HIV ///
psyac_trmcareinpatrev=FDT psyac_mcmcareinpatrev=FJA psyac_trmcalinpatrev=FOC psyac_mcmcalinpatrev=FTE psyac_trindiginpatrev=FYH ///
psyac_mcindiginpatrev=GDQ psyac_trthirdinpatrev=GIT psyac_mcthirdinpatrev=GOC psyac_othindiginpatrev=GTF psyac_othpayinpatrev=GYQ ///
psyac_totinpatrev=HEB psyac_totrev=HIW ///
obst_trmcareinpatrev=FDU obst_mcmcareinpatrev=FJB obst_trmcalinpatrev=FOD obst_mcmcalinpatrev=FTF obst_trindiginpatrev=FYI ///
obst_mcindiginpatrev=GDR obst_trthirdinpatrev=GIU obst_mcthirdinpatrev=GOD obst_othindiginpatrev=GTG obst_othpayinpatrev=GYR ///
obst_totinpatrev=HEC obst_totrev=HIX ///
altb_trmcareinpatrev=FDV altb_mcmcareinpatrev=FJC altb_trmcalinpatrev=FOE altb_mcmcalinpatrev=FTG altb_trindiginpatrev=FYJ ///
altb_mcindiginpatrev=GDS altb_trthirdinpatrev=GIV altb_mcthirdinpatrev=GOE altb_othindiginpatrev=GTH altb_othpayinpatrev=GYS ///
altb_totinpatrev=HED altb_totrev=HIY ///
chem_trmcareinpatrev=FDW chem_mcmcareinpatrev=FJD chem_trmcalinpatrev=FOF chem_mcmcalinpatrev=FTH chem_trindiginpatrev=FYK ///
chem_mcindiginpatrev=GDT chem_trthirdinpatrev=GIW chem_mcthirdinpatrev=GOF chem_othindiginpatrev=GTI chem_othpayinpatrev=GYT ///
chem_totinpatrev=HEE chem_totrev=HIZ ///
reh_trmcareinpatrev=FDX reh_mcmcareinpatrev=FJE reh_trmcalinpatrev=FOG reh_mcmcalinpatrev=FTI reh_trindiginpatrev=FYL ///
reh_mcindiginpatrev=GDU reh_trthirdinpatrev=GIX reh_mcthirdinpatrev=GOG reh_othindiginpatrev=GTJ reh_othpayinpatrev=GYU ///
reh_totinpatrev=HEF reh_totrev=HJA ///
hosp_trmcareinpatrev=FDY hosp_mcmcareinpatrev=FJF hosp_trmcalinpatrev=FOH hosp_mcmcalinpatrev=FTJ hosp_trindiginpatrev=FYM ///
hosp_mcindiginpatrev=GDV hosp_trthirdinpatrev=GIY hosp_mcthirdinpatrev=GOH hosp_othindiginpatrev=GTK hosp_othpayinpatrev=GYV ///
hosp_totinpatrev=HEG hosp_totrev=HJB ///
otha_trmcareinpatrev=FDZ otha_mcmcareinpatrev=FJG otha_trmcalinpatrev=FOI otha_mcmcalinpatrev=FTK otha_trindiginpatrev=FYN ///
otha_mcindiginpatrev=GDW otha_trthirdinpatrev=GIZ otha_mcthirdinpatrev=GOI otha_othindiginpatrev=GTL otha_othpayinpatrev=GYW ///
otha_totinpatrev=HEH otha_totrev=HJC ///
nur_trmcareinpatrev=FEA nur_mcmcareinpatrev=FJH nur_trmcalinpatrev=FOJ nur_mcmcalinpatrev=FTL nur_trindiginpatrev=FYO ///
nur_mcindiginpatrev=GDX nur_trthirdinpatrev=GJA nur_mcthirdinpatrev=GOJ nur_othindiginpatrev=GTM nur_othpayinpatrev=GYX ///
nur_totinpatrev=HEI nur_totrev=HJD ///
sa_trmcareinpatrev=FEB sa_mcmcareinpatrev=FJI sa_trmcalinpatrev=FOK sa_mcmcalinpatrev=FTM sa_trindiginpatrev=FYP ///
sa_mcindiginpatrev=GDY sa_trthirdinpatrev=GJB sa_mcthirdinpatrev=GOK sa_othindiginpatrev=GTN sa_othpayinpatrev=GYY ///
sa_totinpatrev=HEJ sa_totrev=HJE ///
sap_trmcareinpatrev=FEC sap_mcmcareinpatrev=FJJ sap_trmcalinpatrev=FOL sap_mcmcalinpatrev=FTN sap_trindiginpatrev=FYQ ///
sap_mcindiginpatrev=GDZ sap_trthirdinpatrev=GJC sap_mcthirdinpatrev=GOL sap_othindiginpatrev=GTO sap_othpayinpatrev=GYZ ///
sap_totinpatrev=HEK sap_totrev=HJF ///
sn_trmcareinpatrev=FED sn_mcmcareinpatrev=FJK sn_trmcalinpatrev=FOM sn_mcmcalinpatrev=FTO sn_trindiginpatrev=FYR ///
sn_mcindiginpatrev=GEA sn_trthirdinpatrev=GJD sn_mcthirdinpatrev=GOM sn_othindiginpatrev=GTP sn_othpayinpatrev=GZA ///
sn_totinpatrev=HEL sn_totrev=HJG ///
psyl_trmcareinpatrev=FEE psyl_mcmcareinpatrev=FJL psyl_trmcalinpatrev=FON psyl_mcmcalinpatrev=FTP psyl_trindiginpatrev=FYS ///
psyl_mcindiginpatrev=GEB psyl_trthirdinpatrev=GJE psyl_mcthirdinpatrev=GON psyl_othindiginpatrev=GTQ psyl_othpayinpatrev=GZB ///
psyl_totinpatrev=HEM psyl_totrev=HJH ///
intc_trmcareinpatrev=FEF intc_mcmcareinpatrev=FJM intc_trmcalinpatrev=FOO intc_mcmcalinpatrev=FTQ intc_trindiginpatrev=FYT ///
intc_mcindiginpatrev=GEC intc_trthirdinpatrev=GJF intc_mcthirdinpatrev=GOO intc_othindiginpatrev=GTR intc_othpayinpatrev=GZC ///
intc_totinpatrev=HEN intc_totrev=HJI ///
res_trmcareinpatrev=FEG res_mcmcareinpatrev=FJN res_trmcalinpatrev=FOP res_mcmcalinpatrev=FTR res_trindiginpatrev=FYU ///
res_mcindiginpatrev=GED res_trthirdinpatrev=GJG res_mcthirdinpatrev=GOP res_othindiginpatrev=GTS res_othpayinpatrev=GZD ///
res_totinpatrev=HEO res_totrev=HJJ ///
ols_trmcareinpatrev=FEH ols_mcmcareinpatrev=FJO ols_trmcalinpatrev=FOQ ols_mcmcalinpatrev=FTS ols_trindiginpatrev=FYV ///
ols_mcindiginpatrev=GEE ols_trthirdinpatrev=GJH ols_mcthirdinpatrev=GOQ ols_othindiginpatrev=GTT ols_othpayinpatrev=GZE ///
ols_totinpatrev=HEP ols_totrev=HJK ///
ods_trmcareinpatrev=FEI ods_mcmcareinpatrev=FJP ods_trmcalinpatrev=FOR ods_mcmcalinpatrev=FTT ods_trindiginpatrev=FYW ///
ods_mcindiginpatrev=GEF ods_trthirdinpatrev=GJI ods_mcthirdinpatrev=GOR ods_othindiginpatrev=GTU ods_othpayinpatrev=GZF ///
ods_totinpatrev=HEQ ods_totrev=HJL ///
tot_trmcareinpatrev=FEJ tot_mcmcareinpatrev=FJQ tot_trmcalinpatrev=FOS tot_mcmcalinpatrev=FTU tot_trindiginpatrev=FYX ///
tot_mcindiginpatrev=GEG tot_trthirdinpatrev=GJJ tot_mcthirdinpatrev=GOS tot_othindiginpatrev=GTV tot_othpayinpatrev=GZG ///
tot_totinpatrev=HER tot_totrev=HJM ///
using "$data/`file'.xlsx", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 12
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page12", replace


//Page 17
// no tot_expunits or tot_expperunit
import excel ///
state_facnum=D rep_beg=AA rep_end=AB ///
msic_expsalaries=JGF msic_expbenefits=JJG msic_expreclass=JMH msic_expproffees=JPI ///
msic_exppurchserv=JVK msic_expsupplies=JSJ msic_expdeprec=JYN msic_explease=KBO ///
msic_expother=KEP msic_exptotal=KHQ msic_expadj=KKT msic_expadjtotal=KNW msic_expunits=KQZ msic_expperunit=KTU ///
msa_expsalaries=JGN msa_expbenefits=JJO msa_expreclass=JMP msa_expproffees=JPQ ///
msa_exppurchserv=JVS msa_expsupplies=JSR msa_expdeprec=JYV msa_explease=KBW ///
msa_expother=KEX msa_exptotal=KHY msa_expadj=KLB msa_expadjtotal=KOE msa_expunits=KRH msa_expperunit=KUC ///
tot_expsalaries=JHG tot_expbenefits=JKH tot_expreclass=JNI tot_expproffees=JQJ ///
tot_exppurchserv=JWL tot_expsupplies=JTK tot_expdeprec=JZO tot_explease=KCP ///
tot_expother=KFQ tot_exptotal=KIR tot_expadj=KLU tot_expadjtotal=KOX ///
using "$data/`file'", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 17
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page17", replace


// Page 20

if `x' == 1 | `x' == 2 {
	local costsheet "Cost Allocation Data"
}

else {
	local costsheet "Cost Vlookup Transposed"
}

import excel ///
state_facnum=A desc_date=B /// 
msic_alloc_adjdir=BLZ msic_alloc_capital=BRF msic_alloc_subtot1=BXB msic_alloc_admin=CCC msic_alloc_pers=CGW msic_alloc_stores=CLM ///
msic_alloc_hskeep=CQB msic_alloc_grops=CUK msic_alloc_food=CXS msic_alloc_laundry=DBY msic_alloc_records=DFM msic_alloc_outreg=DIU ///
msic_alloc_nurs=DML msic_alloc_supplies=DQD msic_alloc_pharm=DTU msic_alloc_subtot2=DXL msic_alloc_res=EAX msic_alloc_nursed=EEV ///
msic_alloc_othed=EIE msic_alloc_meded=ELM msic_alloc_trans=EON msic_alloc_tot=ERN ///
msa_alloc_adjdir=BMH msa_alloc_capital=BRN msa_alloc_subtot1=BXJ msa_alloc_admin=CCK msa_alloc_pers=CHE msa_alloc_stores=CLU ///
msa_alloc_hskeep=CQJ msa_alloc_grops=CUS msa_alloc_food=CYA msa_alloc_laundry=DCG msa_alloc_records=DFU msa_alloc_outreg=DJC ///
msa_alloc_nurs=DMT msa_alloc_supplies=DQL msa_alloc_pharm=DUC msa_alloc_subtot2=DXT msa_alloc_res=EBF msa_alloc_nursed=EFD ///
msa_alloc_othed=EIM msa_alloc_meded=ELU msa_alloc_trans=EOV msa_alloc_tot=ERV ///
using "$data/`file'", sheet("`costsheet'") allstring clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 20
drop if (state_facnum == "" | state_facnum == "0")

if `x' == 3 | `x' == 6 {
	g desc_date2 = date(desc_date, "DMY") 
	drop desc_date 
	ren desc_date2 desc_date
	tostring desc_date, replace
}

if `x' == 4 {
	destring desc_date, replace
	g desc_date2 = desc_date + td(30dec1899)
	drop desc_date
	ren desc_date2 desc_date
	tostring desc_date, replace
}

save "$output/page20", replace



//Page 21 
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
msic_mgmthrlywage=MEP msic_mgmthrs=MHP msic_techhrlywage=MKP msic_techhrs=MNP msic_rnhrlywage=MQP msic_rnhrs=MTP msic_lvnhrlywage=MWP msic_lvnhrs=MZP ///
msic_aidehrlywage=NCP msic_aidehrs=NFP msic_clerhrlywage=NIP msic_clerhrs=NLP msic_envhrlywage=NOP msic_envhrs=NRP msic_physhrlywage=NUP msic_physhrs=NXP ///
msic_mphrlywage=OAP msic_mphrs=ODP msic_othhrlywage=OGP msic_othhrs=OJP msic_avehrlywage=OMP msic_prodhrs=OPP msic_nonprodhrs=OSP msic_paidhrs=OVP msic_ftes=OYP ///
cic_mgmthrlywage=MEQ cic_mgmthrs=MHQ cic_techhrlywage=MKQ cic_techhrs=MNQ cic_rnhrlywage=MQQ cic_rnhrs=MTQ cic_lvnhrlywage=MWQ cic_lvnhrs=MZQ ///
cic_aidehrlywage=NCQ cic_aidehrs=NFQ cic_clerhrlywage=NIQ cic_clerhrs=NLQ cic_envhrlywage=NOQ cic_envhrs=NRQ cic_physhrlywage=NUQ cic_physhrs=NXQ ///
cic_mphrlywage=OAQ cic_mphrs=ODQ cic_othhrlywage=OGQ cic_othhrs=OJQ cic_avehrlywage=OMQ cic_prodhrs=OPQ cic_nonprodhrs=OSQ cic_paidhrs=OVQ cic_ftes=OYQ ///
pic_mgmthrlywage=MER pic_mgmthrs=MHR pic_techhrlywage=MKR pic_techhrs=MNR pic_rnhrlywage=MQR pic_rnhrs=MTR pic_lvnhrlywage=MWR pic_lvnhrs=MZR ///
pic_aidehrlywage=NCR pic_aidehrs=NFR pic_clerhrlywage=NIR pic_clerhrs=NLR pic_envhrlywage=NOR pic_envhrs=NRR pic_physhrlywage=NUR pic_physhrs=NXR ///
pic_mphrlywage=OAR pic_mphrs=ODR pic_othhrlywage=OGR pic_othhrs=OJR pic_avehrlywage=OMR pic_prodhrs=OPR pic_nonprodhrs=OSR pic_paidhrs=OVR pic_ftes=OYR ///
nic_mgmthrlywage=MES nic_mgmthrs=MHS nic_techhrlywage=MKS nic_techhrs=MNS nic_rnhrlywage=MQS nic_rnhrs=MTS nic_lvnhrlywage=MWS nic_lvnhrs=MZS ///
nic_aidehrlywage=NCS nic_aidehrs=NFS nic_clerhrlywage=NIS nic_clerhrs=NLS nic_envhrlywage=NOS nic_envhrs=NRS nic_physhrlywage=NUS nic_physhrs=NXS ///
nic_mphrlywage=OAS nic_mphrs=ODS nic_othhrlywage=OGS nic_othhrs=OJS nic_avehrlywage=OMS nic_prodhrs=OPS nic_nonprodhrs=OSS nic_paidhrs=OVS nic_ftes=OYS ///
psyi_mgmthrlywage=MET psyi_mgmthrs=MHT psyi_techhrlywage=MKT psyi_techhrs=MNT psyi_rnhrlywage=MQT psyi_rnhrs=MTT psyi_lvnhrlywage=MWT psyi_lvnhrs=MZT ///
psyi_aidehrlywage=NCT psyi_aidehrs=NFT psyi_clerhrlywage=NIT psyi_clerhrs=NLT psyi_envhrlywage=NOT psyi_envhrs=NRT psyi_physhrlywage=NUT psyi_physhrs=NXT ///
psyi_mphrlywage=OAT psyi_mphrs=ODT psyi_othhrlywage=OGT psyi_othhrs=OJT psyi_avehrlywage=OMT psyi_prodhrs=OPT psyi_nonprodhrs=OST psyi_paidhrs=OVT psyi_ftes=OYT ///
burn_mgmthrlywage=MEU burn_mgmthrs=MHU burn_techhrlywage=MKU burn_techhrs=MNU burn_rnhrlywage=MQU burn_rnhrs=MTU burn_lvnhrlywage=MWU burn_lvnhrs=MZU ///
burn_aidehrlywage=NCU burn_aidehrs=NFU burn_clerhrlywage=NIU burn_clerhrs=NLU burn_envhrlywage=NOU burn_envhrs=NRU burn_physhrlywage=NUU burn_physhrs=NXU ///
burn_mphrlywage=OAU burn_mphrs=ODU burn_othhrlywage=OGU burn_othhrs=OJU burn_avehrlywage=OMU burn_prodhrs=OPU burn_nonprodhrs=OSU burn_paidhrs=OVU burn_ftes=OYU ///
oic_mgmthrlywage=MEV oic_mgmthrs=MHV oic_techhrlywage=MKV oic_techhrs=MNV oic_rnhrlywage=MQV oic_rnhrs=MTV oic_lvnhrlywage=MWV oic_lvnhrs=MZV ///
oic_aidehrlywage=NCV oic_aidehrs=NFV oic_clerhrlywage=NIV oic_clerhrs=NLV oic_envhrlywage=NOV oic_envhrs=NRV oic_physhrlywage=NUV oic_physhrs=NXV ///
oic_mphrlywage=OAV oic_mphrs=ODV oic_othhrlywage=OGV oic_othhrs=OJV oic_avehrlywage=OMV oic_prodhrs=OPV oic_nonprodhrs=OSV oic_paidhrs=OVV oic_ftes=OYV ///
defo_mgmthrlywage=MEW defo_mgmthrs=MHW defo_techhrlywage=MKW defo_techhrs=MNW defo_rnhrlywage=MQW defo_rnhrs=MTW defo_lvnhrlywage=MWW defo_lvnhrs=MZW ///
defo_aidehrlywage=NCW defo_aidehrs=NFW defo_clerhrlywage=NIW defo_clerhrs=NLW defo_envhrlywage=NOW defo_envhrs=NRW defo_physhrlywage=NUW defo_physhrs=NXW ///
defo_mphrlywage=OAW defo_mphrs=ODW defo_othhrlywage=OGW defo_othhrs=OJW defo_avehrlywage=OMW defo_prodhrs=OPW defo_nonprodhrs=OSW defo_paidhrs=OVW defo_ftes=OYW ///
msa_mgmthrlywage=MEX msa_mgmthrs=MHX msa_techhrlywage=MKX msa_techhrs=MNX msa_rnhrlywage=MQX msa_rnhrs=MTX msa_lvnhrlywage=MWX msa_lvnhrs=MZX ///
msa_aidehrlywage=NCX msa_aidehrs=NFX msa_clerhrlywage=NIX msa_clerhrs=NLX msa_envhrlywage=NOX msa_envhrs=NRX msa_physhrlywage=NUX msa_physhrs=NXX ///
msa_mphrlywage=OAX msa_mphrs=ODX msa_othhrlywage=OGX msa_othhrs=OJX msa_avehrlywage=OMX msa_prodhrs=OPX msa_nonprodhrs=OSX msa_paidhrs=OVX msa_ftes=OYX ///
peda_mgmthrlywage=MEY peda_mgmthrs=MHY peda_techhrlywage=MKY peda_techhrs=MNY peda_rnhrlywage=MQY peda_rnhrs=MTY peda_lvnhrlywage=MWY peda_lvnhrs=MZY ///
peda_aidehrlywage=NCY peda_aidehrs=NFY peda_clerhrlywage=NIY peda_clerhrs=NLY peda_envhrlywage=NOY peda_envhrs=NRY peda_physhrlywage=NUY peda_physhrs=NXY ///
peda_mphrlywage=OAY peda_mphrs=ODY peda_othhrlywage=OGY peda_othhrs=OJY peda_avehrlywage=OMY peda_prodhrs=OPY peda_nonprodhrs=OSY peda_paidhrs=OVY peda_ftes=OYY ///
psya_mgmthrlywage=MEZ psya_mgmthrs=MHZ psya_techhrlywage=MKZ psya_techhrs=MNZ psya_rnhrlywage=MQZ psya_rnhrs=MTZ psya_lvnhrlywage=MWZ psya_lvnhrs=MZZ ///
psya_aidehrlywage=NCZ psya_aidehrs=NFZ psya_clerhrlywage=NIZ psya_clerhrs=NLZ psya_envhrlywage=NOZ psya_envhrs=NRZ psya_physhrlywage=NUZ psya_physhrs=NXZ ///
psya_mphrlywage=OAZ psya_mphrs=ODZ psya_othhrlywage=OGZ psya_othhrs=OJZ psya_avehrlywage=OMZ psya_prodhrs=OPZ psya_nonprodhrs=OSZ psya_paidhrs=OVZ psya_ftes=OYZ ///
psyac_mgmthrlywage=MFA psyac_mgmthrs=MIA psyac_techhrlywage=MLA psyac_techhrs=MOA psyac_rnhrlywage=MRA psyac_rnhrs=MUA psyac_lvnhrlywage=MXA psyac_lvnhrs=NAA ///
psyac_aidehrlywage=NDA psyac_aidehrs=NGA psyac_clerhrlywage=NJA psyac_clerhrs=NMA psyac_envhrlywage=NPA psyac_envhrs=NSA psyac_physhrlywage=NVA psyac_physhrs=NYA ///
psyac_mphrlywage=OBA psyac_mphrs=OEA psyac_othhrlywage=OHA psyac_othhrs=OKA psyac_avehrlywage=ONA psyac_prodhrs=OQA psyac_nonprodhrs=OTA psyac_paidhrs=OWA psyac_ftes=OZA ///
obst_mgmthrlywage=MFB obst_mgmthrs=MIB obst_techhrlywage=MLB obst_techhrs=MOB obst_rnhrlywage=MRB obst_rnhrs=MUB obst_lvnhrlywage=MXB obst_lvnhrs=NAB ///
obst_aidehrlywage=NDB obst_aidehrs=NGB obst_clerhrlywage=NJB obst_clerhrs=NMB obst_envhrlywage=NPB obst_envhrs=NSB obst_physhrlywage=NVB obst_physhrs=NYB ///
obst_mphrlywage=OBB obst_mphrs=OEB obst_othhrlywage=OHB obst_othhrs=OKB obst_avehrlywage=ONB obst_prodhrs=OQB obst_nonprodhrs=OTB obst_paidhrs=OWB obst_ftes=OZB ///
altb_mgmthrlywage=MFC altb_mgmthrs=MIC altb_techhrlywage=MLC altb_techhrs=MOC altb_rnhrlywage=MRC altb_rnhrs=MUC altb_lvnhrlywage=MXC altb_lvnhrs=NAC ///
altb_aidehrlywage=NDC altb_aidehrs=NGC altb_clerhrlywage=NJC altb_clerhrs=NMC altb_envhrlywage=NPC altb_envhrs=NSC altb_physhrlywage=NVC altb_physhrs=NYC ///
altb_mphrlywage=OBC altb_mphrs=OEC altb_othhrlywage=OHC altb_othhrs=OKC altb_avehrlywage=ONC altb_prodhrs=OQC altb_nonprodhrs=OTC altb_paidhrs=OWC altb_ftes=OZC ///
chem_mgmthrlywage=MFD chem_mgmthrs=MID chem_techhrlywage=MLD chem_techhrs=MOD chem_rnhrlywage=MRD chem_rnhrs=MUD chem_lvnhrlywage=MXD chem_lvnhrs=NAD ///
chem_aidehrlywage=NDD chem_aidehrs=NGD chem_clerhrlywage=NJD chem_clerhrs=NMD chem_envhrlywage=NPD chem_envhrs=NSD chem_physhrlywage=NVD chem_physhrs=NYD ///
chem_mphrlywage=OBD chem_mphrs=OED chem_othhrlywage=OHD chem_othhrs=OKD chem_avehrlywage=OND chem_prodhrs=OQD chem_nonprodhrs=OTD chem_paidhrs=OWD chem_ftes=OZD ///
reh_mgmthrlywage=MFE reh_mgmthrs=MIE reh_techhrlywage=MLE reh_techhrs=MOE reh_rnhrlywage=MRE reh_rnhrs=MUE reh_lvnhrlywage=MXE reh_lvnhrs=NAE ///
reh_aidehrlywage=NDE reh_aidehrs=NGE reh_clerhrlywage=NJE reh_clerhrs=NME reh_envhrlywage=NPE reh_envhrs=NSE reh_physhrlywage=NVE reh_physhrs=NYE ///
reh_mphrlywage=OBE reh_mphrs=OEE reh_othhrlywage=OHE reh_othhrs=OKE reh_avehrlywage=ONE reh_prodhrs=OQE reh_nonprodhrs=OTE reh_paidhrs=OWE reh_ftes=OZE ///
hosp_mgmthrlywage=MFF hosp_mgmthrs=MIF hosp_techhrlywage=MLF hosp_techhrs=MOF hosp_rnhrlywage=MRF hosp_rnhrs=MUF hosp_lvnhrlywage=MXF hosp_lvnhrs=NAF ///
hosp_aidehrlywage=NDF hosp_aidehrs=NGF hosp_clerhrlywage=NJF hosp_clerhrs=NMF hosp_envhrlywage=NPF hosp_envhrs=NSF hosp_physhrlywage=NVF hosp_physhrs=NYF ///
hosp_mphrlywage=OBF hosp_mphrs=OEF hosp_othhrlywage=OHF hosp_othhrs=OKF hosp_avehrlywage=ONF hosp_prodhrs=OQF hosp_nonprodhrs=OTF hosp_paidhrs=OWF hosp_ftes=OZF ///
otha_mgmthrlywage=MFG otha_mgmthrs=MIG otha_techhrlywage=MLG otha_techhrs=MOG otha_rnhrlywage=MRG otha_rnhrs=MUG otha_lvnhrlywage=MXG otha_lvnhrs=NAG ///
otha_aidehrlywage=NDG otha_aidehrs=NGG otha_clerhrlywage=NJG otha_clerhrs=NMG otha_envhrlywage=NPG otha_envhrs=NSG otha_physhrlywage=NVG otha_physhrs=NYG ///
otha_mphrlywage=OBG otha_mphrs=OEG otha_othhrlywage=OHG otha_othhrs=OKG otha_avehrlywage=ONG otha_prodhrs=OQG otha_nonprodhrs=OTG otha_paidhrs=OWG otha_ftes=OZG ///
nur_mgmthrlywage=MFH nur_mgmthrs=MIH nur_techhrlywage=MLH nur_techhrs=MOH nur_rnhrlywage=MRH nur_rnhrs=MUH nur_lvnhrlywage=MXH nur_lvnhrs=NAH ///
nur_aidehrlywage=NDH nur_aidehrs=NGH nur_clerhrlywage=NJH nur_clerhrs=NMH nur_envhrlywage=NPH nur_envhrs=NSH nur_physhrlywage=NVH nur_physhrs=NYH ///
nur_mphrlywage=OBH nur_mphrs=OEH nur_othhrlywage=OHH nur_othhrs=OKH nur_avehrlywage=ONH nur_prodhrs=OQH nur_nonprodhrs=OTH nur_paidhrs=OWH nur_ftes=OZH ///
sa_mgmthrlywage=MFI sa_mgmthrs=MII sa_techhrlywage=MLI sa_techhrs=MOI sa_rnhrlywage=MRI sa_rnhrs=MUI sa_lvnhrlywage=MXI sa_lvnhrs=NAI ///
sa_aidehrlywage=NDI sa_aidehrs=NGI sa_clerhrlywage=NJI sa_clerhrs=NMI sa_envhrlywage=NPI sa_envhrs=NSI sa_physhrlywage=NVI sa_physhrs=NYI ///
sa_mphrlywage=OBI sa_mphrs=OEI sa_othhrlywage=OHI sa_othhrs=OKI sa_avehrlywage=ONI sa_prodhrs=OQI sa_nonprodhrs=OTI sa_paidhrs=OWI sa_ftes=OZI ///
sap_mgmthrlywage=MFJ sap_mgmthrs=MIJ sap_techhrlywage=MLJ sap_techhrs=MOJ sap_rnhrlywage=MRJ sap_rnhrs=MUJ sap_lvnhrlywage=MXJ sap_lvnhrs=NAJ ///
sap_aidehrlywage=NDJ sap_aidehrs=NGJ sap_clerhrlywage=NJJ sap_clerhrs=NMJ sap_envhrlywage=NPJ sap_envhrs=NSJ sap_physhrlywage=NVJ sap_physhrs=NYJ ///
sap_mphrlywage=OBJ sap_mphrs=OEJ sap_othhrlywage=OHJ sap_othhrs=OKJ sap_avehrlywage=ONJ sap_prodhrs=OQJ sap_nonprodhrs=OTJ sap_paidhrs=OWJ sap_ftes=OZJ ///
sn_mgmthrlywage=MFK sn_mgmthrs=MIK sn_techhrlywage=MLK sn_techhrs=MOK sn_rnhrlywage=MRK sn_rnhrs=MUK sn_lvnhrlywage=MXK sn_lvnhrs=NAK ///
sn_aidehrlywage=NDK sn_aidehrs=NGK sn_clerhrlywage=NJK sn_clerhrs=NMK sn_envhrlywage=NPK sn_envhrs=NSK sn_physhrlywage=NVK sn_physhrs=NYK ///
sn_mphrlywage=OBK sn_mphrs=OEK sn_othhrlywage=OHK sn_othhrs=OKK sn_avehrlywage=ONK sn_prodhrs=OQK sn_nonprodhrs=OTK sn_paidhrs=OWK sn_ftes=OZK ///
psyl_mgmthrlywage=MFL psyl_mgmthrs=MIL psyl_techhrlywage=MLL psyl_techhrs=MOL psyl_rnhrlywage=MRL psyl_rnhrs=MUL psyl_lvnhrlywage=MXL psyl_lvnhrs=NAL ///
psyl_aidehrlywage=NDL psyl_aidehrs=NGL psyl_clerhrlywage=NJL psyl_clerhrs=NML psyl_envhrlywage=NPL psyl_envhrs=NSL psyl_physhrlywage=NVL psyl_physhrs=NYL ///
psyl_mphrlywage=OBL psyl_mphrs=OEL psyl_othhrlywage=OHL psyl_othhrs=OKL psyl_avehrlywage=ONL psyl_prodhrs=OQL psyl_nonprodhrs=OTL psyl_paidhrs=OWL psyl_ftes=OZL ///
intc_mgmthrlywage=MFM intc_mgmthrs=MIM intc_techhrlywage=MLM intc_techhrs=MOM intc_rnhrlywage=MRM intc_rnhrs=MUM intc_lvnhrlywage=MXM intc_lvnhrs=NAM ///
intc_aidehrlywage=NDM intc_aidehrs=NGM intc_clerhrlywage=NJM intc_clerhrs=NMM intc_envhrlywage=NPM intc_envhrs=NSM intc_physhrlywage=NVM intc_physhrs=NYM ///
intc_mphrlywage=OBM intc_mphrs=OEM intc_othhrlywage=OHM intc_othhrs=OKM intc_avehrlywage=ONM intc_prodhrs=OQM intc_nonprodhrs=OTM intc_paidhrs=OWM intc_ftes=OZM ///
res_mgmthrlywage=MFN res_mgmthrs=MIN res_techhrlywage=MLN res_techhrs=MON res_rnhrlywage=MRN res_rnhrs=MUN res_lvnhrlywage=MXN res_lvnhrs=NAN ///
res_aidehrlywage=NDN res_aidehrs=NGN res_clerhrlywage=NJN res_clerhrs=NMN res_envhrlywage=NPN res_envhrs=NSN res_physhrlywage=NVN res_physhrs=NYN ///
res_mphrlywage=OBN res_mphrs=OEN res_othhrlywage=OHN res_othhrs=OKN res_avehrlywage=ONN res_prodhrs=OQN res_nonprodhrs=OTN res_paidhrs=OWN res_ftes=OZN ///
ols_mgmthrlywage=MFO ols_mgmthrs=MIO ols_techhrlywage=MLO ols_techhrs=MOO ols_rnhrlywage=MRO ols_rnhrs=MUO ols_lvnhrlywage=MXO ols_lvnhrs=NAO ///
ols_aidehrlywage=NDO ols_aidehrs=NGO ols_clerhrlywage=NJO ols_clerhrs=NMO ols_envhrlywage=NPO ols_envhrs=NSO ols_physhrlywage=NVO ols_physhrs=NYO ///
ols_mphrlywage=OBO ols_mphrs=OEO ols_othhrlywage=OHO ols_othhrs=OKO ols_avehrlywage=ONO ols_prodhrs=OQO ols_nonprodhrs=OTO ols_paidhrs=OWO ols_ftes=OZO ///
ods_mgmthrlywage=MFP ods_mgmthrs=MIP ods_techhrlywage=MLP ods_techhrs=MOP ods_rnhrlywage=MRP ods_rnhrs=MUP ods_lvnhrlywage=MXP ods_lvnhrs=NAP ///
ods_aidehrlywage=NDP ods_aidehrs=NGP ods_clerhrlywage=NJP ods_clerhrs=NMP ods_envhrlywage=NPP ods_envhrs=NSP ods_physhrlywage=NVP ods_physhrs=NYP ///
ods_mphrlywage=OBP ods_mphrs=OEP ods_othhrlywage=OHP ods_othhrs=OKP ods_avehrlywage=ONP ods_prodhrs=OQP ods_nonprodhrs=OTP ods_paidhrs=OWP ods_ftes=OZP ///
tot_mgmthrlywage=MFQ tot_mgmthrs=MIQ tot_techhrlywage=MLQ tot_techhrs=MOQ tot_rnhrlywage=MRQ tot_rnhrs=MUQ tot_lvnhrlywage=MXQ tot_lvnhrs=NAQ ///
tot_aidehrlywage=NDQ tot_aidehrs=NGQ tot_clerhrlywage=NJQ tot_clerhrs=NMQ tot_envhrlywage=NPQ tot_envhrs=NSQ tot_physhrlywage=NVQ tot_physhrs=NYQ ///
tot_mphrlywage=OBQ tot_mphrs=OEQ tot_othhrlywage=OHQ tot_othhrs=OKQ tot_avehrlywage=ONQ tot_prodhrs=OQQ tot_nonprodhrs=OTQ tot_paidhrs=OWQ tot_ftes=OZQ ///
amb_mgmthrlywage=MGE amb_mgmthrs=MKO amb_techhrlywage=MNO amb_techhrs=MQO amb_rnhrlywage=MSE amb_rnhrs=MVE amb_lvnhrlywage=MYE amb_lvnhrs=NBE ///
amb_aidehrlywage=NEE amb_aidehrs=NHE amb_clerhrlywage=NKE amb_clerhrs=NNE amb_envhrlywage=NQE amb_envhrs=NTE amb_physhrlywage=NWE amb_physhrs=NZE ///
amb_mphrlywage=OCE amb_mphrs=OFE amb_othhrlywage=OIE amb_othhrs=OLE amb_avehrlywage=OOE amb_prodhrs=ORE amb_nonprodhrs=OUE amb_paidhrs=OXE amb_ftes=PAE ///
anc_mgmthrlywage=MHO anc_mgmthrs=MIQ anc_techhrlywage=MLQ anc_techhrs=MOQ anc_rnhrlywage=MTO anc_rnhrs=MWO anc_lvnhrlywage=MZO anc_lvnhrs=NCO ///
anc_aidehrlywage=NFO anc_aidehrs=NIO anc_clerhrlywage=NLO anc_clerhrs=NOO anc_envhrlywage=NRO anc_envhrs=NUO anc_physhrlywage=NXO anc_physhrs=OAO ///
anc_mphrlywage=ODO anc_mphrs=OGO anc_othhrlywage=OJO anc_othhrs=OMO anc_avehrlywage=OPO anc_prodhrs=OSO anc_nonprodhrs=OVO anc_paidhrs=OYO anc_ftes=PBO ///
using "$data/`file'", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 21
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page21", replace

//Page 15
// 1992 (second half) onwards
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
msic_physcompsal=HOL msic_physcompben=HRL msic_physcompprof=HUL msic_physcomptot=HXL msic_physhrsres=IAL msic_physhrsme=IDL msic_physhrsadmin=IGL msic_physhrsnurs=IJL msic_physhrscare=IML msic_physhrssup=IPL ///
cic_physcompsal=HOM cic_physcompben=HRM cic_physcompprof=HUM cic_physcomptot=HXM cic_physhrsres=IAM cic_physhrsme=IDM cic_physhrsadmin=IGM cic_physhrsnurs=IJM cic_physhrscare=IMM cic_physhrssup=IPM ///
pic_physcompsal=HON pic_physcompben=HRN pic_physcompprof=HUN pic_physcomptot=HXN pic_physhrsres=IAN pic_physhrsme=IDN pic_physhrsadmin=IGN pic_physhrsnurs=IJN pic_physhrscare=IMN pic_physhrssup=IPN ///
nic_physcompsal=HOO nic_physcompben=HRO nic_physcompprof=HUO nic_physcomptot=HXO nic_physhrsres=IAO nic_physhrsme=IDO nic_physhrsadmin=IGO nic_physhrsnurs=IJO nic_physhrscare=IMO nic_physhrssup=IPO ///
psyi_physcompsal=HOP psyi_physcompben=HRP psyi_physcompprof=HUP psyi_physcomptot=HXP psyi_physhrsres=IAP psyi_physhrsme=IDP psyi_physhrsadmin=IGP psyi_physhrsnurs=IJP psyi_physhrscare=IMP psyi_physhrssup=IPP ///
burn_physcompsal=HOQ burn_physcompben=HRQ burn_physcompprof=HUQ burn_physcomptot=HXQ burn_physhrsres=IAQ burn_physhrsme=IDQ burn_physhrsadmin=IGQ burn_physhrsnurs=IJQ burn_physhrscare=IMQ burn_physhrssup=IPQ ///
oic_physcompsal=HOR oic_physcompben=HRR oic_physcompprof=HUR oic_physcomptot=HXR oic_physhrsres=IAR oic_physhrsme=IDR oic_physhrsadmin=IGR oic_physhrsnurs=IJR oic_physhrscare=IMR oic_physhrssup=IPR ///
defo_physcompsal=HOS defo_physcompben=HRS defo_physcompprof=HUS defo_physcomptot=HXS defo_physhrsres=IAS defo_physhrsme=IDS defo_physhrsadmin=IGS defo_physhrsnurs=IJS defo_physhrscare=IMS defo_physhrssup=IPS ///
msa_physcompsal=HOT msa_physcompben=HRT msa_physcompprof=HUT msa_physcomptot=HXT msa_physhrsres=IAT msa_physhrsme=IDT msa_physhrsadmin=IGT msa_physhrsnurs=IJT msa_physhrscare=IMT msa_physhrssup=IPT ///
peda_physcompsal=HOU peda_physcompben=HRU peda_physcompprof=HUU peda_physcomptot=HXU peda_physhrsres=IAU peda_physhrsme=IDU peda_physhrsadmin=IGU peda_physhrsnurs=IJU peda_physhrscare=IMU peda_physhrssup=IPU ///
psya_physcompsal=HOV psya_physcompben=HRV psya_physcompprof=HUV psya_physcomptot=HXV psya_physhrsres=IAV psya_physhrsme=IDV psya_physhrsadmin=IGV psya_physhrsnurs=IJV psya_physhrscare=IMV psya_physhrssup=IPV ///
psyac_physcompsal=HOW psyac_physcompben=HRW psyac_physcompprof=HUW psyac_physcomptot=HXW psyac_physhrsres=IAW psyac_physhrsme=IDW psyac_physhrsadmin=IGW psyac_physhrsnurs=IJW psyac_physhrscare=IMW psyac_physhrssup=IPW ///
obst_physcompsal=HOX obst_physcompben=HRX obst_physcompprof=HUX obst_physcomptot=HXX obst_physhrsres=IAX obst_physhrsme=IDX obst_physhrsadmin=IGX obst_physhrsnurs=IJX obst_physhrscare=IMX obst_physhrssup=IPX ///
altb_physcompsal=HOY altb_physcompben=HRY altb_physcompprof=HUY altb_physcomptot=HXY altb_physhrsres=IAY altb_physhrsme=IDY altb_physhrsadmin=IGY altb_physhrsnurs=IJY altb_physhrscare=IMY altb_physhrssup=IPY ///
chem_physcompsal=HOZ chem_physcompben=HRZ chem_physcompprof=HUZ chem_physcomptot=HXZ chem_physhrsres=IAZ chem_physhrsme=IDZ chem_physhrsadmin=IGZ chem_physhrsnurs=IJZ chem_physhrscare=IMZ chem_physhrssup=IPZ ///
reh_physcompsal=HPA reh_physcompben=HSA reh_physcompprof=HVA reh_physcomptot=HYA reh_physhrsres=IBA reh_physhrsme=IEA reh_physhrsadmin=IHA reh_physhrsnurs=IKA reh_physhrscare=INA reh_physhrssup=IQA ///
hosp_physcompsal=HPB hosp_physcompben=HSB hosp_physcompprof=HVB hosp_physcomptot=HYB hosp_physhrsres=IBB hosp_physhrsme=IEB hosp_physhrsadmin=IHB hosp_physhrsnurs=IKB hosp_physhrscare=INB hosp_physhrssup=IQB ///
otha_physcompsal=HPC otha_physcompben=HSC otha_physcompprof=HVC otha_physcomptot=HYC otha_physhrsres=IBC otha_physhrsme=IEC otha_physhrsadmin=IHC otha_physhrsnurs=IKC otha_physhrscare=INC otha_physhrssup=IQC ///
nur_physcompsal=HPD nur_physcompben=HSD nur_physcompprof=HVD nur_physcomptot=HYD nur_physhrsres=IBD nur_physhrsme=IED nur_physhrsadmin=IHD nur_physhrsnurs=IKD nur_physhrscare=IND nur_physhrssup=IQD ///
sa_physcompsal=HPE sa_physcompben=HSE sa_physcompprof=HVE sa_physcomptot=HYE sa_physhrsres=IBE sa_physhrsme=IEE sa_physhrsadmin=IHE sa_physhrsnurs=IKE sa_physhrscare=INE sa_physhrssup=IQE ///
sap_physcompsal=HPF sap_physcompben=HSF sap_physcompprof=HVF sap_physcomptot=HYF sap_physhrsres=IBF sap_physhrsme=IEF sap_physhrsadmin=IHF sap_physhrsnurs=IKF sap_physhrscare=INF sap_physhrssup=IQF ///
sn_physcompsal=HPG sn_physcompben=HSG sn_physcompprof=HVG sn_physcomptot=HYG sn_physhrsres=IBG sn_physhrsme=IEG sn_physhrsadmin=IHG sn_physhrsnurs=IKG sn_physhrscare=ING sn_physhrssup=IQG ///
psyl_physcompsal=HPH psyl_physcompben=HSH psyl_physcompprof=HVH psyl_physcomptot=HYH psyl_physhrsres=IBH psyl_physhrsme=IEH psyl_physhrsadmin=IHH psyl_physhrsnurs=IKH psyl_physhrscare=INH psyl_physhrssup=IQH ///
intc_physcompsal=HPI intc_physcompben=HSI intc_physcompprof=HVI intc_physcomptot=HYI intc_physhrsres=IBI intc_physhrsme=IEI intc_physhrsadmin=IHI intc_physhrsnurs=IKI intc_physhrscare=INI intc_physhrssup=IQI ///
res_physcompsal=HPJ res_physcompben=HSJ res_physcompprof=HVJ res_physcomptot=HYJ res_physhrsres=IBJ res_physhrsme=IEJ res_physhrsadmin=IHJ res_physhrsnurs=IKJ res_physhrscare=INJ res_physhrssup=IQJ ///
ols_physcompsal=HPK ols_physcompben=HSK ols_physcompprof=HVK ols_physcomptot=HYK ols_physhrsres=IBK ols_physhrsme=IEK ols_physhrsadmin=IHK ols_physhrsnurs=IKK ols_physhrscare=INK ols_physhrssup=IQK ///
ods_physcompsal=HPL ods_physcompben=HSL ods_physcompprof=HVL ods_physcomptot=HYL ods_physhrsres=IBL ods_physhrsme=IEL ods_physhrsadmin=IHL ods_physhrsnurs=IKL ods_physhrscare=INL ods_physhrssup=IQL ///
tot_physcompsal=HPM tot_physcompben=HSM tot_physcompprof=HVM tot_physcomptot=HYM tot_physhrsres=IBM tot_physhrsme=IEM tot_physhrsadmin=IHM tot_physhrsnurs=IKM tot_physhrscare=INM tot_physhrssup=IQM ///
using "$data/`file'", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 15
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page15", replace

//Page 21.1 
// 1992 (second half) onwards
import excel ///
state_facnum=D rep_beg=AA rep_end=AB /// 
msic_regnhrlywage=PBP msic_regnhrs=PEP msic_othconthrlywage=PHP msic_othconthrs=PKP msic_totconthrs=PNP ///
cic_regnhrlywage=PBQ cic_regnhrs=PEQ cic_othconthrlywage=PHQ cic_othconthrs=PKQ cic_totconthrs=PNQ ///
pic_regnhrlywage=PBR pic_regnhrs=PER pic_othconthrlywage=PHR pic_othconthrs=PKR pic_totconthrs=PNR ///
nic_regnhrlywage=PBS nic_regnhrs=PES nic_othconthrlywage=PHS nic_othconthrs=PKS nic_totconthrs=PNS ///
psyi_regnhrlywage=PBT psyi_regnhrs=PET psyi_othconthrlywage=PHT psyi_othconthrs=PKT psyi_totconthrs=PNT ///
burn_regnhrlywage=PBU burn_regnhrs=PEU burn_othconthrlywage=PHU burn_othconthrs=PKU burn_totconthrs=PNU ///
oic_regnhrlywage=PBV oic_regnhrs=PEV oic_othconthrlywage=PHV oic_othconthrs=PKV oic_totconthrs=PNV ///
defo_regnhrlywage=PBW defo_regnhrs=PEW defo_othconthrlywage=PHW defo_othconthrs=PKW defo_totconthrs=PNW ///
msa_regnhrlywage=PBX msa_regnhrs=PEX msa_othconthrlywage=PHX msa_othconthrs=PKX msa_totconthrs=PNX ///
peda_regnhrlywage=PBY peda_regnhrs=PEY peda_othconthrlywage=PHY peda_othconthrs=PKY peda_totconthrs=PNY ///
psya_regnhrlywage=PBZ psya_regnhrs=PEZ psya_othconthrlywage=PHZ psya_othconthrs=PKZ psya_totconthrs=PNZ ///
psyac_regnhrlywage=PCA psyac_regnhrs=PFA psyac_othconthrlywage=PIA psyac_othconthrs=PLA psyac_totconthrs=POA ///
obst_regnhrlywage=PCB obst_regnhrs=PFB obst_othconthrlywage=PIB obst_othconthrs=PLB obst_totconthrs=POB ///
altb_regnhrlywage=PCC altb_regnhrs=PFC altb_othconthrlywage=PIC altb_othconthrs=PLC altb_totconthrs=POC ///
chem_regnhrlywage=PCD chem_regnhrs=PFD chem_othconthrlywage=PID chem_othconthrs=PLD chem_totconthrs=POD ///
reh_regnhrlywage=PCE reh_regnhrs=PFE reh_othconthrlywage=PIE reh_othconthrs=PLE reh_totconthrs=POE ///
hosp_regnhrlywage=PCF hosp_regnhrs=PFF hosp_othconthrlywage=PIF hosp_othconthrs=PLF hosp_totconthrs=POF ///
otha_regnhrlywage=PCG otha_regnhrs=PFG otha_othconthrlywage=PIG otha_othconthrs=PLG otha_totconthrs=POG ///
nur_regnhrlywage=PCH nur_regnhrs=PFH nur_othconthrlywage=PIH nur_othconthrs=PLH nur_totconthrs=POH ///
sa_regnhrlywage=PCI sa_regnhrs=PFI sa_othconthrlywage=PII sa_othconthrs=PLI sa_totconthrs=POI ///
sap_regnhrlywage=PCJ sap_regnhrs=PFJ sap_othconthrlywage=PIJ sap_othconthrs=PLJ sap_totconthrs=POJ ///
sn_regnhrlywage=PCK sn_regnhrs=PFK sn_othconthrlywage=PIK sn_othconthrs=PLK sn_totconthrs=POK ///
psyl_regnhrlywage=PCL psyl_regnhrs=PFL psyl_othconthrlywage=PIL psyl_othconthrs=PLL psyl_totconthrs=POL ///
intc_regnhrlywage=PCM intc_regnhrs=PFM intc_othconthrlywage=PIM intc_othconthrs=PLM intc_totconthrs=POM ///
res_regnhrlywage=PCN res_regnhrs=PFN res_othconthrlywage=PIN res_othconthrs=PLN res_totconthrs=PON ///
ols_regnhrlywage=PCO ols_regnhrs=PFO ols_othconthrlywage=PIO ols_othconthrs=PLO ols_totconthrs=POO ///
ods_regnhrlywage=PCP ods_regnhrs=PFP ods_othconthrlywage=PIP ods_othconthrs=PLP ods_totconthrs=POP ///
tot_regnhrlywage=PCQ tot_regnhrs=PFQ tot_othconthrlywage=PIQ tot_othconthrs=PLQ tot_totconthrs=POQ ///
using "$data/`file'", sheet("`sheet'") clear

if `x' < 13 {
	keep if _n >= 5
}

if `x' >= 13 {
	keep if _n >= 6
}

g pagenum = 211
drop if (state_facnum == "" | state_facnum == "0")

save "$output/page211", replace

sleep 4000

//Merge files
use "$output/page0", clear
drop if state_facnum == "0"
duplicates tag state_facnum rep_end rep_beg, g(dup)
assert dup == 0
drop dup

merge 1:1 state_facnum rep_end rep_beg using "$output/page1"
drop _m

merge 1:1 state_facnum rep_end rep_beg using "$output/page32"
drop _m
	
merge 1:1 state_facnum rep_end rep_beg using "$output/page40"
drop _m
	
merge 1:1 state_facnum rep_end rep_beg using "$output/page41"
drop _m

merge 1:1 state_facnum rep_end rep_beg using "$output/page5"
drop _m

merge 1:1 state_facnum rep_end rep_beg using "$output/page52"
drop _m 

merge 1:1 state_facnum rep_end rep_beg using "$output/page10"
drop _m
	
merge 1:1 state_facnum rep_end rep_beg using "$output/page12"
drop _m

merge 1:1 state_facnum rep_end rep_beg using "$output/page15"
drop _m

merge 1:1 state_facnum rep_end rep_beg using "$output/page17"
drop _m

merge 1:1 state_facnum desc_date using "$output/page20"
*assert _m != 1
drop if _m == 2
drop _m

merge 1:1 state_facnum rep_end rep_beg using "$output/page21"
drop _m

merge 1:1 state_facnum rep_end rep_beg using "$output/page211"
drop _m

//Generate indicators for whether hospital had patient days in each patient revenue center
foreach unit in msa peda psya psyac obst reh defo otha msic cic pic nic burn psyi oic /*nur*/ sa sn psyl intc res ods tot {
	g `unit'_pres = (`unit'_adultpatdays != "" | `unit'_pedpatdays != "")
}
	
g tot_licbeds_pres = tot_licbeds_end != ""
g tot_physhrs_pres = tot_physhrs != ""
g tot_rnhrs_pres = tot_rnhrs != ""
	
foreach unit in msa peda psya psyac obst reh defo otha msic cic pic nic burn psyi oic /*nur*/ sa sn psyl intc res ods tot {
	count if `unit'_rnhrs == "" & `unit'_pres == 1
	count if `unit'_rnhrs != "" & `unit'_pres == 1
}
	
save "$output/interimdata", replace

}
