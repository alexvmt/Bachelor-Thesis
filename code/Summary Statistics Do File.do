*Summary Statistics of Data Set 1960-2008*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta", clear

keep country period meanyrsschool

save "C:\Users\Alex\Desktop\MERGE FILE meanyrsschool.dta", replace


clear 
use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) life.dta", clear

keep country period life

save "C:\Users\Alex\Desktop\MERGE FILE life.dta", replace


clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta", clear

merge m:m country period using "C:\Users\Alex\Desktop\MERGE FILE meanyrsschool.dta"
drop _merge
merge m:m country period using "C:\Users\Alex\Desktop\MERGE FILE life.dta"
drop _merge

drop lngdppc1 lngdppc2 lngdppc3 high openpwt oecd upmid lowmid low eastasiapacific latinamericacarribean europecentralasia southasia northamerica middleeastnorthafrica subsaharanafrica

order country period lngdppc life meanyrsschool

sutex2 if MRW==1
sutex2 if MRWI==1
sutex2 if Full==1

save "C:\Users\Alex\Desktop\Summary Data Set 1960-2008.dta", replace

*Summary Statistics Data Set 1976-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta", clear

drop lngdppc1 lngdppc2 lnhdi high openpwt upmid lowmid low eastasiapacific ///
latinamericacarribean europecentralasia southasia northamerica ///
middleeastnorthafrica subsaharanafrica redshare popshare predict wodshare exallshare exallshare allshare wodfive exallfive allfive veryhighhd highhd medhd lowhd

rename exwodfive altiv
g lagaltiv = altiv[_n-1]
replace lagaltiv=. if period==0

order country period hdi lngdppc lngnipc life school meanyrsschool expctdyrsschool opendots predictedopen lagpredictedopen altiv lagaltiv

sutex2 if MRW==1
sutex2 if MRWI==1
sutex2 if Full==1

save "C:\Users\Alex\Desktop\Summary Data Set 1976-2010.dta", replace
