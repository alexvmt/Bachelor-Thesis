*lngdppc: First Stage with lag opendots 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_lngdppc_opendots_lag.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)
  
  
	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
  
  
*lngdppc: Second Stage with lag opendots 1960-2008*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_with_Lag_1960-2008_lngdppc_lag.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2008; fixed-effects estimates, 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  
  
*lngdppc: First Stage with lag openpwt 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_lngdppc_openpwt_lag.tex, replace compress se r2 ar2 ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  
  	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
  
  
*lngdppc: Second Stage with lag openpwt 1960-2008*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly 
xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_with_Lag_1960-2008_lngdppc_openpwt_lag.tex, replace compress se r2 ar2 ///
  title(Second stage (1960-2008; fixed-effects estimates; 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  
  
*lngdppc: First Stage without lag opendots 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_lngdppc_opendots.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)
  
  
	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
  
  
*lngdppc: Second Stage without lag opendots 1960-2008*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1960-2008_lngdppc.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2008; fixed-effects estimates, 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  
  
*lngdppc: First Stage without lag openpwt 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_lngdppc_openpwt.tex, replace compress se r2 ar2 ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  
  	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
  
  
*lngdppc: Second Stage without lag openpwt 1960-2008*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly 
xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_with_Lag_1960-2008_lngdppc_openpwt.tex, replace compress se r2 ar2 ///
  title(Second stage (1960-2008; fixed-effects estimates; 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  

*Regions 2SLS and OLS*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if eastasiapacific==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if europecentralasia==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if latinamericacarribean==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if middleeastnorthafrica==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if northamerica==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if southasia==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg lngdppc opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if subsaharanafrica==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1960-2008_lngdppc_opendots_regions.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2008; fixed-effects estimates, 5 year averages)) ///
  mtitles("EAP" "ECA" "LAC" "MENA" "NA" "SA" "SSA") ///
  addnote(Note:.)

  *Regions 2SLS*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if eastasiapacific==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if europecentralasia==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if latinamericacarribean==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if middleeastnorthafrica==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if northamerica==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if southasia==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if subsaharanafrica==1, fe first savefirst small cluster(cntry)

esttab using Second_Stage_1960-2008_lngdppc_opendots_regions.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2008; fixed-effects estimates, 5 year averages)) ///
  mtitles("EAP" "ECA" "LAC" "MENA" "NA" "SA" "SSA") ///
  addnote(Note:.)

*OECD and non-OECD*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if oecd==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if oecd==0, fe first savefirst small cluster(cntry)

esttab using Second_Stage_1960-2008_lngdppc_opendots_OECD.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2008; fixed-effects estimates, 5 year averages)) ///
  mtitles("OECD" "non-OECD") ///
  addnote(Note:.)

*Income Levels*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2008) lngdppc.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if low==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if lowmid==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if upmid==1, fe first savefirst small cluster(cntry)

eststo: quietly xi: xtivreg2 lngdppc lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if high==1, fe first savefirst small cluster(cntry)

esttab using Second_Stage_1960-2008_lngdppc_opendots_incomelevels.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2008; fixed-effects estimates, 5 year averages)) ///
  mtitles("Low" "Lower middle" "Upper middle" "High") ///
  addnote(Note:.)
