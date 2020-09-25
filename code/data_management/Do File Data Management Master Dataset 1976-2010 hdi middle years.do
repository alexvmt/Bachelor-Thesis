*GDP per capita in PPP and Observed Trade Openness (PWT 7.1)*

clear

import delimited "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GDP per capita PPP.csv"

rename isocode countrycode
rename rgdpl gdppc1
rename rgdpl2 gdppc2
rename rgdpch gdppc3
rename openk openpwt

keep country countrycode year gdppc1 gdppc2 gdppc3 openpwt
drop if year<1976
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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngdppc and open (PWT 7.1) 1976-2008.dta", replace

*HDI and ln HDI* 

clear

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

tabulate country

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI and ln HDI 1980-2010 middle years.dta", replace

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instruments and open (DOTS) 1976-2008.dta", replace

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths).dta", replace

	*Injured*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1976-2008.dta", replace

drop homeless totaldamage deaths affected totalaffected
drop if injured<1000 

drop if injured==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured).dta", replace

	*Total Affected*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\All Disasters F&G (2013) Decision Rule 1976-2008.dta", replace

drop homeless totaldamage deaths affected injured
drop if totalaffected<100000 

drop if totalaffected==.
rename disaster largedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected).dta", replace

	*Merging Large Disaster in Terms of Deaths, Injured and Total Affected*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths).dta"
merge m:m country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Injured).dta"
drop _merge
merge m:m country countrycode year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (100000+ Total Affected).dta"
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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected).dta", replace

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\region dummies.dta", replace

*wto*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\wto.xlsx", sheet("Data") firstrow clear

destring, replace
keep country year wto

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\wto.dta", replace

*Income Levels and OECD*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\GNI per capita.xls", sheet("Data") firstrow clear

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc gnipc

drop if year<1976
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

replace oecd=0 if country=="Chile" & year<2010
replace oecd=0 if country=="Czech Republic" & year<1995
replace oecd=0 if country=="Estonia" & year<2010
replace oecd=0 if country=="Hungary" & year<1996
replace oecd=0 if country=="Israel" & year<2010
replace oecd=0 if country=="Korea (Rep. of)" & year<1996
replace oecd=0 if country=="Latvia" & year<2016
replace oecd=0 if country=="Mexico" & year<1994
replace oecd=0 if country=="Poland" & year<1996
replace oecd=0 if country=="Slovakia" & year<2000
replace oecd=0 if country=="Slovenia" & year<2010

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\rich and poor.dta", replace

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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\polity.dta", replace

*Life Expectancy at Birth*

clear

import excel "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\Life Expectancy at Birth.xls", sheet("Data") firstrow

rename CountryName country
rename CountryCode countrycode
drop IndicatorName
drop IndicatorCode

reshape long abc, i(country) j(year)

rename abc life

drop if year<1976
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

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\life.dta", replace

*Mean Years of Schooling*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Data Sources\Mean Years of Schooling.dta", clear

keep country year yr_sch

drop if year<1980

rename yr_sch meanyrsschool

tabulate country

replace country="Côte d'Ivoire" if country=="Cote dIvoire"
replace country="Congo (Dem. Rep. of the)" if country=="Democratic Republic of the Congo"
replace country="Dominican Republic" if country=="Dominican Rep."
replace country="Iran" if country=="Iran (Islamic Republic of)"
replace country="Laos" if country=="Lao People's Democratic Republic"
replace country="Libya" if country=="Libyan Arab Jamahiriya"
replace country="Korea (Rep. of)" if country=="Republic of Korea"
replace country="Moldova" if country=="Republic of Moldova"
replace country="Syria" if country=="Syrian Arab Republic"
replace country="United States" if country=="USA"
replace country="Tanzania" if country=="United Republic of Tanzania"

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\mean years of schooling middle years.dta", replace

*Expected Years of Schooling*

clear

import delimited "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Data Sources\HDX Expected Years of Schooling 1980-2013.csv"

drop v1
rename v2 country

rename v3 abc2014
rename v4 abc2013
rename v5 abc2012
rename v6 abc2011
rename v7 abc2010
rename v8 abc2009
rename v9 abc2008
rename v10 abc2007
rename v11 abc2006
rename v12 abc2005
rename v13 abc2004
rename v14 abc2003
rename v15 abc2002
rename v16 abc2001
rename v17 abc2000
rename v18 abc1999
rename v19 abc1998
rename v20 abc1997
rename v21 abc1996
rename v22 abc1995
rename v23 abc1994
rename v24 abc1993
rename v25 abc1992
rename v26 abc1991
rename v27 abc1990
rename v28 abc1989
rename v29 abc1988
rename v30 abc1987
rename v31 abc1986
rename v32 abc1985
rename v33 abc1984
rename v34 abc1983
rename v35 abc1982
rename v36 abc1981
rename v37 abc1980

