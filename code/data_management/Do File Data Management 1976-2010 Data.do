*HDI 1980-2014 5 year intervalls*

import excel "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\HDI 1980-2014 5 year intervalls_trimmed.xlsx", sheet("Tabelle1") clear

rename D abc1980 
rename E abc1985
rename F abc1990
rename G abc1995
rename H abc2000
rename I abc2005
rename J abc2010
rename K abc2011
rename L abc2012
rename M abc2013
rename N abc2014

drop A B
rename C country
drop in 1/2

reshape long abc, i(country) j(year)
rename abc hdi

destring, replace

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI.dta", replace

*Imports*

import excel "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Imports.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc imports

drop if year<1976
drop if year==2015

order country countrycode year imports

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Imports 1976-2014.dta", replace

*Exports*

import excel "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Exports.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc exports

drop if year<1976
drop if year==2015

order country countrycode year exports

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Exports 1976-2014.dta", replace

*GDP*

import excel "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GDP.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc gdp

drop if year<1976
drop if year==2015

order country countrycode year gdp

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP 1976-2014.dta", replace

*GDP per capita PPP*

import delimited "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GDP per capita PPP.csv"

rename isocode countrycode
rename rgdpch gdppc

keep country countrycode year openc openk gdppc
drop if year<1976

order country countrycode year gdppc

tabulate country

replace country="Brunei Darussalam" if country=="Brunei"
replace country="Cabo Verde" if country=="Cape Verde"
replace country="Congo (Dem. Rep. of the)" if country=="Congo, Dem. Rep."
replace country="Congo" if country=="Congo, Republic of"
replace country="Côte d'Ivoire" if country=="Cote d`Ivoire"
replace country="Korea (Rep. of)" if country=="Korea, Republic of"
replace country="Gambia" if country=="Gambia, The"
replace country="Micronesia" if country=="Micronesia, Fed. Sts."
replace country="Russian Federation" if country=="Russia"
replace country="Slovakia" if country=="Slovak Republic"
replace country="Saint Lucia" if country=="St. Lucia"
replace country="Saint Kitts and Nevis" if country=="St. Kitts & Nevis"
replace country="Saint Vincent and the Grenadines" if country=="St.Vincent & Grenadines"
replace country="Trinidad and Tobago" if country=="Trinidad &Tobago"
replace country="Viet Nam" if country=="Vietnam"

drop if country=="China Version 2"
replace country="China" if country=="China Version 1"

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP per capita 1976-2009.dta", replace

*Generating Open*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP 1976-2014.dta", clear

merge 1:1 country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Imports 1976-2014.dta"
drop _merge
merge 1:1 country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Exports 1976-2014.dta"
drop _merge

g open = (imports+exports)/gdp

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open 1976-2014.dta", replace

*Population*

import excel "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Population.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc pop

drop if year<1976
drop if year==2015

order country countrycode year pop

g lnpop = ln(pop)

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Population 1976-2014.dta", replace

*Disasters*

import excel "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Disasters.xlsx", sheet("Disasters") firstrow

rename country_name country
rename iso countrycode

order country countrycode year
sort country year

rename disastertype disaster
rename Totaldeaths deaths
rename Affected affected
rename Injured injured
rename Homeless homeless
rename Totalaffected totalaffected
rename Totaldamage totaldamage

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters.dta", replace

*Applying the Decision Rule of Felbermayr & Gröschl (2012)*

	*Disaster Types*
	
use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All disasters.dta", clear

tabulate disaster

drop if disaster=="Animal accident"
drop if disaster=="Epidemic"
drop if disaster=="Extreme temperature "
drop if disaster=="Flood"
drop if disaster=="Industrial accident"
drop if disaster=="Insect infestation"
drop if disaster=="Landslide"
drop if disaster=="Miscellaneous accident"
drop if disaster=="Transport accident"
drop if disaster=="Wildfire"

drop disaster 
rename occurrence disaster

drop if year<1976

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1976-2014.dta", replace

	*Large Disasters*
	*Deaths*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1976-2014.dta", replace

drop homeless totaldamage affected injured totalaffected
drop if deaths<1000 

