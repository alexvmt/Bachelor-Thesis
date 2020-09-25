*GDP per capita in PPP and Observed Trade Openness (PWT 7.1)*

clear

import delimited "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GDP per capita PPP.csv"

rename isocode countrycode
rename rgdpl gdppc1
rename rgdpl2 gdppc2
rename rgdpch gdppc3
rename openk openpwt

keep country countrycode year gdppc1 gdppc2 gdppc3 openpwt
drop if year<1960
drop if year>2008

order country countrycode year gdppc1 gdppc2 gdppc3 openpwt

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

g lngdppc1 = ln(gdppc1)
g lngdppc2 = ln(gdppc2)
g lngdppc3 = ln(gdppc3)

label variable lngdppc1 "PPP Converted GDP Per Capita (Laspeyres), derived from growth rates of c, g, i, "
label variable lngdppc2 "PPP Converted GDP Per Capita (Laspeyres), derived from growth rates of domestic "
label variable lngdppc3 "PPP Converted GDP Per Capita (Chain Series), at 2005 constant prices"
label variable openpwt "Openness at 2005 constant prices (%)"

drop gdppc1
drop gdppc2
drop gdppc3

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngdppc and open (PWT 7.1) 1960-2008.dta", replace

*Predicted Openness and Actual Trade Openness (DOTS)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instrument_variations_iso.dta", clear

drop cty
rename iso countrycode
rename open opendots
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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instruments and open (DOTS) 1960-2008.dta", replace

*ln Population*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Population.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc pop

drop if year<1960
drop if year>2008

order country countrycode year pop

g lnpop = ln(pop)
drop pop

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lnpop 1960-2008.dta", replace

*Large Disasters and Lagged Large Disasters*

clear

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

drop if year<1960
drop if year>2008

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters 1960-2008.dta", replace

*Applying the Decision Rule of Felbermayr and Gröschl (2013)*

	*Disaster Types*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All disasters 1960-2008.dta", clear

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1960-2008.dta", replace

	*Large Disasters*
	*Deaths*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1960-2008.dta", replace

drop homeless totaldamage affected injured totalaffected
drop if deaths<1000 

drop if deaths==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths) 1960-2008.dta", replace

	*Injured*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1960-2008.dta", replace

drop homeless totaldamage deaths affected totalaffected
drop if injured<1000 

drop if injured==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured) 1960-2008.dta", replace

	*Total Affected*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1960-2008.dta", replace

drop homeless totaldamage deaths affected injured
drop if totalaffected<100000 

drop if totalaffected==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected) 1960-2008.dta", replace

	*Merging Large Disaster in Terms of Deaths, Injured and Total Affected*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths) 1960-2008.dta"
merge m:m country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured) 1960-2008.dta"
drop _merge
merge m:m country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected) 1960-2008.dta"
drop _merge

sort country countrycode year

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

collapse (sum) largedisaster, by(country year)

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected) 1960-2008.dta", replace

*Income Levels and OECD*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GNI per capita.xls", sheet("Data") firstrow clear

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc gnipc

drop if year<1960
drop if year>2008

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

g low = gnipc
replace low=1 if gnipc<1026
replace low=0 if gnipc>1025 & gnipc<=186710

g lowmid = gnipc
replace lowmid=1 if gnipc>1025 & gnipc<4036
replace lowmid=0 if gnipc<1026 
replace lowmid=0 if gnipc>4035 & gnipc<=186710

g upmid = gnipc
replace upmid=1 if gnipc>4035 & gnipc<12476
replace upmid=0 if gnipc<4036
replace upmid=0 if gnipc>12475 & gnipc<=186710

g high = gnipc
replace high=1 if gnipc>12475 & gnipc<=186710
replace high=0 if gnipc<12476

g oecd = 1 if country=="Australia" | country=="Austria" | country=="Belgium" ///
| country=="Canada" | country=="Chile" | country=="Czech Republic" ///
| country=="Denmark" | country=="Estonia" | country=="Finland" ///
| country=="France" | country=="Germany" | country=="Greece" ///
| country=="Hungary" | country=="Iceland" | country=="Ireland" ///
| country=="Israel" | country=="Italy" | country=="Japan" ///
| country=="Korea (Rep. of)" | country=="Latvia" | country=="Luxembourg" ///
| country=="Mexico" | country=="Netherlands" | country=="New Zealand" ///
| country=="Norway" | country=="Poland" | country=="Portugal" ///
| country=="Slovakia" | country=="Slovenia" | country=="Spain" ///
| country=="Sweden" | country=="Switzerland" | country=="Turkey" ///
| country=="United Kingdom" | country=="United States"

replace oecd=0 if oecd==.