reshape long abc, i(country) j(year)

rename abc expctdyrsschool
drop if year>2010

gen cntry=substr(country, 1, 1)+ lower(substr(country, 2, .))

drop country
rename cntry country

order country year expctdyrsschool

tabulate country

replace country="Antigua and Barbuda" if country=="Antigua and barbuda"
replace country="Bosnia and Herzegowina" if country=="Bosnia and herzegowina"
replace country="Brunei Darussalam" if country=="Brunei darussalam"
replace country="Burkina Faso" if country=="Burkina faso"
replace country="Cabo Verde" if country=="Cape verde"
replace country="Central African Republic" if country=="Central african republic"
replace country="Costa Rica" if country=="Costa rica"
replace country="Côte d'Ivoire" if country=="Cote d'ivoire"
replace country="Croatia" if country=="Croatia (local name: hrvatska)"
replace country="Czech Republic" if country=="Czech republic"
replace country="Dominican Republic" if country=="Dominican republic"
replace country="Timor Leste" if country=="East timor"
replace country="El Salvador" if country=="El salvador"
replace country="Equatorial Guinea" if country=="Equatorial guinea"
replace country="Guinea-Bissau" if country=="Guinea-bissau"
replace country="Iran" if country=="Iran (islamic republic of)"
replace country="Korea (Rep. of)" if country=="Korea, republic of"
replace country="Laos" if country=="LaosÂ "
replace country="Moldova" if country=="Moldova, republic of"
replace country="Myanmar" if country=="Myanmar (burma)Â "
replace country="New Zealand" if country=="New zealand"
replace country="Papua New Guinea" if country=="Papua new guinea"
replace country="Saint Kitts and Nevis" if country=="Saint kitts and nevis"
replace country="Saint Lucia" if country=="Saint lucia"
replace country="Saint Vincent and the Grenadines" if country=="Saint vincent and the grenadines"
replace country="Sao Tome and Principe" if country=="Sao tome and principe"
replace country="Saudi Arabia" if country=="Saudi arabia"
replace country="Sierra Leone" if country=="Sierra leone"
replace country="Slovakia" if country=="Slovakia (slovak republic)"
replace country="Solomon Islands" if country=="Solomon islands"
replace country="South Africa" if country=="South africa"
replace country="Sri Lanka" if country=="Sri lanka"
replace country="Syria" if country=="Syrian arab republic"
replace country="Tanzania" if country=="Tanzania, united republic of"
replace country="Trinidad and Tobago" if country=="Trinidad and tobago"
replace country="United Arab Emirates" if country=="United arab emirates"
replace country="United Kingdom" if country=="United kingdom"
replace country="United States" if country=="United states"
replace country="Viet Nam" if country=="Viet nam"

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\expctdyrsschool 1980-2010.dta", replace

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

g lngnipc = ln(gnipc)

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\gnipc 1980 and 1985 middle years.dta", replace

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

order country year gnipc lngnipc

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\gnipc 1990-2010 middle years.dta", replace

append using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\gnipc 1980 and 1985 middle years.dta"

sort country year

drop gnipc

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngnipc middle years.dta", replace

*Merging all Datasets*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngdppc and open (PWT 7.1) 1976-2008.dta", clear
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\instruments and open (DOTS) 1976-2008.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lnpop 1976-2008.dta"
drop _merge 
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Large Disasters (1000+ Deaths, 1000+ Injured, 100000+ Total Affected).dta"
drop _merge

merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\expctdyrsschool 1980-2010.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\life.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\wto.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\region dummies.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\rich and poor.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\polity.dta"
drop _merge

replace largedisaster=0 if largedisaster==.

rename exwodshare predictedopen

g laglargedisaster = largedisaster[_n-1]
replace laglargedisaster=. if year==1976

g lagpredictedopen = predictedopen[_n-1]
replace lagpredictedopen=. if year==1976

merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\mean years of schooling middle years.dta"
drop _merge
merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\lngnipc middle years.dta"
drop _merge

