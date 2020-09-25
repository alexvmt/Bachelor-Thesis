*Observed Trade Openness (PWT 7.1)*

clear

import delimited "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GDP per capita PPP.csv"

rename isocode countrycode
rename rgdpch gdppc
rename openk openpwt

keep country countrycode year openpwt gdppc
drop if year<1976
drop if year>2008

order country countrycode year openpwt

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngdppc and openpwt 1976-2008.dta", replace

*Predicted Openness and Actual Trade Openness (DOTS)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instrument_variations_iso.dta", clear

drop cty
rename iso countrycode
rename open opendots
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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instruments and opendots 1976-2008.dta", replace

*ln Population*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Population.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc pop

drop if year<1976
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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lnpop 1976-2008.dta", replace

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

drop if year<1976
drop if year>2008

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters 1976-2008.dta", replace

*Applying the Decision Rule of Felbermayr and Gröschl (2013)*

	*Disaster Types*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All disasters 1976-2008.dta", clear

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1976-2008.dta", replace

	*Large Disasters*
	*Deaths*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1976-2008.dta", replace

drop homeless totaldamage affected injured totalaffected
drop if deaths<1000 

drop if deaths==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths) 1976-2008.dta", replace

	*Injured*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1976-2008.dta", replace

drop homeless totaldamage deaths affected totalaffected
drop if injured<1000 

drop if injured==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured) 1976-2008.dta", replace

	*Total Affected*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1976-2008.dta", replace

drop homeless totaldamage deaths affected injured
drop if totalaffected<100000 

drop if totalaffected==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected) 1976-2008.dta", replace

	*Merging Large Disaster in Terms of Deaths, Injured and Total Affected*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths) 1976-2008.dta"
merge m:m country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured) 1976-2008.dta"
drop _merge
merge m:m country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected) 1976-2008.dta"
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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected) 1976-2008.dta", replace

*GNI per capita PPP 1980 and 1985*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GNI per capita (constant 2011 PPP$) 1980 and 1985.xls", sheet("141706") firstrow clear

drop in 1/4
drop HDIRank D F H J L N P R T V X Z AB
rename Country country

destring, replace ignore(.",")

reshape long abc, i(country) j(year)

drop if year>1985

rename abc gnipc
rename year period 
replace period=0 if period==1980
replace period=1 if period==1985

g lngnipc = ln(gnipc)

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\gnipc 1980 and 1985.dta", replace

*GNI per capita PPP 1990-2008*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GNI per capita (constant 2011 PPP) 1990-2015.xls",sheet("Data") firstrow clear

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc gnipc

drop if year<1990
drop if year>2010

order country countrycode year gnipc

g lngnipc = ln(gnipc)

g period = floor((year - 1990) / 5)
collapse gnipc lngnipc, by(country period)
sort country period

g Period = period+2
drop period
rename Period period

order country period gnipc 

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\gnipc 1990-2010.dta", replace

append using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\gnipc 1980 and 1985.dta"

sort country period

drop gnipc

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngnipc 1980-2010.dta", replace

*Polity Index (Gurr et al., 2003)*

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\polity.xls", sheet("p4v2015") firstrow clear

keep country year polity2

drop if year<1976
drop if year>2008

g polity = .
replace polity=1 if polity2==10
replace polity=2 if polity2==9
replace polity=3 if polity2==8
replace polity=4 if polity2==7
replace polity=5 if polity2==6
replace polity=6 if polity2==5
replace polity=7 if polity2==4
replace polity=8 if polity2==3
replace polity=9 if polity2==2
replace polity=10 if polity2==1
replace polity=11 if polity2==0
replace polity=12 if polity2==-1
replace polity=13 if polity2==-2
replace polity=14 if polity2==-3
replace polity=15 if polity2==-4
replace polity=16 if polity2==-5
replace polity=17 if polity2==-6
replace polity=18 if polity2==-7
replace polity=19 if polity2==-8
replace polity=20 if polity2==-9
replace polity=21 if polity2==-10

g period = floor((year - 1976) / 5)
collapse polity, by(country period)

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\polity.dta", replace