drop if deaths==.
rename disaster largedisaster

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths).dta", replace

	*Injured*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1976-2014.dta", replace

drop homeless totaldamage deaths affected totalaffected
drop if injured<1000 

drop if injured==.
rename disaster largedisaster

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured).dta", replace

	*Total Affected*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1976-2014.dta", replace

drop homeless totaldamage deaths affected injured
drop if totalaffected<100000 

drop if totalaffected==.
rename disaster largedisaster

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected).dta", replace

	*Merging Large Disaster in Terms of Deaths, Injured and Total Affected*
	
use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths).dta"
merge m:m country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured).dta"
drop _merge
merge m:m country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected).dta"
drop _merge

sort country countrycode year
save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected).dta", replace

	*Merging Disasters and Large Disasters*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1976-2014.dta"

drop deaths affected injured totalaffected homeless totaldamage

collapse (sum) disaster, by(country countrycode year)

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters MERGE FILE.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected).dta"

collapse (sum) largedisaster, by(country countrycode year)

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters MERGE FILE.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters MERGE FILE.dta"
merge m:m country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters MERGE FILE.dta"
drop _merge

replace largedisaster=0 if largedisaster==.

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1976-2014.dta", replace

*Merging GDP, Imports, Exports, Open with Population and ln Population*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open 1976-2014.dta", clear
merge m:m country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Population 1976-2014.dta"
drop _merge

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population and ln Population.dta", replace

*Preparation of Merging GDP, Imports, Exports, Open, Population and ln Population with HDI*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI.dta", clear

tabulate country

replace country="Bolivia" if country=="Bolivia (Plurinational State of)"
replace country="Congo (Dem. Rep. of the)" if country=="Congo (Democratic Republic of the)"
replace country="Côte d'Ivoire" if country=="Ce d'Ivoire"
replace country="Hong Kong" if country=="Hong Kong, China (SAR)"
replace country="Iran" if country=="Iran (Islamic Republic of)"
replace country="Korea (Rep. of)" if country=="Korea (Republic of)"
replace country="Laos" if country=="Lao People's Democratic Republic"
replace country="Micronesia" if country=="Micronesia (Federated States of)"
replace country="Moldova" if country=="Moldova (Republic of)"
replace country="Palestine" if country=="Palestine, State of"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="Tanzania" if country=="Tanzania (United Republic of)"
replace country="Macedonia" if country=="The former Yugoslav Republic of Macedonia"
replace country="Venezuela" if country=="Venezuela (Bolivarian Republic of)"

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI.dta", replace

clear 

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population and ln Population 1976-2014.dta"

tabulate country

replace country="Bahamas" if country=="Bahamas, The"
replace country="Congo (Dem. Rep. of the)" if country=="Congo, Dem. Rep."
replace country="Congo" if country=="Congo, Rep."
replace country="Côte d'Ivoire" if country=="Cote d'Ivoire"
replace country="Egypt" if country=="Egypt, Arab Rep."
replace country="Gambia" if country=="Gambia, The"
replace country="Hong Kong" if country=="Hong Kong SAR, China"
replace country="Iran" if country=="Iran, Islamic Rep."
replace country="Korea (Dem. People's Rep. of)" if country=="Korea, Dem. People’s Rep."
replace country="Korea (Rep. of)" if country=="Korea, Rep."
replace country="Kyrgyzstan" if country=="Kyrgyz Republic"
replace country="Laos" if country=="Lao PDR"
replace country="Macedonia" if country=="Macedonia, FYR"
replace country="Micronesia" if country=="Micronesia, Fed. Sts."
replace country="Slovakia" if country=="Slovak Republic"
replace country="Saint Kitts and Nevis" if country=="St. Kitts and Nevis"
replace country="Saint Lucia" if country=="St. Lucia"
replace country="Saint Vincent and the Grenadines" if country=="St. Vincent and the Grenadines"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="Venezuela" if country=="Venezuela, RB"
replace country="Viet Nam" if country=="Vietnam"
replace country="Yemen" if country=="Yemen, Rep."

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population and ln Population 1976-2014.dta", replace

