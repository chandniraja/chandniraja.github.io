---
permalink: /datasets/
title: "Data Sets"
author_profile: true
---
In the process of working with the datasets mentioned below, I've learned a lot about what the data measure and how they map into economically meaningful variables. In case it's useful, I'm sharing code (data construction, data cleaning) and notes on measurement. The content is solely my responsibility and does not necessarily represent the views of the data provider or any other organization mentioned. All errors are mine. 

**HCAI Hospital Financial Data**
The California Department of Healthcare Access and Information (HCAI) provides public access to annual hospital financial disclosure reports filed by California hospitals. The data are notable in their granularity and timespan. These disclosure reports include data on volumes, capacity, revenues, labor, capital, and materials for Cailfornia hospitals. 

[[Notes on data and measurement]](../assets/pdf/data_hcai_notes.pdf)

Data years that are not provided on the website (https://hcai.ca.gov/data/cost-transparency/hospital-financials/) can be requested by contacting dataandreports@hcai.ca.gov. Data prior to FY 2000 are available as text files that can be imported into statistical software using dictionaries. The code below includes programs that import these text files from earlier years. Data after FY 2000 are available as Excel files. The code below includes a program that imports the Excel files into statistical software with variable names standardized between the earlier year text files and the later year Excel files. The final piece of code cleans the data and converts the FY data (where hospitals are reporting statistics for different time periods based on their unique fiscal years) into CY data (where I assume uniform distribution across the days in a given hospital's fiscal year). Please take a look at the READ_ME.txt file for details. 

[[Code for data construction and data cleaning]](../assets/pdf/Code for HCAI Hospital Financial Data.zip)