*Merging all Datasets*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngdppc and openpwt 1976-2008.dta", clear
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instruments and open (DOTS) 1976-2008.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lnpop 1976-2008.dta"
drop _merge 
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected) 1976-2008.dta"
drop _merge

replace largedisaster=0 if largedisaster==.

rename exwodshare predictedopen

g period = floor((year - 1976) / 5)
collapse lngdppc openpwt predictedopen opendots lnpop largedisaster, by(country period)

merge m:m country period using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngnipc 1980-2010.dta"
drop _merge 
merge m:m country period using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\polity.dta"

sort country period

g laglargedisaster = largedisaster[_n-1]
replace laglargedisaster=. if period==0

g lagpredictedopen = predictedopen[_n-1]
replace lagpredictedopen=. if period==0

	*MRW Sample*

g MRW=1
replace MRW=0 if country!="Algeria" & country!="Angola" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" & country!="Benin" ///
& country!="Benin" & country!="Bolivia" & country!="Brazil" & country!="Burkina Faso" ///
& country!="Burundi" & country!="Cameroon" & country!="Canada" & country!="Central African Republic" ///
& country!="Chad" & country!="Chile" & country!="Colombia" & country!="Congo (Dem. Rep. of the)" ///
& country!="Costa Rica" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="El Salvador" ///
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
& country!="Zimbabwe"

	*MRW Intermediate Sample*

g MRWI=1
replace MRWI=0 if country!="Algeria" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" ///
& country!="Bolivia" & country!="Brazil" & country!="Cameroon" & country!="Canada" & country!="Chile" ///
& country!="Colombia" & country!="Costa Rica" & country!="Denmark" ///
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
replace Full=0 if country!="Algeria" & country!="Angola" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" & country!="Benin" ///
& country!="Benin" & country!="Bolivia" & country!="Brazil" & country!="Burkina Faso" ///
& country!="Burundi" & country!="Cameroon" & country!="Canada" & country!="Central African Republic" ///
& country!="Chad" & country!="Chile" & country!="Colombia" & country!="Congo (Dem. Rep. of the)" ///
& country!="Costa Rica" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="El Salvador" ///
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
& country!="Albania" & country!="Armenia" & country!="Azerbaijan" & country!="Bahrain" ///
& country!="Barbados" & country!="Belarus" & country!="Belize" & country!="Bosnia and Herzegovina" ///
& country!="Brunei Darussalam" & country!="Bulgaria" & country!="Cambodia" & country!="Cabo Verde" ///
& country!="China" & country!="Comoros" & country!="Croatia" & country!="Cuba" ///
& country!="Cyprus" & country!="Czech Republic" & country!="Djibouti" & country!="Equatorial Guinea" ///
& country!="Estonia" & country!="Fiji" & country!="Gabon" & country!="Georgia" ///
& country!="Guinea" & country!="Guinea-Bissau" & country!="Guyana" & country!="Hungary" ///
& country!="Iceland" & country!="Iran" & country!="Kazakhstan" & country!="Kuwait" & country!="Kyrgyzstan" ///
& country!="Laos" & country!="Latvia" & country!="Lebanon" & country!="Libya" & country!="Lithuania" ///
& country!="Luxembourg" & country!="Macedonia" & country!="Maldives" & country!="Malta" & country!="Moldova" ///
& country!="Mongolia" & country!="Oman" & country!="Poland" & country!="Qatar" & country!="Romania" ///
& country!="Russian Federation" ///
& country!="Samoa" & country!="Sao Tome and Principe" & country!="Saudi Arabia" & country!="Slovakia" ///
& country!="Slovenia" & country!="Solomon Islands" & country!="Suriname" & country!="Tajikistan" ///
& country!="Ukraine" & country!="United Arab Emirates" & country!="Uzbekistan" ///
& country!="Vanuatu" & country!="Yemen"

drop if MRW==0 & MRWI==0 & Full==0

order country period lngnipc lngdppc opendots openpwt predictedopen lagpredictedopen lnpop polity largedisaster laglargedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Master Dataset 16.07.2016 (1976-2010) lngnipc.dta", replace

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngdppc and openpwt 1976-2008.dta", clear
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instruments and open (DOTS) 1976-2008.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lnpop 1976-2008.dta"
drop _merge 
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected) 1976-2008.dta"
drop _merge