*Merging GDP, Imports, Exports, Open, Population and ln Population with HDI*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population and ln Population 1976-2014.dta"
merge 1:m country year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI.dta"
drop _merge

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population, ln Population and HDI 1976-2014.dta", replace

*Preparation of Merging GDP, Imports, Exports, Open, Population, ln Population and HDI with Disasters and Large Disasters*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1976-2014.dta", clear

tabulate country

replace country="Bahamas" if country=="Bahamas (the)"
replace country="Bolivia" if country=="Bolivia (Plurinational State of)"
replace country="Comoros" if country=="Comoros (the)"
replace country="Congo (Dem. Rep. of the)" if country=="Congo (the Democratic Republic of the)"
replace country="Congo" if country=="Congo (the)"
replace country="Czech Republic" if country=="Czech Republic (the)"
replace country="Côte d'Ivoire" if country=="Côte d’Ivoire"
replace country="Dominican Republic" if country=="Dominican Republic (the)"
replace country="Gambia" if country=="Gambia (the)"
replace country="Iran" if country=="Iran (Islamic Republic of)"
replace country="Korea (Dem. People's Rep. of)" if country=="Korea (the Democratic People's Republic of)"
replace country="Korea (Rep. of)" if country=="Korea (the Republic of)"
replace country="Laos" if country=="Lao People's Democratic Republic (the)"
replace country="Macedonia" if country=="Macedonia (the former Yugoslav Republic of)"
replace country="Micronesia" if country=="Micronesia (Federated States of)"
replace country="Moldova" if country=="Moldova (the Republic of)"
replace country="Netherlands" if country=="Netherlands (the)"
replace country="Niger" if country=="Niger (the)"
replace country="Palestine" if country=="Palestine, State of"
replace country="Philippines" if country=="Philippines (the)"
replace country="Russian Federation" if country=="Russian Federation (the)"
replace country="Sudan" if country=="Sudan (the)"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="Tanzania" if country=="Tanzania, United Republic of"
replace country="United Kingdom" if country=="United Kingdom of Great Britain and Northern Irela"
replace country="United States" if country=="United States of America (the)"
replace country="Venezuela" if country=="Venezuela (Bolivarian Republic of)"

replace country="Germany" if country=="Germany Dem Rep"
replace country="Germany" if country=="Germany Fed Rep"
replace country="Yemen" if country=="Yemen Arab Rep"
replace country="Yemen" if country=="Yemen P Dem Rep"

collapse (sum) disaster largedisaster, by(country year)

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1976-2014.dta", replace

*Merging GDP, Imports, Exports, Open, Population, ln Population and HDI with Disasters and Large Disasters*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population, ln Population and HDI 1976-2014.dta"
merge m:m country year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1976-2014.dta"

drop if _merge==2
drop _merge

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population, ln Population, HDI, Disasters and Large Disasters 1976-2014.dta", replace

*Further Data Preparation*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP, Imports, Exports, Open, Population, ln Population, HDI, Disasters and Large Disasters 1976-2014.dta"

tabulate country

drop if country=="American Samoa"
drop if country=="Arab World"
drop if country=="Aruba"
drop if country=="Bermuda"
drop if country=="Caribbean small states"
drop if country=="Cayman Islands"
drop if country=="Central Europe and the Baltics"
drop if country=="Channel Islands"
drop if country=="Curacao"
drop if country=="East Asia & Pacific (all income levels)"
drop if country=="East Asia & Pacific (developing only)"
drop if country=="Euro area"
drop if country=="Europe & Central Asia (all income levels)"
drop if country=="Europe & Central Asia (developing only)"
drop if country=="European Union"
drop if country=="Faroe Islands"
drop if country=="Fragile and conflict affected situations"
drop if country=="French Polynesia"
drop if country=="Greenland"
drop if country=="Guam"
drop if country=="Heavily indebted poor countries (HIPC)"
drop if country=="High income"
drop if country=="High income: OECD"
drop if country=="High income: nonOECD"
drop if country=="Isle of Man"
drop if country=="Korea (Dem. People's Rep. of)"
drop if country=="Kosovo"
drop if country=="Latin America & Caribbean (all income levels)"
drop if country=="Latin America & Caribbean (developing only)"
drop if country=="Least developed countries: UN classification"
drop if country=="Low & middle income"
drop if country=="Low income"
drop if country=="Lower middle income"
drop if country=="Macao SAR, China"
drop if country=="Marshall Islands"
drop if country=="Middle East & North Africa (all income levels)"
drop if country=="Middle East & North Africa (developing only)"
drop if country=="Middle income"
drop if country=="Monaco"
drop if country=="New Caledonia"
drop if country=="North America"
drop if country=="Northern Mariana Islands"
drop if country=="Not classified"
drop if country=="OECD members"
drop if country=="Other small states"
drop if country=="Pacific island small states"
drop if country=="Puerto Rico"
drop if country=="San Marino"
drop if country=="Sint Maarten (Dutch part)"
drop if country=="Small states"
drop if country=="Somalia"
drop if country=="South Asia"
drop if country=="St. Martin (French part)"
drop if country=="Sub-Saharan Africa (all income levels)"
drop if country=="Sub-Saharan Africa (developing only)"
drop if country=="Turks and Caicos Islands"
drop if country=="Tuvalu"
drop if country=="Upper middle income"
drop if country=="Virgin Islands (U.S.)"
drop if country=="West Bank and Gaza"
drop if country=="World"

