I include in this .zip folder several programs that import, clean, and standardize the HCAI Hospital Financial Data (https://hcai.ca.gov/data/cost-transparency/hospital-financials/):

1. oshpd_dataimport_1989_2002.do is a Stata program that imports the .txt files from earlier fiscal years
   *Note this file calls on the dictionaries for each fiscal year and page of the financial reporting form included in this folder (e.g. years15_page0 is a dictionary for the 15th year as recorded by HCAI and Page 0 of the reporting form). 
   
2. oshpd_dataimport_2002_2020.do is a Stata program that imports the .xls files for later fiscal years
   *Note this file calls on Excel spreadsheets that have been transposed so that rows represent observations and columns represent variables. I provide an example of this transpose with an example for the 38th fiscal year: the original file from HCAI (38hospitaldata.xlsx) and the transposed file that has been compressed (38hospitaldata_forimport.xlsx) which is used in the Stata program. 
   
   *Note that the variable names are standardized between (1) and (2). 
   
3. oshpd_dataappend.do is a Stata program that appends each of the fiscal year files imported in (1) and (2).

4. create_cy_data.do is a Stata program that takes the compilation in (3) and converts the data from being denominated in fiscal years to denominated in calendar years. 
   *Note that the series of programs here focuses on the variables that I use in my research - many are not imported even in steps (1) and (2) and many are then not carried through in step (4). This code can therefore be modified to import and include the variables that you're interested in studying (for the import of the .txt files in step (1) this would require updating the dictionaries.)
   
  
Date last updated: April 22, 2025