replace largedisaster=0 if largedisaster==.

rename exwodshare predictedopen

g period = floor((year - 1976) / 5)
collapse lngdppc openpwt predictedopen opendots lnpop largedisaster, by(country period)

merge m:m country period using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngnipc 1980-2010.dta"
drop _merge 
merge m:m country period using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\polity.dta"

sort country period

g laglargedisaster = largedisaster[_n-1]
replace laglargedisaster=. if period==0

g lagpredictedopen = predictedopen[_n-1]
replace lagpredictedopen=. if period==0

	*MRW Sample*

g MRW=1
replace MRW=0 if country!="Algeria" & country!="Angola" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" & country!="Benin" ///
& country!="Benin" & country!="Bolivia" & country!="Brazil" & country!="Burkina Faso" ///
& country!="Burundi" & country!="Cameroon" & country!="Canada" & country!="Central African Republic" ///
& country!="Chad" & country!="Chile" & country!="Colombia" & country!="Congo (Dem. Rep. of the)" ///
& country!="Costa Rica" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="El Salvador" ///
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
& country!="Zimbabwe"

	*MRW Intermediate Sample*

g MRWI=1
replace MRWI=0 if country!="Algeria" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" ///
& country!="Bolivia" & country!="Brazil" & country!="Cameroon" & country!="Canada" & country!="Chile" ///
& country!="Colombia" & country!="Costa Rica" & country!="Denmark" ///
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
replace Full=0 if country!="Algeria" & country!="Angola" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" & country!="Benin" ///
& country!="Benin" & country!="Bolivia" & country!="Brazil" & country!="Burkina Faso" ///
& country!="Burundi" & country!="Cameroon" & country!="Canada" & country!="Central African Republic" ///
& country!="Chad" & country!="Chile" & country!="Colombia" & country!="Congo (Dem. Rep. of the)" ///
& country!="Costa Rica" & country!="Denmark" ///
& country!="Dominican Republic" & country!="Ecuador" & country!="El Salvador" ///
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
& country!="Albania" & country!="Armenia" & country!="Azerbaijan" & country!="Bahrain" ///
& country!="Barbados" & country!="Belarus" & country!="Belize" & country!="Bosnia and Herzegovina" ///
& country!="Brunei Darussalam" & country!="Bulgaria" & country!="Cambodia" & country!="Cabo Verde" ///
& country!="China" & country!="Comoros" & country!="Croatia" & country!="Cuba" ///
& country!="Cyprus" & country!="Czech Republic" & country!="Djibouti" & country!="Equatorial Guinea" ///
& country!="Estonia" & country!="Fiji" & country!="Gabon" & country!="Georgia" ///
& country!="Guinea" & country!="Guinea-Bissau" & country!="Guyana" & country!="Hungary" ///
& country!="Iceland" & country!="Iran" & country!="Kazakhstan" & country!="Kuwait" & country!="Kyrgyzstan" ///
& country!="Laos" & country!="Latvia" & country!="Lebanon" & country!="Libya" & country!="Lithuania" ///
& country!="Luxembourg" & country!="Macedonia" & country!="Maldives" & country!="Malta" & country!="Moldova" ///
& country!="Mongolia" & country!="Oman" & country!="Poland" & country!="Qatar" & country!="Romania" ///
& country!="Russian Federation" ///
& country!="Samoa" & country!="Sao Tome and Principe" & country!="Saudi Arabia" & country!="Slovakia" ///
& country!="Slovenia" & country!="Solomon Islands" & country!="Suriname" & country!="Tajikistan" ///
& country!="Ukraine" & country!="United Arab Emirates" & country!="Uzbekistan" ///
& country!="Vanuatu" & country!="Yemen"

drop if MRW==0 & MRWI==0 & Full==0

order country period lngnipc lngdppc opendots openpwt predictedopen lagpredictedopen lnpop polity largedisaster laglargedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Master Dataset 16.07.2016 (1976-2010) lngnipc.dta", replace