replace disaster=0 if disaster==.
replace largedisaster=0 if largedisaster==.

g laglargedisaster = largedisaster[_n-1]
g lagdisaster = disaster[_n-1]

replace laglargedisaster=. if year==1976
replace lagdisaster=. if year==1976

drop gdp imports exports pop hdi disaster lagdisaster

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Open, ln Population, Large Disasters, and lagged Large Disasters 1976-2014.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Open, ln Population, Large Disasters, and lagged Large Disasters 1976-2014.dta"

gen period = floor((year - 1976) / 5)
collapse open lnpop largedisaster laglargedisaster, by(period country)

sort country period

label variable period "5 year intervalls 1976-2014"
label variable open "(mean) open 5 year intervalls 1976-2014"
label variable lnpop "(mean) lnpop 5 year intervalls 1976-2014"
label variable largedisaster "(mean) largedisaster 5 year intervalls 1976-2014"
label variable laglargedisaster "(mean) laglargedisaster 5 year intervalls 1976-2014"

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls (mean) Open, ln Population, Large Disasters, and lagged Large Disasters 1976-2014.dta", replace

clear 

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI.dta"

replace year=2014 if year==2011
replace year=2014 if year==2012
replace year=2014 if year==2013
collapse hdi, by(country year)

rename year period
replace period=0 if period==1980
replace period=1 if period==1985
replace period=2 if period==1990
replace period=3 if period==1995
replace period=4 if period==2000
replace period=5 if period==2005
replace period=6 if period==2010
replace period=7 if period==2014

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI 5 year periods.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls (mean) Open, ln Population, Large Disasters, and lagged Large Disasters 1976-2014.dta"
merge 1:m country period using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI 5 year periods.dta"
drop _merge

ta period, gen(period)

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Full Country Sample 1976-2014_29.06.2016.dta", replace

*MRW Sample Creation*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Full Country Sample 1976-2014_29.06.2016.dta"