replace oecd=0 if country=="Australia" & year<1971
replace oecd=0 if country=="Austria" & year<1961
replace oecd=0 if country=="Belgium" & year<1961
replace oecd=0 if country=="Canada" & year<1961
replace oecd=0 if country=="Chile" & year<2010
replace oecd=0 if country=="Czech Republic" & year<1995
replace oecd=0 if country=="Denmark" & year<1961
replace oecd=0 if country=="Estonia" & year<2010
replace oecd=0 if country=="Finland" & year<1969
replace oecd=0 if country=="France" & year<1961
replace oecd=0 if country=="Germany" & year<1961
replace oecd=0 if country=="Greece" & year<1961
replace oecd=0 if country=="Hungary" & year<1996
replace oecd=0 if country=="Iceland" & year<1961
replace oecd=0 if country=="Ireland" & year<1961
replace oecd=0 if country=="Israel" & year<2010
replace oecd=0 if country=="Italy" & year<1962
replace oecd=0 if country=="Japan" & year<1964
replace oecd=0 if country=="Korea (Rep. of)" & year<1996
replace oecd=0 if country=="Latvia" & year<2016
replace oecd=0 if country=="Luxembourg" & year<1961
replace oecd=0 if country=="Mexico" & year<1994
replace oecd=0 if country=="Netherlands" & year<1961
replace oecd=0 if country=="New Zealand" & year<1973
replace oecd=0 if country=="Norway" & year<1961
replace oecd=0 if country=="Poland" & year<1996
replace oecd=0 if country=="Portugal" & year<1961
replace oecd=0 if country=="Slovakia" & year<2000
replace oecd=0 if country=="Slovenia" & year<2010
replace oecd=0 if country=="Spain" & year<1961
replace oecd=0 if country=="Sweden" & year<1961
replace oecd=0 if country=="Switzerland" & year<1961
replace oecd=0 if country=="Turkey" & year<1961
replace oecd=0 if country=="United Kingdom" & year<1961
replace oecd=0 if country=="United States" & year<1961

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\income levels and OECD 1960-2008.dta", replace

*Regions*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Regions 1980-2014.xlsx", sheet("Data") firstrow

tabulate country

replace country="Bolivia" if country=="Bolivia (Plurinational State of)"
replace country="Guinea-Bissau" if country=="Guinea Bissau"
replace country="Iran" if country=="Iran (Islamic Republic of)"
replace country="Korea (Rep. of)" if country=="Korea (Republic of)"
replace country="Laos" if country=="Lao People’s Democratic Republic"
replace country="Macedonia" if country=="Macedonia (The former Yugoslav Republic of)"
replace country="Moldova" if country=="Moldova (Republic of)"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="Tanzania" if country=="Tanzania (United Republic of)"
replace country="United States" if country=="United States of America"
replace country="Venezuela" if country=="Venezuela (Bolivarian Republic of)"

drop if year>2008

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\region dummies 1980-2008.dta", replace

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Regions 1960-1979.xlsx", sheet("Data") firstrow

tabulate country

replace country="Bolivia" if country=="Bolivia (Plurinational State of)"
replace country="Guinea-Bissau" if country=="Guinea Bissau"
replace country="Iran" if country=="Iran (Islamic Republic of)"
replace country="Korea (Rep. of)" if country=="Korea (Republic of)"
replace country="Laos" if country=="Lao People’s Democratic Republic"
replace country="Macedonia" if country=="Macedonia (The former Yugoslav Republic of)"
replace country="Moldova" if country=="Moldova (Republic of)"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="Tanzania" if country=="Tanzania (United Republic of)"
replace country="United States" if country=="United States of America"
replace country="Venezuela" if country=="Venezuela (Bolivarian Republic of)"

drop if year>1979

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\region dummies 1960-1979.dta", replace

append using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\region dummies 1980-2008.dta"

sort country year

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\region dummies 1960-2008.dta", replace

*Merging all Datasets*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngdppc and open (PWT 7.1) 1960-2008.dta", clear
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instruments and open (DOTS) 1960-2008.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lnpop 1960-2008.dta"
drop _merge 
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected) 1960-2008.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\income levels and OECD 1960-2008.dta"
drop _merge 
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\region dummies 1960-2008.dta"
drop _merge

replace largedisaster=0 if largedisaster==.

rename exwodshare predictedopen

g period = floor((year - 1960) / 5)
collapse openpwt lngdppc1 lngdppc2 lngdppc3 predictedopen opendots lnpop largedisaster low lowmid upmid high oecd eastasiapacific europecentralasia latinamericacarribean middleeastnorthafrica northamerica southasia subsaharanafrica, by(country period)

sort country period

g laglargedisaster = largedisaster[_n-1]
replace laglargedisaster=. if period==0

g lagpredictedopen = predictedopen[_n-1]
replace lagpredictedopen=. if period==0

g lngdppc=lngdppc3

replace eastasiapacific=0 if country=="Somalia"
replace europecentralasia=0 if country=="Somalia"
replace latinamericacarribean=0 if country=="Somalia"
replace middleeastnorthafrica=1 if country=="Somalia"
replace northamerica=0 if country=="Somalia"
replace southasia=0 if country=="Somalia"
replace subsaharanafrica=0 if country=="Somalia"

	*MRW Sample*

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
& country!="Senegal" & country!="Sierra Leone" & country!="Singapore" ///
& country!="South Africa" & country!="Spain" & country!="Sri Lanka" & country!="Sudan" & country!="Sweden" ///
& country!="Switzerland" & country!="Syria" & country!="Tanzania" & country!="Thailand" & country!="Togo" ///
& country!="Trinidad and Tobago" & country!="Tunisia" & country!="Turkey" & country!="Uganda" & country!="United Kingdom" ///
& country!="United States" & country!="Uruguay" & country!="Venezuela" & country!="Zambia" ///
& country!="Zimbabwe" & country!="Somalia"

	*MRW Intermediate Sample*

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

	*Full Country Sample*

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
& country!="Senegal" & country!="Sierra Leone" & country!="Singapore" ///
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
& country!="Vanuatu" & country!="Viet Nam" & country!="Yemen" & country!="Somalia" ///
& country!="Turkmenistan"

drop if MRW==0 & MRWI==0 & Full==0

order country period lngdppc lngdppc1 lngdppc2 lngdppc3 openpwt opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster low lowmid upmid high oecd eastasiapacific europecentralasia latinamericacarribean middleeastnorthafrica northamerica southasia subsaharanafrica

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Master Dataset 26.07.2016 (1960-2008) lngdppc.dta", replace
