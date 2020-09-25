*meanyrsschool: First Stage with lag opendots 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_meanyrsschool_opendots.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  
	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
  
  
*meanyrsschool: Second Stage with lag opendots 1960-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1960-2010_meanyrsschool_opendots.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  
  
*meanyrsschool: First Stage with lag openpwt 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_meanyrsschool_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  
	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)


*meanyrsschool: Second Stage with lag openpwt 1960-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1960-2010_meanyrsschool_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2010; fixed-effects estimates; 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  
  
*meanyrsschool: First Stage without lag opendots 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_meanyrsschool_opendots.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  
	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
  
  
*meanyrsschool: Second Stage without lag opendots 1960-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1960-2010_meanyrsschool_opendots.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  
  
*meanyrsschool: First Stage without lag openpwt 1960-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1960-2008_meanyrsschool_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1960-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  
	*F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)


*meanyrsschool: Second Stage without lag openpwt 1960-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1960-2010) meanyrsschool.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 meanyrsschool lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg meanyrsschool openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1960-2010_meanyrsschool_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1960-2010; fixed-effects estimates; 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)
