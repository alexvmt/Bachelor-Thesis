*hdi: First Stage with lag opendots 1976-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi middle years.dta"

encode country, gen(cntry)
xtset cntry year

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen lagpredictedopen)  if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.year if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi middle years.dta"

encode country, gen(cntry)
xtset cntry year

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen lagpredictedopen)  if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.year if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear 

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi middle years.dta"

encode country, gen(cntry)
xtset cntry year

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.year if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1976-2010_hdi_opendots_middle_years.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1976-2008; fixed-effects estimates, middle years)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)
  
  
	*Partial R², F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi middle years.dta"

encode country, gen(cntry)
xtset cntry year

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi middle years.dta"

encode country, gen(cntry)
xtset cntry year

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi middle years.dta"

encode country, gen(cntry)
xtset cntry year

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)


*hdi: Second Stage with lag opendots 1976-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi middle years.dta"

encode country, gen(cntry)
xtset cntry year

eststo clear

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.year if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.year if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.year (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.year if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1976-2010_hdi_opendots_middle_years.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1976-2010; fixed-effects estimates, middle years)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)



*hdi: First Stage with lag openpwt 1976-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen)  if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen)  if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lagpredictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1976-2010_hdi_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1976-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)
  
  
	*Partial R², F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if Full==1, fe first savefirst small cluster(cntry)


*hdi: Second Stage with lag openpwt 1976-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen lagpredictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi openpwt lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1976-2010_hdi_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1976-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)



*hdi: First Stage without lag opendots 1976-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen)  if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen)  if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

clear 

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg opendots predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 opendots predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1976-2010_hdi_opendots.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1976-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)
  
  
	*Partial R², F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)


*hdi: Second Stage without lag opendots 1976-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

eststo clear

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

eststo: quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (opendots = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg hdi opendots lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)
drop sample

esttab using Second_Stage_1976-2010_hdi_opendots.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1976-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)



*hdi: First Stage without lag openpwt 1976-2008*

eststo clear
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen)  if MRW==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen)  if MRWI==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

quietly xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)
generate sample = e(sample)
eststo: quietly xi: xtreg openpwt predictedopen lnpop largedisaster laglargedisaster i.period if sample==1, fe vce(cluster cntry)

drop if sample!=1
pcorr2 openpwt predictedopen lnpop largedisaster laglargedisaster

drop sample

