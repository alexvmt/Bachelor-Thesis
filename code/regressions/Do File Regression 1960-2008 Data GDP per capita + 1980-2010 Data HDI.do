*2SLS*

findit xtivreg2
findit xtivreg
findit ivreg2

*ivreg*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

ivregress 2sls hdi lnpop largedisaster laglargedisaster (open = predictedopen)

estat endog
estat firststage
estat overid (?)

*ivreg2*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

ivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen), small first savefirst

*xtivreg*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xtivreg hdi lnpop largedisaster laglargedisaster (open = predictedopen), fe first small

display "R2 = " e(r2)
display "adjusted R2 = " e(r2_a)

*Partial R² MRW Sample*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", clear

drop if MRW==0

pcorr2 open predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

*Partial R² MRW I Sample*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", clear

drop if MRWI==0

pcorr2 open predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

*Partial R² Full Country Sample*

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", clear

pcorr2 open predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

*GDP per capita PPP: FE vs. 2SLS MRW Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 2SLS Cluster GDP per capita 1960-2008.xls", replace

generate sample = e(sample)

xi: xtreg lngdppc open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE Cluster GDP per capita 1960-2008.xls", replace

*GDP per capita PPP: FE vs. 2SLS MRW I Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE 2SLS Cluster GDP per capita 1960-2008.xls", replace

generate sample = e(sample)

xi: xtreg lngdppc open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE Cluster GDP per capita 1960-2008.xls", replace

*GDP per capita PPP: FE vs. 2SLS Full Country Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample GDP per capita 1960-2008_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 2SLS Cluster GDP per capita 1960-2008.xls", replace

generate sample = e(sample)

xi: xtreg lngdppc open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE Cluster GDP per capita 1960-2008.xls", replace

*HDI: FE vs. 2SLS MRW Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample HDI and ln HDI 1980-2010_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 2SLS Cluster HDI 1980-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE Cluster HDI 1980-2010.xls", replace

*HDI: FE vs. 2SLS MRW I Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample HDI and ln HDI 1980-2010_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE 2SLS Cluster HDI 1980-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE Cluster HDI 1980-2010.xls", replace

*HDI: FE vs. 2SLS Full Country Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample HDI and ln HDI 1980-2010_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 2SLS Cluster HDI 1980-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE Cluster HDI 1980-2010.xls", replace

*ln HDI: FE vs. 2SLS MRW Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample HDI and ln HDI 1980-2010_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lnhdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 2SLS Cluster ln HDI 1980-2010.xls", replace

generate sample = e(sample)

xi: xtreg lnhdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE Cluster ln HDI 1980-2010.xls", replace

*ln HDI: FE vs. 2SLS MRW I Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample HDI and ln HDI 1980-2010_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lnhdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE 2SLS Cluster ln HDI 1980-2010.xls", replace

generate sample = e(sample)

xi: xtreg lnhdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE Cluster ln HDI 1980-2010.xls", replace

*ln HDI: FE vs. 2SLS Full Country Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRWI and Full Country Sample HDI and ln HDI 1980-2010_02.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lnhdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 2SLS Cluster ln HDI 1980-2010.xls", replace

generate sample = e(sample)

xi: xtreg lnhdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Google Drive\Studium\Bachelor\Uni Tübingen\Semester 8\Bachelorarbeit\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE Cluster ln HDI 1980-2010.xls", replace
