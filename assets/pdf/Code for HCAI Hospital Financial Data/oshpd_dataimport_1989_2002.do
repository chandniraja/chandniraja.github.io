clear
set more off
set type double

gl path "[[INSERT PATH HERE]]"
gl data "[[LOCATION OF THE COMPLETE DATA SET FILES FOR FISCAL YEARS 15-27]]"
gl programs "[[LOCATION OF THE DICTIONARIES]]"

forvalues x = 15/27 { //years 15-27
	
	sleep 1000
	
	if `x' == 15 { //year 15 (1989-1990)
		gl output "$path/Data/Processed/1989-1990"  
		local folder 15yr-1989-1990 
		local mid Data_txt
	}
	
	if `x' == 16 { //year 16 (1990-1991)
		gl output "$path/Data/Processed/1990-1991"
		local folder 16yr-1990-1991
		local mid Data_txt
	}
	
	if `x' == 17 { //year 17 (1991-1992)
		gl output "$path/Data/Processed/1991-1992"
		local folder 17yr-1991-1992
		local mid Data_txt
	}
	
	if `x' == 18 { //year 18 (1992-1993) first half
		gl output "$path/Data/Processed/1992-1993 (first half)"
		local folder 18yr-1992-1993
		local mid Data_txt
	}
	
	if `x' == 19 { //year 19 (1993-1994)
		gl output "$path/Data/Processed/1993-1994"
		local folder 19yr-1993-1994
		local mid Data_txt
	}
	
	if `x' == 20 { //year 20 (1994-1995)
		gl output "$path/Data/Processed/1994-1995"
		local folder 20yr-1994-1995
		local mid Data_txt
	}
	
	if `x' == 21 { //year 21 (1995-1996)
		gl output "$path/Data/Processed/1995-1996"
		local folder 21yr-1995-1996
		local mid Data_txt
	}
	
	if `x' == 22 { //year 22 (1996-1997)
		gl output "$path/Data/Processed/1996-1997"
		local folder 22yr-1996-1997
		local mid Data_txt
	}
	
	if `x' == 23 { //year 23 (1997-1998)
		gl output "$path/Data/Processed/1997-1998"
		local folder 23yr-1997-1998
		local mid hosp23rd
	}
	
	if `x' == 24 { //year 24 (1998-1999)
		gl output "$path/Data/Processed/1998-1999"
		local folder 24yr-1998-1999
		local mid hosp24th
	}
	
	if `x' == 25 { //year 25 (1999-2000)
		gl output "$path/Data/Processed/1999-2000"
		local folder 25yr-1999-2000
		local mid hosp25th
	}
	
	if `x' == 26 { //year 26 (2000-2001)
		gl output "$path/Data/Processed/2000-2001"
		local folder 26yr-2000-2001
		local mid hosp26th
	}
	
	if `x' == 27 { //year 27 (2001-2002)
		gl output "$path/Data/Processed/2001-2002"
		local folder 27yr-2001-2002
		local mid "Hos27 Page-Line Files"
	}
	
	if `x' == 28 { //year 18 (1992-1993) second half
		gl output "$path/Data/Processed/1992-1993 (second half)"
		local folder 18yr-1992-1993
		local mid Data_txt
	}
	
	//Page 0 (general info)
	//All years 
	clear	
	if `x' < 18 {
		infile using "$programs/years15_page0.dct", using("$data/`folder'/`mid'/H`x'P000.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page0.dct", using("$data/`folder'/`mid'/HF18P000.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page0.dct", using("$data/`folder'/`mid'/H`x'P000.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page0.dct", using("$data/`folder'/`mid'/H`x'P000.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page0.dct", using("$data/`folder'/`mid'/H`x'P000.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page0.dct", using("$data/`folder'/`mid'/H`x'.P000.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page0.dct", using("$data/`folder'/`mid'/H`x'.P000.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page0.dct", using("$data/`folder'/`mid'/H`x'A.P000.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page0.dct", using("$data/`folder'/`mid'/HR18P000.txt")
	}
	
	replace pagenum = 0 if pagenum == .
	drop if provname == "" // last line
	drop blank blank2 // blanks in the report key are reported as "unused" therefore safe to drop
	save "$output/page0", replace
	
	//Page 1 (hospital desc - only through line 1790 for now)
	//All years
	clear
	if `x' < 18 {
		infile using "$programs/years15_page1.dct", using("$data/`folder'/`mid'/H`x'P001.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page1.dct", using("$data/`folder'/`mid'/HF18P001.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page1.dct", using("$data/`folder'/`mid'/H`x'P010.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page1.dct", using("$data/`folder'/`mid'/H`x'P010.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page1.dct", using("$data/`folder'/`mid'/H`x'P010.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page1.dct", using("$data/`folder'/`mid'/H`x'.P010.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page1.dct", using("$data/`folder'/`mid'/H`x'.P010.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page1.dct", using("$data/`folder'/`mid'/H`x'A.P010.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page1.dct", using("$data/`folder'/`mid'/HR18P010.txt")
	}
	
	drop blank* // some of these are free form answers as to whether there are any govt programs / prepaid programs 
	// drop for now
	drop if oshpd_facnum == "" // last line
	save "$output/page1", replace
	
	//Page 3.2 (physician financial arrangements)
	//I only created the dictionaries for years 18.5 onwards so importing years 1996 onwards (years 21 through 27)
	clear
	
	if `x' >= 21 & `x' < 28 {
		if `x' == 21 {
			infile using "$programs/years18_page32.dct", using("$data/`folder'/`mid'/H`x'P03A.txt")
		}
		if `x' == 22 {
			infile using "$programs/years22_page32.dct", using("$data/`folder'/`mid'/H`x'P03A.txt")
		}
		if `x' == 23 {
			infile using "$programs/years23_page32.dct", using("$data/`folder'/`mid'/H`x'P03A.txt")
		}
		if `x' == 24 | `x' == 25 {
			infile using "$programs/years23_page32.dct", using("$data/`folder'/`mid'/H`x'.P03A.txt")
		}
		if `x' == 26 {
			infile using "$programs/years26_page32.dct", using("$data/`folder'/`mid'/H`x'.P03A.AA.txt")
		}
		if `x' == 27 {
			infile using "$programs/years26_page32.dct", using("$data/`folder'/`mid'/H`x'A.P03A.AA.txt")
		}
		drop if oshpd_facnum == "" // last line
		save "$output/page32", replace
	}
	
	//Page 4.1 (patient census statistics)
	//All years
	
	clear
	if `x' < 18 {
		infile using "$programs/years15_page4.dct", using("$data/`folder'/`mid'/H`x'P004.txt") 
	}
	if `x' == 18 {
		infile using "$programs/years15_page4.dct", using("$data/`folder'/`mid'/HF18P004.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page4.dct", using("$data/`folder'/`mid'/H`x'P041.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page4.dct", using("$data/`folder'/`mid'/H`x'P041.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page4.dct", using("$data/`folder'/`mid'/H`x'P041.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page4.dct", using("$data/`folder'/`mid'/H`x'.P041.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page40.dct", using("$data/`folder'/`mid'/H`x'.P040.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page40.dct", using("$data/`folder'/`mid'/H`x'A.P040.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page4.dct", using("$data/`folder'/`mid'/HR18P041.txt")
	}
	
	drop blank blank2
	
	if `x' <= 18 {
		forvalues y = 3/49 {
			destring blank`y', replace
			egen sum_blank`y' = sum(blank`y')
			assert sum_blank`y' == 0
			drop sum_blank`y' blank`y'
		}
	}
	drop if oshpd_facnum == "" // last line
	
	if `x' != 26 & `x' != 27 {
		save "$output/page4", replace
	}
	
	if `x' == 26 | `x' == 27 {
		save "$output/page40", replace
		clear
		
		if `x' == 26 {
			infile using "$programs/years26_page41.dct", using("$data/`folder'/`mid'/H`x'.P041.AA.txt")
		}
		
		if `x' == 27 {
			infile using "$programs/years26_page41.dct", using("$data/`folder'/`mid'/H`x'A.P041.AA.txt")
		}
		drop blank blank2
		
		drop if oshpd_facnum == "" // last line
		save "$output/page41", replace
	}

	//Page 4.2 (patient census for ambulatory and ancillary services)
	//I only created the dictionaries for years 18.5 onwards so importing years 1996 onwards (years 21 through 25)
	//This page doesn't exist after year 25
	
	clear
	
	if `x' == 21 {
		infile using "$programs/years18_page42.dct", using("$data/`folder'/`mid'/H21P042.txt")
	}
	
	if `x' == 22 {
		infile using "$programs/years22_page42.dct", using("$data/`folder'/`mid'/H22P042.txt")
	}
		
	if `x' == 23 {
		infile using "$programs/years23_page42.dct", using("$data/`folder'/`mid'/H23P042.txt")
	}
		
	if `x' == 24 {
		infile using "$programs/years23_page42.dct", using("$data/`folder'/`mid'/H24.P042.txt")
	}
		
	if `x' == 25 {
		infile using "$programs/years23_page42.dct", using("$data/`folder'/`mid'/H25.P042.txt")
	}
	
	if `x' >= 21 & `x' < 26 {
		drop if oshpd_facnum == "" // last line
		save "$output/page42", replace
	}
	
	//Page 5 (balance sheet, unrestricted fund)
	//All years
	
	clear

	if `x' < 18 {
		infile using "$programs/years15_page5.dct", using("$data/`folder'/`mid'/H`x'P05A.txt") 
	}
	if `x' == 18 {
		infile using "$programs/years15_page5.dct", using("$data/`folder'/`mid'/HF18P05A.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page5.dct", using("$data/`folder'/`mid'/H`x'P050.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page5.dct", using("$data/`folder'/`mid'/H`x'P050.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page5.dct", using("$data/`folder'/`mid'/H`x'P050.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page5.dct", using("$data/`folder'/`mid'/H`x'.P05.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page5.dct", using("$data/`folder'/`mid'/H`x'.P050.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page5.dct", using("$data/`folder'/`mid'/H`x'A.P050.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page5.dct", using("$data/`folder'/`mid'/HR18P005.txt")
	}
	
	drop if oshpd_facnum == "" // last line
	
	save "$output/page5", replace
	
	//Page 5.2 (statement of changes to plant, property, and equipment)
	//I only created the dictionaries for years 18.5 onwards so importing years 1996 onwards (years 21 through 27)
	clear
	if `x' >= 21 & `x' < 28 {
		if `x' == 21 {
			infile using "$programs/years18_page52.dct", using("$data/`folder'/`mid'/H`x'P052.txt")
		}
		if `x' == 22 {
			infile using "$programs/years22_page52.dct", using("$data/`folder'/`mid'/H`x'P052.txt")
		}
		if `x' == 23 {
			infile using "$programs/years23_page52.dct", using("$data/`folder'/`mid'/H`x'P052.txt")
		}
		if `x' == 24 | `x' == 25 {
			infile using "$programs/years23_page52.dct", using("$data/`folder'/`mid'/H`x'.P052.txt")
		}
		if `x' == 26 {
			infile using "$programs/years26_page52.dct", using("$data/`folder'/`mid'/H`x'.P052.AA.txt")
		}
		if `x' == 27 {
			infile using "$programs/years26_page52.dct", using("$data/`folder'/`mid'/H`x'A.P052.AA.txt")
		}
		
		drop if oshpd_facnum == "" // last line
		
		save "$output/page52", replace
	}

	//Page 10 (costs)
	//All years
	clear
	if `x' < 18 {
		infile using "$programs/years15_page10.dct", using("$data/`folder'/`mid'/H`x'P010.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page10.dct", using("$data/`folder'/`mid'/HF18P010.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page10.dct", using("$data/`folder'/`mid'/H`x'P100.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page10.dct", using("$data/`folder'/`mid'/H`x'P100.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page10.dct", using("$data/`folder'/`mid'/H`x'P100.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page10.dct", using("$data/`folder'/`mid'/H`x'.P100.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page10.dct", using("$data/`folder'/`mid'/H`x'.P100.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page10.dct", using("$data/`folder'/`mid'/H`x'A.P100.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page10.dct", using("$data/`folder'/`mid'/HR18P100.txt")
	}
	
	drop blank*
	
	drop if oshpd_facnum == "" // last line
	
	save "$output/page10", replace
	

	//Page 12 (patient revenue producing centers)
	//All years
	
	clear 
	if `x' < 18 {
		infile using "$programs/years15_page12.dct", using("$data/`folder'/`mid'/H`x'P012.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page12.dct", using("$data/`folder'/`mid'/HF18P012.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page12.dct", using("$data/`folder'/`mid'/H`x'P12A.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page12.dct", using("$data/`folder'/`mid'/H`x'P12A.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page12.dct", using("$data/`folder'/`mid'/H`x'P12A.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page12.dct", using("$data/`folder'/`mid'/H`x'.P12A.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page12.dct", using("$data/`folder'/`mid'/H`x'.P12A.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page12.dct", using("$data/`folder'/`mid'/H`x'A.P12A.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page12.dct", using("$data/`folder'/`mid'/HR18P12A.txt")
	}
	
	drop blank blank2
	
	if `x' <= 18 {
		forvalues y = 3/140 {
			destring blank`y', replace
			egen sum_blank`y' = sum(blank`y')
			assert sum_blank`y' == 0
			drop sum_blank`y' blank`y'
		}
	}
	drop if oshpd_facnum == "" // last line
	
	save "$output/page12", replace
	
	//Page 15 
	// Only exists for 1992 second half onwards
	
	if `x' > 18 {
		clear
		if `x' > 18 & `x' < 22 {
			infile using "$programs/years18_page15.dct", using("$data/`folder'/`mid'/H`x'P150.txt")
		}
		if `x' == 22 {
			infile using "$programs/years22_page15.dct", using("$data/`folder'/`mid'/H`x'P150.txt")
		}
		if `x' == 23 {
			infile using "$programs/years23_page15.dct", using("$data/`folder'/`mid'/H`x'P150.txt")
		}
		if `x' == 24 | `x' == 25 {
			infile using "$programs/years23_page15.dct", using("$data/`folder'/`mid'/H`x'.P150.txt")
		}
		if `x' == 26 {
			infile using "$programs/years26_page15.dct", using("$data/`folder'/`mid'/H`x'.P150.AA.txt")
		}
		if `x' == 27 {
			infile using "$programs/years26_page15.dct", using("$data/`folder'/`mid'/H`x'A.P150.AA.txt")
		}
		if `x' == 28 {
			infile using "$programs/years18_page15.dct", using("$data/`folder'/`mid'/HR18P150.txt")
		}
		
		drop blank blank2
		
		if `x' <= 18 {
			forvalues y = 3/56 {
				destring blank`y', replace
				egen sum_blank`y' = sum(blank`y')
				assert sum_blank`y' == 0
				drop sum_blank`y' blank`y'
			}
		}
		drop if oshpd_facnum == "" // last line
		
		save "$output/page15", replace
	}

	//Page 17
	//All years
	
	clear
	if `x' < 18 {
		infile using "$programs/years15_page17.dct", using("$data/`folder'/`mid'/H`x'P17A.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page17.dct", using("$data/`folder'/`mid'/HF18P17A.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page17.dct", using("$data/`folder'/`mid'/H`x'P17A.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page17.dct", using("$data/`folder'/`mid'/H`x'P17A.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page17.dct", using("$data/`folder'/`mid'/H`x'P17A.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page17.dct", using("$data/`folder'/`mid'/H`x'.P17A.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page17.dct", using("$data/`folder'/`mid'/H`x'.P17A.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page17.dct", using("$data/`folder'/`mid'/H`x'A.P17A.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page17.dct",  using("$data/`folder'/`mid'/HR18P17A.txt")
	}
	
	drop blank*
	
	drop if oshpd_facnum == "" // last line
	
	save "$output/page17", replace

	//Page 20b
	clear 
	if `x' < 18 {
		infile using "$programs/years15_page20.dct", using("$data/`folder'/`mid'/H`x'P20B.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page20.dct", using("$data/`folder'/`mid'/HF18P20B.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page20.dct", using("$data/`folder'/`mid'/H`x'P20B.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page20.dct", using("$data/`folder'/`mid'/H`x'P20B.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page20.dct", using("$data/`folder'/`mid'/H`x'P20B.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page20.dct", using("$data/`folder'/`mid'/H`x'.P20B.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page20.dct", using("$data/`folder'/`mid'/H`x'.P20B.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page20.dct", using("$data/`folder'/`mid'/H`x'A.P20B.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page20.dct", using("$data/`folder'/`mid'/HR18P20B.txt")
	}
	
	drop if oshpd_facnum == "" // last line
	
	save "$output/page20b", replace

	//Page 21a 
	clear 
	if `x' < 18 {
		infile using "$programs/years15_page21a.dct", using("$data/`folder'/`mid'/H`x'P21A.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page21a.dct", using("$data/`folder'/`mid'/HF18P21A.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page21a.dct", using("$data/`folder'/`mid'/H`x'P21A.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page21a.dct", using("$data/`folder'/`mid'/H`x'P21A.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page21a.dct", using("$data/`folder'/`mid'/H`x'P21A.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page21a.dct", using("$data/`folder'/`mid'/H`x'.P21A.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page21a.dct", using("$data/`folder'/`mid'/H`x'.P21A.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page21a.dct", using("$data/`folder'/`mid'/H`x'A.P21A.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page21a.dct", using("$data/`folder'/`mid'/HR18P21A.txt")
	}

	// there were no decimal places in the original txt files for the wage variables but it should be placed two from the end
	foreach var of varlist *hrlywage {
		g `var'set =  substr(`var', -2,.)
		g `var'len = strlen(`var') - 2
		g `var'first = substr(`var', 1, `var'len)
		g new_`var' = `var'first + "." + `var'set
		*destring new_`var', replace
		drop `var'set `var'len `var'first `var'
		rename new_`var' `var'
	}
	drop blank*
	
	drop if oshpd_facnum == "" // last line

	save "$output/page21a", replace
	
	//Page 21b
	clear 
	if `x' < 18 {
		infile using "$programs/years15_page21b.dct", using("$data/`folder'/`mid'/H`x'P21B.txt")
	}
	if `x' == 18 {
		infile using "$programs/years15_page21b.dct", using("$data/`folder'/`mid'/HF18P21B.txt")
	}
	if `x' > 18 & `x' < 22 {
		infile using "$programs/years18_page21b.dct", using("$data/`folder'/`mid'/H`x'P21B.txt")
	}
	if `x' == 22 {
		infile using "$programs/years22_page21b.dct", using("$data/`folder'/`mid'/H`x'P21B.txt")
	}
	if `x' == 23 {
		infile using "$programs/years23_page21b.dct", using("$data/`folder'/`mid'/H`x'P21B.txt")
	}
	if `x' == 24 | `x' == 25 {
		infile using "$programs/years23_page21b.dct", using("$data/`folder'/`mid'/H`x'.P21B.txt")
	}
	if `x' == 26 {
		infile using "$programs/years26_page21b.dct", using("$data/`folder'/`mid'/H`x'.P21B.AA.txt")
	}
	if `x' == 27 {
		infile using "$programs/years26_page21b.dct", using("$data/`folder'/`mid'/H`x'A.P21B.AA.txt")
	}
	if `x' == 28 {
		infile using "$programs/years18_page21b.dct", using("$data/`folder'/`mid'/HR18P21B.txt")
	}

	// there were no decimal places in the original txt files for the wage variables but it should be placed two from the end
	foreach var of varlist *hrlywage {
		g `var'set =  substr(`var', -2,.)
		g `var'len = strlen(`var') - 2
		g `var'first = substr(`var', 1, `var'len)
		g new_`var' = `var'first + "." + `var'set
		*destring new_`var', replace
		drop `var'set `var'len `var'first `var'
		rename new_`var' `var'
	}
	drop blank*

	drop if oshpd_facnum == "" // last line

	save "$output/page21b", replace
	
	//Page 21.1 
	// Only exists for 1992 second half onwards
	
	if `x' > 18 {
	
		clear
		if `x' > 18 & `x' < 22 {
			infile using "$programs/years18_page211.dct", using("$data/`folder'/`mid'/H`x'P211.txt")
		}
		if `x' == 22 {
			infile using "$programs/years22_page211.dct", using("$data/`folder'/`mid'/H`x'P211.txt")
		}
		if `x' == 23 {
			infile using "$programs/years23_page211.dct", using("$data/`folder'/`mid'/H`x'P211.txt")
		}
		if `x' == 24 | `x' == 25 {
			infile using "$programs/years23_page211.dct", using("$data/`folder'/`mid'/H`x'.P211.txt")
		}
		if `x' == 26 {
			infile using "$programs/years26_page211.dct", using("$data/`folder'/`mid'/H`x'.P211.AA.txt")
		}
		if `x' == 27 {
			infile using "$programs/years26_page211.dct", using("$data/`folder'/`mid'/H`x'A.P211.AA.txt")
		}
		if `x' == 28 {
			infile using "$programs/years18_page211.dct", using("$data/`folder'/`mid'/HR18P211.txt")
		}
		
		// there were no decimal places in the original txt files for the wage variables but it should be placed two from the end
		foreach var of varlist *hrlywage {
			g `var'set =  substr(`var', -2,.)
			g `var'len = strlen(`var') - 2
			g `var'first = substr(`var', 1, `var'len)
			g new_`var' = `var'first + "." + `var'set
			*destring new_`var', replace
			drop `var'set `var'len `var'first `var'
			rename new_`var' `var'
		}
		drop blank blank2
		
		drop if oshpd_facnum == "" // last line
		save "$output/page211", replace
	}
	
	//Merge files
	use "$output/page0", clear
	duplicates tag oshpd_facnum fyear_end fyear_beg, g(dup)
	assert dup == 0
	drop dup

	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page1"
	drop _m
	
	if `x' >= 21 & `x' < 28 {
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page32"
		drop _m 
	}
	
	if `x' != 26 & `x' != 27 {
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page4"
		drop _m
	}
	
	if `x' == 26 | `x' == 27 {
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page40"
		drop _m
		
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page41"
		drop _m
		
	}
	
	if `x' >= 21 & `x' < 26 {
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page42"
		drop _m
	}
	
	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page5"
	drop _m 
	
	if `x' >= 21 & `x' < 28 {
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page52"
		drop _m
	}
	
	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page10", force
	drop _m
	
	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page12"
	drop _m
	
	if `x' > 18 & `x' < 28 {
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page15"
		drop _m
	}
	
	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page17"
	drop _m
	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page20b"
	drop _m 
	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page21a"
	drop _m 
	merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page21b"
	drop _m 
	
	if `x' > 18 & `x' < 28 {
		merge 1:1 oshpd_facnum fyear_end fyear_beg using "$output/page211"
		drop _m
	}
	
	//Generate indicators for whether hospital had patient days in each patient revenue center
	foreach unit in msa peda psya psyac obst reh defo otha msic cic pic nic burn psyi oic nur sa sn psyl intc res ods tot {
		g `unit'_pres = (`unit'_adultpatdays != "" | `unit'_pedpatdays != "")
	}
	
	g tot_licbeds_pres = tot_licbeds_end != ""
	g tot_physhrs_pres = tot_physhrs != ""
	g tot_rnhrs_pres = tot_rnhrs != ""
	
	foreach unit in msa peda psya psyac obst reh defo otha msic cic pic nic burn psyi oic nur sa sn psyl intc res ods tot {
		count if `unit'_rnhrs == "" & `unit'_pres == 1
		count if `unit'_rnhrs != "" & `unit'_pres == 1
	}
	
	save "$output/interimdata", replace
}