drop if country!="Algeria" & country!="Angola" & country!="Argentina" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" & country!="Benin" ///
& country!="Benin" & country!="Bolivia" & country!="Brazil" & country!="Burkina Faso" ///
& country!="Burundi" & country!="Cameroon" & country!="Canada" & country!="Central African Republic" ///
& country!="Chad" & country!="Chile" & country!="Colombia" & country!="Congo (Dem. Rep. of the)" ///
& country!="Congo" & country!="Costa Rica" & country!="Côte d'Ivoire" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="Egypt" & country!="El Salvador" ///
& country!="Ethiopia" & country!="Finland" & country!="France" & country!="Germany" & country!="Ghana" ///
& country!="Greece" & country!="Guatemala" & country!="Haiti" & country!="Honduras" & country!="India" ///
& country!="Indonesia" & country!="Ireland" & country!="Israel" & country!="Italy" & country!="Jamaica" ///
& country!="Japan" & country!="Jordan" & country!="Kenya" & country!="Korea (Rep. of)" ///
& country!="Madagascar" & country!="Malawi" & country!="Malaysia" & country!="Mali" ///
& country!="Mauritania" & country!="Mauritius" & country!="Mexico" & country!="Morocco" ///
& country!="Mozambique" & country!="Nepal" & country!="Netherlands" & country!="New Zealand" ///
& country!="Nicaragua" & country!="Niger" & country!="Nigeria" & country!="Norway" ///
& country!="Pakistan" & country!="Panama" & country!="Papua New Guinea" & country!="Paraguay" ///
& country!="Peru" & country!="Philippines" & country!="Portugal" & country!="Rwanda" ///
& country!="Senegal" & country!="Sierra Leone" & country!="Singapore" & country!="Somalia" ///
& country!="South Africa" & country!="Spain" & country!="Sri Lanka" & country!="Sudan" & country!="Sweden" ///
& country!="Switzerland" & country!="Syria" & country!="Tanzania" & country!="Thailand" & country!="Togo" ///
& country!="Trinidad and Tobago" & country!="Tunisia" & country!="Turkey" & country!="Uganda" & country!="United Kingdom" ///
& country!="United States" & country!="Uruguay" & country!="Venezuela" & country!="Zambia" ///
& country!="Zimbabwe"

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MRW Sample 1976-2014_29.06.2016.dta", replace

*MRW I Sample Creation*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Full Country Sample 1976-2014_29.06.2016.dta"

drop if country!="Algeria" & country!="Argentina" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" ///
& country!="Bolivia" & country!="Brazil" & country!="Cameroon" & country!="Canada" & country!="Chile" ///
& country!="Colombia" & country!="Costa Rica" & country!="Côte d'Ivoire" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="El Salvador" ///
& country!="Ethiopia" & country!="Finland" & country!="France" & country!="Germany" ///
& country!="Greece" & country!="Guatemala" & country!="Haiti" & country!="Honduras" & country!="India" ///
& country!="Indonesia" & country!="Ireland" & country!="Israel" & country!="Italy" & country!="Jamaica" ///
& country!="Japan" & country!="Jordan" & country!="Kenya" & country!="Korea (Rep. of)" ///
& country!="Madagascar" & country!="Malawi" & country!="Malaysia" & country!="Mali" ///
& country!="Mexico" & country!="Morocco" & country!="Netherlands" & country!="New Zealand" ///
& country!="Nicaragua" & country!="Nigeria" & country!="Norway" ///
& country!="Pakistan" & country!="Panama" & country!="Paraguay" ///
& country!="Peru" & country!="Philippines" & country!="Portugal" ///
& country!="Senegal" & country!="Singapore" & country!="South Africa" & country!="Spain" & country!="Sri Lanka" & country!="Sweden" ///
& country!="Switzerland" & country!="Syria" & country!="Tanzania" & country!="Thailand" ///
& country!="Trinidad and Tobago" & country!="Tunisia" & country!="Turkey" & country!="United Kingdom" ///
& country!="United States" & country!="Uruguay" & country!="Venezuela" & country!="Zambia" ///
& country!="Zimbabwe"

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MRW Intermediate Sample 1976-2014_29.06.2016.dta", replace

*Export Summary Statistics to Excel*

 putexcel A1=("Variable") B1=("Obs") C1=("Mean") D1="Std. Dev." using results,
> sheet("tabulate oneway") replace
file results.xlsx saved
. putexcel A2=matrix(rows) B2=matrix(cell) using results,
> sheet("tabulate oneway") modify
file results.xlsx saved
. putexcel A4=("Total") B4=(r(N)) using results,
> sheet("tabulate oneway") modify
file results.xlsx saved

*Adding Predicted Trade Openness*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\instrument_variations_iso.dta", clear

rename iso countrycode
rename exwodshare predictedopen
keep country countrycode year predictedopen
drop if year<1976

tabulate country

