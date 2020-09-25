*HDI 1980-2014 5 year intervalls*

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\HDI 1980-2014 5 year intervalls_trimmed.xlsx", sheet("Tabelle1") clear

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

drop if year>2010

replace country="Bolivia" if country=="Bolivia (Plurinational State of)"
replace country="Congo (Dem. Rep. of the)" if country=="Congo (Democratic Republic of the)"
replace country="Côte d'Ivoire" if country=="Ce d'Ivoire"
replace country="Iran" if country=="Iran (Islamic Republic of)"
replace country="Korea (Rep. of)" if country=="Korea (Republic of)"
replace country="Laos" if country=="Lao People's Democratic Republic"
replace country="Macedonia" if country=="The former Yugoslav Republic of Macedonia"
replace country="Moldova" if country=="Moldova (Republic of)"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="Tanzania" if country=="Tanzania (United Republic of)"
replace country="Venezuela" if country=="Venezuela (Bolivarian Republic of)"

g lnhdi = ln(100*hdi)

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI and ln HDI 1980-2010.dta", replace

*Predicted Trade Openness*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instrument_variations_iso.dta", clear

rename iso countrycode
rename exwodshare predictedopen
keep country countrycode year predictedopen
drop if year<1960

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\Predicted Open 1960-2008.dta", replace

*Imports*

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Imports.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc imports

drop if year>2008

order country countrycode year imports

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Imports 1960-2008.dta", replace

*Exports*

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Exports.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc exports

drop if year>2008

order country countrycode year exports

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Exports 1960-2008.dta", replace

*GDP*

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GDP.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc gdp

drop if year>2008

order country countrycode year gdp

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP 1960-2008.dta", replace

*GDP per capita PPP*

import delimited "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GDP per capita PPP.csv"

rename isocode countrycode
rename rgdpch gdppc
rename openk open

keep country countrycode year gdppc open
drop if year<1960
drop if year>2008

order country countrycode year gdppc open

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

g lngdppc = ln(gdppc)
drop gdppc

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP per capita 1960-2008.dta", replace

*Generating Open*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP 1960-2008.dta", clear

merge 1:1 country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Imports 1960-2008.dta"
drop _merge
merge 1:1 country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Exports 1960-2008.dta"
drop _merge

g calculatedopen = (imports+exports)/gdp*100

drop gdp imports exports

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Calculated Open 1960-2008.dta", replace

*Population*

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Population.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc pop

drop if year>2008

order country countrycode year pop

g lnpop = ln(pop)
drop pop

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\ln Population 1960-2008.dta", replace

*Disasters*

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Disasters.xlsx", sheet("Disasters") firstrow

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters.dta", replace

*Applying the Decision Rule of Felbermayr & Gröschl (2012)*

	*Disaster Types*
	
use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All disasters.dta", clear

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

drop if year>2008

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1960-2008.dta", replace

	*Large Disasters*
	*Deaths*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1960-2008.dta", replace

drop homeless totaldamage affected injured totalaffected
drop if deaths<1000 

drop if deaths==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths).dta", replace

	*Injured*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1960-2008.dta", replace

drop homeless totaldamage deaths affected totalaffected
drop if injured<1000 

drop if injured==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured).dta", replace

	*Total Affected*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1960-2008.dta", replace

drop homeless totaldamage deaths affected injured
drop if totalaffected<100000 

drop if totalaffected==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected).dta", replace

	*Merging Large Disaster in Terms of Deaths, Injured and Total Affected*
	
use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths).dta"
merge m:m country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured).dta"
drop _merge
merge m:m country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected).dta"
drop _merge

sort country countrycode year

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected).dta", replace

	*Merging Disasters and Large Disasters*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2012) Decision Rule 1960-2008.dta"

drop deaths affected injured totalaffected homeless totaldamage

collapse (sum) disaster, by(country countrycode year)

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters MERGE FILE.dta", replace

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected).dta"

drop deaths injured totalaffected

collapse (sum) largedisaster, by(country countrycode year)

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters MERGE FILE.dta", replace

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters MERGE FILE.dta"
merge m:m country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters MERGE FILE.dta"
drop _merge

replace largedisaster=0 if largedisaster==.

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1960-2008.dta", replace

*Merging Calculated Open and ln Population*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Calculated Open 1960-2008.dta", clear
merge 1:1 country countrycode year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\ln Population 1960-2008.dta"
drop _merge

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Calculated Open and ln Population 1960-2008.dta", replace

*Preparation of Merging Calculated Open and ln Population and GDP per capita and Open*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Calculated Open and ln Population 1960-2008.dta"

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Calculated Open and ln Population 1960-2008.dta", replace

*Preparation of Merging Calculated Open and ln Population and Disasters and Large Disasters*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1960-2008.dta", clear

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1960-2008.dta", replace