esttab using First_Stage_1976-2010_hdi_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(First stage (1976-2008; fixed-effects estimates, 5-year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)
  
  
	*Partial R², F-Test and Stock and Yogo (2005) Critical Values*
	
clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRW==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if MRWI==1, fe first savefirst small cluster(cntry)

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

xi: xtivreg2 hdi lnpop largedisaster laglargedisaster i.period (openpwt = predictedopen) if Full==1, fe first savefirst small cluster(cntry)


*hdi: Second Stage without lag openpwt 1976-2010*

clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

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

esttab using Second_Stage_1976-2010_hdi_openpwt.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(Second stage (1976-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("2SLS" "OLS" "2SLS" "OLS" "2SLS" "OLS") ///
  addnote(Note:.)

  
  
*HDI, Health, Education and Income*

clear
eststo clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

eststo: quietly xi: xtreg hdi life meanyrsschool expctdyrsschool lngnipc i.period if MRW==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life meanyrsschool expctdyrsschool lngnipc i.period if MRWI==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life meanyrsschool expctdyrsschool lngnipc i.period if Full==1, fe vce(cluster cntry)

esttab using hdi_life_meanyrsschool_expctdyrsschool_lngnipc_1976-2010.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(HDI and its components (1976-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  clear
eststo clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

eststo: quietly xi: xtreg hdi life meanyrsschool expctdyrsschool lngdppc3 i.period if MRW==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life meanyrsschool expctdyrsschool lngdppc3 i.period if MRWI==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life meanyrsschool expctdyrsschool lngdppc3 i.period if Full==1, fe vce(cluster cntry)

esttab using hdi_life_meanyrsschool_expctdyrsschool_lngdppc_1976-2010.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(HDI and its components (1976-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  clear
eststo clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

eststo: quietly xi: xtreg hdi life school lngnipc i.period if MRW==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life school lngnipc i.period if MRWI==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life school lngnipc i.period if Full==1, fe vce(cluster cntry)

esttab using hdi_life_school_lngnipc_1976-2010.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(HDI and its components (1976-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

  clear
eststo clear

use "C:\Users\Alex\Desktop\Master Dataset 16.07.2016 (1976-2010) hdi.dta"

encode country, gen(cntry)
xtset cntry period

eststo: quietly xi: xtreg hdi life school lngdppc3 i.period if MRW==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life school lngdppc3 i.period if MRWI==1, fe vce(cluster cntry)
eststo: quietly xi: xtreg hdi life school lngdppc3 i.period if Full==1, fe vce(cluster cntry)

esttab using hdi_life_school_lngdppc_1976-2010.tex, replace compress se r2 ar2 star(* 0.1 ** 0.05 *** 0.01) ///
  title(HDI and its components (1976-2010; fixed-effects estimates, 5 year averages)) ///
  mtitles("MRW" "MRW I" "Full") ///
  addnote(Note:.)

xi: xtreg hdi life meanyrsschool lngdppc3 polity i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 polity i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 polity i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi life meanyrsschool lngdppc3 lnpop i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 lnpop i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 lnpop i.period if Full==1, fe vce(cluster cntry)

xi: xtreg lnhdilife meanyrsschool lngnipc i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngnipc i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngnipc i.period if Full==1, fe vce(cluster cntry)

xi: xtreg lnhdi life meanyrsschool lngdppc3 i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngdppc3 i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngdppc3 i.period if Full==1, fe vce(cluster cntry)

xi: xtreg lnhdi life meanyrsschool lngdppc3 polity i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngdppc3 polity i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngdppc3 polity i.period if Full==1, fe vce(cluster cntry)

xi: xtreg lnhdi life meanyrsschool lngdppc3 lnpop i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngdppc3 lnpop i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg lnhdi life meanyrsschool lngdppc3 lnpop i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi100 life meanyrsschool lngnipc i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngnipc i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngnipc i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi100 life meanyrsschool lngdppc3 i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngdppc3 i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngdppc3 i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi100 life meanyrsschool lngdppc3 polity i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngdppc3 polity i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngdppc3 polity i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi100 life meanyrsschool lngdppc3 lnpop i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngdppc3 lnpop i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi100 life meanyrsschool lngdppc3 lnpop i.period if Full==1, fe vce(cluster cntry)



xi: xtreg hdi life meanyrsschool lngdppc3 opendots i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 opendots i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 opendots i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi opendots i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi opendots i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi opendots i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi life meanyrsschool lngdppc3 openpwt i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 openpwt i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi life meanyrsschool lngdppc3 openpwt i.period if Full==1, fe vce(cluster cntry)

xi: xtreg hdi openpwt i.period if MRW==1, fe vce(cluster cntry)
xi: xtreg hdi openpwt i.period if MRWI==1, fe vce(cluster cntry)
xi: xtreg hdi openpwt i.period if Full==1, fe vce(cluster cntry)



reg hdi life meanyrsschool expctdyrsschool lngnipc
reg hdi life meanyrsschool expctdyrsschool lngnipc polity
reg hdi life meanyrsschool expctdyrsschool lngnipc lnpop
reg hdi life meanyrsschool expctdyrsschool lngnipc opendots
reg hdi life meanyrsschool expctdyrsschool lngnipc openpwt

pcorr2 hdi life meanyrsschool expctdyrsschool lngnipc
corrtex hdi life meanyrsschool expctdyrsschool lngnipc, file(auto1) replace

pcorr2 hdi life meanyrsschool expctdyrsschool lngdppc3
corrtex hdi life meanyrsschool expctdyrsschool lngdppc3, file(auto2) replace

pcorr2 hdi life meanyrsschool expctdyrsschool lngnipc opendots
pcorr2 hdi life meanyrsschool expctdyrsschool lngnipc openpwt

reg hdi life school lngnipc
reg hdi life school lngnipc polity
reg hdi life school lngnipc lnpop
reg hdi life school lngnipc opendots
reg hdi life school lngnipc openpwt

pcorr2 hdi life school lngnipc
corrtex hdi life school lngnipc, file(auto3) replace

pcorr2 hdi life school lngdppc3
corrtex hdi life school lngdppc3, file(auto4) replace

pcorr2 hdi life school lngnipc opendots
pcorr2 hdi life school lngnipc openpwt