replace country="Bahamas" if country=="Bahamas, The"
replace country="Brunei Darussalam" if country=="Brunei"
replace country="Cabo Verde" if country=="Cape Verde"
replace country="Congo (Dem. Rep. of the)" if country=="Congo, Democratic Republic of"
replace country="Congo" if country=="Congo, Republic of"
replace country="Côte d'Ivoire" if country=="Cote d'Ivoire"
replace country="Gambia" if country=="Gambia, The"
replace country="Korea (Rep. of)" if country=="Korea, South"
replace country="Kyrgyzstan" if country=="Kyrgyz Republic"
replace country="Russian Federation" if country=="Russia"
replace country="Slovakia" if country=="Slovak Republic"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="Viet Nam" if country=="Vietnam, Republic of"

gen period = floor((year - 1976) / 5)
collapse predictedopen, by(period country)

sort country period

save "C:\Users\Alex\Desktop\Trade - Human Development Section\Mean 5 Year Intervalls Predicted Trade Openness 1976-2008.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI.dta"

drop if year>2010

rename year period
replace period=0 if period==1980
replace period=1 if period==1985
replace period=2 if period==1990
replace period=3 if period==1995
replace period=4 if period==2000
replace period=5 if period==2005
replace period=6 if period==2010

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI 5 year periods 1980-2010.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Open, ln Population, Large Disasters, and lagged Large Disasters 1976-2014.dta"

drop if year>2008

gen period = floor((year - 1976) / 5)
collapse open lnpop largedisaster laglargedisaster, by(period country)

sort country period

label variable period "5 year intervalls 1976-2014"
label variable open "(mean) open 5 year intervalls 1976-2014"
label variable lnpop "(mean) lnpop 5 year intervalls 1976-2014"
label variable largedisaster "(mean) largedisaster 5 year intervalls 1976-2014"
label variable laglargedisaster "(mean) laglargedisaster 5 year intervalls 1976-2014"

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls (mean) Open, ln Population, Large Disasters, and lagged Large Disasters 1976-2010.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls (mean) Open, ln Population, Large Disasters, and lagged Large Disasters 1976-2010.dta", clear
merge 1:m country period using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI 5 year periods 1980-2010.dta"
drop _merge

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls (mean) Open, ln Population, Large Disasters, and lagged Large Disasters and HDI 1976-2010.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP per capita 1976-2009.dta", clear

drop if year>2008

gen period = floor((year - 1976) / 5)
collapse gdppc, by(period country)

sort country period

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls GDP per capita 1976-2009.dta", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\Mean 5 Year Intervalls Predicted Trade Openness 1976-2008.dta", clear
merge m:1 country period using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls (mean) Open, ln Population, Large Disasters, and lagged Large Disasters and HDI 1976-2010.dta"
drop _merge
merge 1:m country period using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\5 year intervalls GDP per capita 1976-2009.dta"

sort country period
order country period hdi gdppc open lnpop largedisaster laglargedisaster

drop if country=="Andorra"
drop if country=="Antigua and Barbuda"
drop if country=="Bhutan"
drop if country=="Botswana"
drop if country=="Dominica"
drop if country=="Eritrea"
drop if country=="Grenada"
drop if country=="Hong Kong"
drop if country=="Kiribati"
drop if country=="Lesotho"
drop if country=="Liechtenstein"
drop if country=="Micronesia"
drop if country=="Montenegro"
drop if country=="Namibia"
drop if country=="Palau"
drop if country=="Palestine"
drop if country=="Saint Kitts and Nevis"
drop if country=="Serbia"
drop if country=="Seychelles"
drop if country=="South Sudan"
drop if country=="Swaziland"
drop if country=="Timor-Leste"
drop if country=="Tonga"
drop if country=="Somalia"
drop if country=="Ethiopia"
drop if country=="Myanmar"
drop if country=="Sao Tome and Principe"
drop if country=="Turkmenistan"
drop if country=="Afghanistan"
drop if country=="Suriname"

drop if _merge==2
drop _merge

replace predictedopen=0 if predictedopen==.
g lagpredictedopen = predictedopen[_n-1]
replace lagpredictedopen=. if period==0
replace lagpredictedopen=. if lagpredictedopen==0
replace predictedopen=. if predictedopen==0

rename open OPEN
g open = OPEN*100
drop OPEN

g lngdppc = ln(gdppc)
drop gdppc

order country period hdi lngdppc open lnpop predictedopen lagpredictedopen largedisaster laglargedisaster