g school = (meanyrsschool + expctdyrsschool) / 2

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MERGE FILE middle years.dta", replace

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\HDI and ln HDI 1980-2010 middle years.dta", clear

merge m:m country year using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\MERGE FILE middle years.dta"
drop _merge

g veryhighhd = hdi 
replace veryhighhd=0 if hdi<0.8
replace veryhighhd=1 if hdi>=0.8 & hdi<1

g highhd = hdi 
replace highhd=0 if hdi<0.7 
replace highhd=0 if hdi>=0.8 & hdi<1
replace highhd=1 if hdi>=0.7 & hdi<=0.799

g medhd = hdi 
replace medhd=0 if hdi<0.55 
replace medhd=0 if hdi>=0.7 & hdi<1
replace medhd=1 if hdi>=0.55 & hdi<=0.699

g lowhd = hdi
replace lowhd=0 if hdi>0.499 & hdi<1
replace lowhd=1 if hdi<0.55

keep if year==1980 | year==1985 | year==1990 | year==1995 | year==2000 | year==2005 | year==2010
drop countrycode
sort country year

	*MRW Sample*

g MRW=1
replace MRW=0 if country!="Algeria" & country!="Angola" & country!="Argentina" & country!="Australia" ///
& country!="Austria" & country!="Bangladesh" & country!="Belgium" & country!="Benin" ///
& country!="Benin" & country!="Bolivia" & country!="Brazil" ///
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
& country!="Nicaragua" & country!="Niger" & country!="Norway" ///
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
& country!="Nicaragua" & country!="Norway" ///
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
& country!="Benin" & country!="Bolivia" & country!="Brazil" ///
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
& country!="Nicaragua" & country!="Niger" & country!="Norway" ///
& country!="Pakistan" & country!="Panama" & country!="Papua New Guinea" & country!="Paraguay" ///
& country!="Peru" & country!="Philippines" & country!="Portugal" & country!="Rwanda" ///
& country!="Senegal" & country!="Sierra Leone" & country!="Singapore" ///
& country!="South Africa" & country!="Spain" & country!="Sri Lanka" & country!="Sudan" & country!="Sweden" ///
& country!="Switzerland" & country!="Syria" & country!="Tanzania" & country!="Thailand" & country!="Togo" ///
& country!="Trinidad and Tobago" & country!="Tunisia" & country!="Turkey" & country!="Uganda" & country!="United Kingdom" ///
& country!="United States" & country!="Uruguay" & country!="Venezuela" & country!="Zambia" ///
& country!="Zimbabwe" ///
& country!="Albania" & country!="Armenia" & country!="Azerbaijan" & country!="Bahamas" & country!="Bahrain" ///
& country!="Barbados" & country!="Belarus" & country!="Belize" ///
& country!="Brunei Darussalam" & country!="Bulgaria" & country!="Cambodia" & country!="Cabo Verde" ///
& country!="China" & country!="Croatia" & country!="Cuba" ///
& country!="Cyprus" & country!="Czech Republic" & country!="Djibouti" & country!="Equatorial Guinea" ///
& country!="Estonia" & country!="Fiji" & country!="Gabon" & country!="Gambia" & country!="Georgia" ///
& country!="Guinea" & country!="Guyana" & country!="Hungary" ///
& country!="Iceland" & country!="Iran" & country!="Kazakhstan" & country!="Kuwait" & country!="Kyrgyzstan" ///
& country!="Laos" & country!="Latvia" & country!="Libya" & country!="Lithuania" ///
& country!="Luxembourg" & country!="Maldives" & country!="Malta" & country!="Moldova" ///
& country!="Mongolia" & country!="Poland" & country!="Qatar" & country!="Romania" ///
& country!="Russian Federation" & country!="Saint Lucia" & country!="Saint Vincent and the Grenadines" ///
& country!="Samoa" & country!="Sao Tome and Principe" & country!="Saudi Arabia" & country!="Slovakia" ///
& country!="Slovenia" & country!="Solomon Islands" & country!="Tajikistan" ///
& country!="Ukraine" & country!="United Arab Emirates" & country!="Uzbekistan" ///
& country!="Viet Nam" & country!="Yemen"

drop if MRW==0 & MRWI==0 & Full==0

order country year hdi lnhdi lngdppc1 lngdppc2 lngdppc3 lngnipc life meanyrsschool expctdyrsschool school opendots openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

save "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Stata Working Files\Master Dataset 29.07.2016 (1976-2010) hdi middle years.dta", replace
