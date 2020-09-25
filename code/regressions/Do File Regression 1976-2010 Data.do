*Country and Period FE Effects Regression 1976-2010 Data*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if MRW==1, fe
estimates store MRW

outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 1976-2010.xls", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if MRWI==1, fe
estimates store MRWI

outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW I FE 1976-2010.xls", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if Full==1, fe
estimates store Full

outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 1976-2010.xls", replace

*Country and Period Fixed Effects 2SLS Regression 1976-2010 Data (xtivreg2)*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRW==1, fe first small
estimates store MRW

outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 2SLS 1976-2010.xls", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRWI==1, fe first small
estimates store MRWI

outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW I FE 2SLS 1976-2010.xls", replace

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first small
estimates store Full

outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 2SLS 1976-2010.xls", replace

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

*FE vs. 2SLS MRW Sample (Std. Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRW==1, fe first small
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 2SLS 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 1976-2010.xls", replace

*FE vs. 2SLS MRW I Sample (Std. Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRWI==1, fe first small
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE 2SLS 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE 1976-2010.xls", replace

*FE vs. 2SLS Full Country Sample (Std. Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first small
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 2SLS 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 1976-2010.xls", replace

*FE vs. 2SLS MRW Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRW==1, fe first small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 2SLS Cluster 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE Cluster 1976-2010.xls", replace

*FE vs. 2SLS MRW I Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRWI==1, fe first small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE 2SLS Cluster 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE Cluster 1976-2010.xls", replace

*FE vs. 2SLS Full Country Sample (Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 2SLS Cluster 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE Cluster 1976-2010.xls", replace

*Partial R² MRW Sample*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

drop if MRW==0

pcorr2 open predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

*Partial R² MRW I Sample*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

drop if MRWI==0

pcorr2 open predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

*Partial R² Full Country Sample*

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

pcorr2 open predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

*Exporting First Stage Results in Excel*

clear 

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first savefirst small cluster(cntry)
estimates replay _xtivreg2_open
est restore _xtivreg2_open
outreg2 [_xtivreg2_open] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\First Stage Results Full Country Sample.xls", replace

*GDP per capita PPP: FE vs. 2SLS MRW Sample (with Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness and GDP per capita 1976-2010_02.07.2016.dta" 

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRW==1, fe first small cluster(cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE 2SLS Cluster GDP per capita 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg lngdppc open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRW
outreg2 [MRW] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW FE Cluster GDP per capita 1976-2010.xls", replace

*GDP per capita PPP: FE vs. 2SLS MRW I Sample (with Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if MRWI==1, fe first small cluster(cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE 2SLS Cluster 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store MRWI
outreg2 [MRWI] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRWI FE Cluster 1976-2010.xls", replace

*GDP per capita PPP: FE vs. 2SLS Full Country Sample (with Country Clustered Standard Errors)*

clear

use "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\MRW, MRW I and Full Country Sample with Predicted Openness 1976-2010_01.07.2016.dta", clear

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (open = predictedopen lagpredictedopen) if Full==1, fe first small cluster(cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE 2SLS Cluster 1976-2010.xls", replace

generate sample = e(sample)

xi: xtreg hdi open lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
estimates store Full
outreg2 [Full] using "C:\Users\Alex\Desktop\Trade - Human Development Section\HDI 1980-2014 5 year intervalls\Regression Samples\Full FE Cluster 1976-2010.xls", replace
