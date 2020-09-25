*R², adjusted R² and partial R²*

display "R2 = " e(r2)
display "adjusted R2 = " e(r2_a)

pcorr2

*lngdppc: OLS vs. 2SLS MRW Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2008 (lngdppc).xls", replace

generate sample = e(sample)

xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2008 (lngdppc).xls", replace

*lngdppc: OLS vs. 2SLS MRW Intermediate Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI 2SLS 1976-2008 (lngdppc).xls", replace

generate sample = e(sample)

xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI OLS 1976-2008 (lngdppc).xls", replace

*lngdppc: OLS vs. 2SLS Full Country Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full 2SLS 1976-2008 (lngdppc).xls", replace

generate sample = e(sample)

xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full OLS 1976-2008 (lngdppc).xls", replace

*hdi: OLS vs. 2SLS MRW Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi).xls", replace

*hdi: OLS vs. 2SLS MRW Intermediate Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI 2SLS 1976-2010 (hdi).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI OLS 1976-2010 (hdi).xls", replace

*hdi: OLS vs. 2SLS Full Country Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full 2SLS 1976-2010 (hdi).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full OLS 1976-2010 (hdi).xls", replace

*life: OLS vs. 2SLS MRW Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 life lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (life).xls", replace

generate sample = e(sample)

xi: xtreg life opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (life).xls", replace

*life: OLS vs. 2SLS MRW Intermediate Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 life lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI 2SLS 1976-2010 (life).xls", replace

generate sample = e(sample)

xi: xtreg life opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI OLS 1976-2010 (life).xls", replace

*life: OLS vs. 2SLS Full Country Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 life lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full 2SLS 1976-2010 (life).xls", replace

generate sample = e(sample)

xi: xtreg life opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full OLS 1976-2010 (life).xls", replace

*avrgyrsschool: OLS vs. 2SLS MRW Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 avrgyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (avrgyrsschool).xls", replace

generate sample = e(sample)

xi: xtreg avrgyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (avrgyrsschool).xls", replace

*avrgyrsschool: OLS vs. 2SLS MRW Intermediate Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 avrgyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI 2SLS 1976-2010 (avrgyrsschool).xls", replace

generate sample = e(sample)

xi: xtreg avrgyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI OLS 1976-2010 (avrgyrsschool).xls", replace

*avrgyrsschool: OLS vs. 2SLS Full Country Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 avrgyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full 2SLS 1976-2010 (avrgyrsschool).xls", replace

generate sample = e(sample)

xi: xtreg avrgyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full OLS 1976-2010 (avrgyrsschool).xls", replace

*lngnipc: OLS vs. 2SLS MRW Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngnipc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (lngnipc).xls", replace

generate sample = e(sample)

xi: xtreg lngnipc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (lngnipc).xls", replace

*lngnipc: OLS vs. 2SLS MRW Intermediate Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngnipc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI 2SLS 1976-2010 (lngnipc).xls", replace

generate sample = e(sample)

xi: xtreg lngnipc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI OLS 1976-2010 (lngnipc).xls", replace

*lngnipc: OLS vs. 2SLS Full Country Sample*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngnipc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full 2SLS 1976-2010 (lngnipc).xls", replace

generate sample = e(sample)

xi: xtreg lngnipc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full OLS 1976-2010 (lngnipc).xls", replace


*Human Development Levels*

*Income Levels*


*lnhdi: OLS vs. 2SLS MRW Sample*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lnhdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (lnhdi).xls", replace

generate sample = e(sample)

xi: xtreg lnhdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (lnhdi).xls", replace

*lnhdi: OLS vs. 2SLS MRW Intermediate Sample*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lnhdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI 2SLS 1976-2010 (lnhdi).xls", replace

generate sample = e(sample)

xi: xtreg lnhdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI OLS 1976-2010 (lnhdi).xls", replace

*lnhdi: OLS vs. 2SLS Full Country Sample*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lnhdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full 2SLS 1976-2010 (lnhdi).xls", replace

generate sample = e(sample)

xi: xtreg lnhdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full OLS 1976-2010 (lnhdi).xls", replace

*hdi: OLS vs. 2SLS East Asia & Pacific*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if eastasiapacific==1, fe first savefirst small cluster(cntry)
estimates store EAP
outreg2 [EAP] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, EAP).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store EAP
outreg2 [EAP] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, EAP).xls", replace

*hdi: OLS vs. 2SLS Europe & Central Asia*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if europecentralasia==1, fe first savefirst small cluster(cntry)
estimates store ECA
outreg2 [ECA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, ECA).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store ECA
outreg2 [ECA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, ECA).xls", replace

*hdi: OLS vs. 2SLS Latin America and Carribean*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if latinamericacarribean==1, fe first savefirst small cluster(cntry)
estimates store LAC
outreg2 [LAC] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, LAC).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store LAC
outreg2 [LAC] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, LAC).xls", replace

*hdi: OLS vs. 2SLS Middle East and North Africa*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if middleeastnorthafrica==1, fe first savefirst small cluster(cntry)
estimates store MENA
outreg2 [MENA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, MENA).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MENA
outreg2 [MENA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, MENA).xls", replace

*hdi: OLS vs. 2SLS North America*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if northamerica==1, fe first savefirst small cluster(cntry)
estimates store NA
outreg2 [NA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, NA).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store NA
outreg2 [NA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, NA).xls", replace

*hdi: OLS vs. 2SLS South Asia*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if southasia==1, fe first savefirst small cluster(cntry)
estimates store SA
outreg2 [SA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, SA).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store SA
outreg2 [SA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, SA).xls", replace

*hdi: OLS vs. 2SLS Sub-Saharan Africa*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if subsaharanafrica==1, fe first savefirst small cluster(cntry)
estimates store SSA
outreg2 [SSA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, SSA).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store SSA
outreg2 [SSA] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, SSA).xls", replace

*hdi: OLS vs. 2SLS OECD*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if oecd==1, fe first savefirst small cluster(cntry)
estimates store OECD
outreg2 [OECD] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW 2SLS 1976-2010 (hdi, oecd).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store OECD
outreg2 [OECD] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW OLS 1976-2010 (hdi, oecd).xls", replace

*hdi: OLS vs. 2SLS non-OECD*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human DevelopmentSection\HDI 1980-2014 5 year intervalls\Regression Samples\Master Dataset_09.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if oecd==0, fe first savefirst small cluster(cntry)
estimates store nonOECD
outreg2 [nonOECD] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI 2SLS 1976-2010 (hdi, non-oecd).xls", replace

generate sample = e(sample)

xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store nonOECD
outreg2 [nonOECD] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI OLS 1976-2010 (hdi, non-oecd).xls", replace



*hdi: First Stage without Lag 1976-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using First_Stage_without_Lag_1976-2010_hdi.tex, replace compress se r2 ar2 label ///
  title(First stage (1976-2008; fixed-effects estimates; 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

drop if MRW!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

drop if MRWI!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

drop if Full!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

*hdi: Second Stage without Lag 1976-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 14.07.2016.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_without_Lag_1976-2010_hdi.tex, replace compress se r2 ar2 label ///
  title(Second stage (1976-2010; fixed-effects estimates; 5 year averages)) ///
  mtitles("MRW" "MRW" "MRW I" "MRW I" "Full" "Full") ///
  addnote(Note:.)