*Merging Predicted Open with GDP per capita and Open, and Calculated Open and ln Population*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\Predicted Open 1960-2008.dta", clear
merge m:1 country year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Calculated Open and ln Population 1960-2008.dta"
sort country countrycode year
drop _merge
merge m:m country year using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\GDP per capita 1960-2008.dta"
sort country countrycode year
drop _merge

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Open, Predicted Open, Calculated Open ln GDP per capita and ln Population 1960-2008.dta", replace

*Merging Predicted Open and GDP per capita and Open, and Calculated Open and ln Population with Disasters and Large Disasters*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Open, Predicted Open, Calculated Open ln GDP per capita and ln Population 1960-2008.dta", clear
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Disasters and Large Disasters 1960-2008.dta"
sort country countrycode year
drop _merge

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\RAW Full Country Sample 1960-2008.dta", replace

*Further Data Preparation*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\RAW Full Country Sample 1960-2008.dta", clear

drop disaster
replace largedisaster=0 if largedisaster==.
g laglargedisaster = largedisaster[_n-1]
replace laglargedisaster=. if year==1960

g lagpredictedopen = predictedopen[_n-1]
replace lagpredictedopen=. if year==1960

order country countrycode year lngdppc open lnpop largedisaster laglargedisaster predictedopen lagpredictedopen calculatedopen

gen period = floor((year - 1960) / 5)
collapse lngdppc open lnpop largedisaster laglargedisaster predictedopen lagpredictedopen calculatedopen, by(period country)
sort country period

label variable period "5 year intervalls 1960-2008"
label variable lngdppc "(mean) lngdppc 5 year intervalls 1960-2008"
label variable open "(mean) open 5 year intervalls 1960-2008"
label variable lnpop "(mean) lnpop 5 year intervalls 1960-2008"
label variable largedisaster "(mean) largedisaster 5 year intervalls 1960-2008"
label variable laglargedisaster "(mean) laglargedisaster 5 year intervalls 1960-2008"
label variable predictedopen "(mean) predictedopen 5 year intervalls 1960-2008"
label variable lagpredictedopen "(mean) lagpredictedopen 5 year intervalls 1960-2008"
label variable calculatedopen "(mean) calculatedopen 5 year intervalls 1960-2008"

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
replace Full=0 if country!="Algeria" & country!="Angola" & country!="Argentina" & country!="Australia" ///
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
& country!="Zimbabwe" ///
& country!="Albania" & country!="Armenia" & country!="Azerbaijan" & country!="Bahamas" & country!="Bahrain" ///
& country!="Barbados" & country!="Belarus" & country!="Belize" & country!="Bosnia and Herzegovina" ///
& country!="Brunei Darussalam" & country!="Bulgaria" & country!="Cambodia" & country!="Cabo Verde" ///
& country!="China" & country!="Comoros" & country!="Croatia" & country!="Cuba" ///
& country!="Cyprus" & country!="Czech Republic" & country!="Djibouti" & country!="Equatorial Guinea" ///
& country!="Estonia" & country!="Fiji" & country!="Gabon" & country!="Gambia" & country!="Georgia" ///
& country!="Guinea" & country!="Guinea-Bissau" & country!="Guyana" & country!="Hungary" ///
& country!="Iceland" & country!="Iran" & country!="Kazakhstan" & country!="Kuwait" & country!="Kyrgyzstan" ///
& country!="Laos" & country!="Latvia" & country!="Lebanon" & country!="Libya" & country!="Lithuania" ///
& country!="Luxembourg" & country!="Macedonia" & country!="Maldives" & country!="Malta" & country!="Moldova" ///
& country!="Mongolia" & country!="Oman" & country!="Poland" & country!="Qatar" & country!="Romania" ///
& country!="Russian Federation" & country!="Saint Lucia" & country!="Saint Vincent and the Grenadines" ///
& country!="Samoa" & country!="Sao Tome and Principe" & country!="Saudi Arabia" & country!="Slovakia" ///
& country!="Slovenia" & country!="Solomon Islands" & country!="Suriname" & country!="Tajikistan" ///
& country!="Ukraine" & country!="United Arab Emirates" & country!="Uzbekistan" ///
& country!="Vanuatu" & country!="Viet Nam" & country!="Yemen"

drop if MRW==0 & MRWI==0 & Full==0

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", replace

*Adding the HDI*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI and ln HDI 1980-2010.dta", clear

rename year period

replace period=0 if period==1980
replace period=1 if period==1985
replace period=2 if period==1990
replace period=3 if period==1995
replace period=4 if period==2000
replace period=5 if period==2005
replace period=6 if period==2010

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MERGE FILE HDI and ln HDI 1980-2010.dta", replace

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", clear

drop if period<3
replace period=0 if period==3
replace period=1 if period==4
replace period=2 if period==5
replace period=3 if period==6
replace period=4 if period==7
replace period=5 if period==8
replace period=6 if period==9

merge m:m country period using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MERGE FILE HDI and ln HDI 1980-2010.dta"
drop if _merge==1 | _merge==2
drop _merge

order country period hdi lnhdi

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MRW, MRWI and Full Country Sample HDI and ln HDI 1980-2010_02.07.2016.dta", replace