g MRW=1
replace MRW=0 if country!="Algeria" & country!="Angola" & country!="Argentina" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" & country!="Benin" ///
& country!="Benin" & country!="Bolivia" & country!="Brazil" & country!="Burkina Faso" ///
& country!="Burundi" & country!="Cameroon" & country!="Canada" & country!="Central African Republic" ///
& country!="Chad" & country!="Chile" & country!="Colombia" & country!="Congo (Dem. Rep. of the)" ///
& country!="Congo" & country!="Costa Rica" & country!="Côte d'Ivoire" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="Egypt" & country!="El Salvador" ///
& country!="Ethiopia" & country!="Finland" & country!="France" & country!="Germany" & country!="Ghana" ///
& country!="Greece" & country!="Guatemala" & country!="Haiti" & country!="Honduras" & country!="India" ///
& country!="Indonesia" & country!="Ireland" & country!="Israel" & country!="Italy" & country!="Jamaica" ///
& country!="Japan" & country!="Jordan" & country!="Kenya" & country!="Korea (Rep. of)" ///
& country!="Madagascar" & country!="Malawi" & country!="Malaysia" & country!="Mali" ///
& country!="Mauritania" & country!="Mauritius" & country!="Mexico" & country!="Morocco" ///
& country!="Mozambique" & country!="Nepal" & country!="Netherlands" & country!="New Zealand" ///
& country!="Nicaragua" & country!="Niger" & country!="Nigeria" & country!="Norway" ///
& country!="Pakistan" & country!="Panama" & country!="Papua New Guinea" & country!="Paraguay" ///
& country!="Peru" & country!="Philippines" & country!="Portugal" & country!="Rwanda" ///
& country!="Senegal" & country!="Sierra Leone" & country!="Singapore" & country!="Somalia" ///
& country!="South Africa" & country!="Spain" & country!="Sri Lanka" & country!="Sudan" & country!="Sweden" ///
& country!="Switzerland" & country!="Syria" & country!="Tanzania" & country!="Thailand" & country!="Togo" ///
& country!="Trinidad and Tobago" & country!="Tunisia" & country!="Turkey" & country!="Uganda" & country!="United Kingdom" ///
& country!="United States" & country!="Uruguay" & country!="Venezuela" & country!="Zambia" ///
& country!="Zimbabwe"

g MRWI=1
replace MRWI=0 if country!="Algeria" & country!="Argentina" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" ///
& country!="Bolivia" & country!="Brazil" & country!="Cameroon" & country!="Canada" & country!="Chile" ///
& country!="Colombia" & country!="Costa Rica" & country!="Côte d'Ivoire" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="El Salvador" ///
& country!="Ethiopia" & country!="Finland" & country!="France" & country!="Germany" ///
& country!="Greece" & country!="Guatemala" & country!="Haiti" & country!="Honduras" & country!="India" ///
& country!="Indonesia" & country!="Ireland" & country!="Israel" & country!="Italy" & country!="Jamaica" ///
& country!="Japan" & country!="Jordan" & country!="Kenya" & country!="Korea (Rep. of)" ///
& country!="Madagascar" & country!="Malawi" & country!="Malaysia" & country!="Mali" ///
& country!="Mexico" & country!="Morocco" & country!="Netherlands" & country!="New Zealand" ///
& country!="Nicaragua" & country!="Nigeria" & country!="Norway" ///
& country!="Pakistan" & country!="Panama" & country!="Paraguay" ///
& country!="Peru" & country!="Philippines" & country!="Portugal" ///
& country!="Senegal" & country!="Singapore" & country!="South Africa" & country!="Spain" & country!="Sri Lanka" & country!="Sweden" ///
& country!="Switzerland" & country!="Syria" & country!="Tanzania" & country!="Thailand" ///
& country!="Trinidad and Tobago" & country!="Tunisia" & country!="Turkey" & country!="United Kingdom" ///
& country!="United States" & country!="Uruguay" & country!="Venezuela" & country!="Zambia" ///
& country!="Zimbabwe"

g Full=1

save "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MRW, MRW I and Full Country Sample with Predicted Openness and GDP per capita 1976-2010_02.07.2016.dta", replace
