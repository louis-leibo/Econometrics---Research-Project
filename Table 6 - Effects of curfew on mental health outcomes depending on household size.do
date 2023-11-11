**** TABLE 6: 

clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window17 = abs(dif) <=17
gen window30 = abs(dif) <=30
gen window45 = abs(dif) <=45
gen window60 = abs(dif) <=60

gen dif_x_before1955 = dif * before1955 

gen before1955_x_hhsize = before1955 * hh_size

gen before1955_x_hhsize2 = before1955 * (hh_size)^2

eststo clear

// for mental distress index: 
reg z_depression before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
outreg2 using myreg7.doc, replace ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 title(Table 4: effects of curfew on mental health outcomes depending on household size) dec(3) 

reg z_depression before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
outreg2 using myreg7.doc, append ctitle(+ or - 30) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_depression before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
outreg2 using myreg7.doc, append ctitle(+ or - 45) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_depression before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
outreg2 using myreg7.doc, append ctitle(+ or - 60) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

// for somatic symptoms: 
reg z_somatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
outreg2 using myreg8.doc, replace ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_somatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
outreg2 using myreg8.doc, append ctitle(+ or - 30) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_somatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
outreg2 using myreg8.doc, append ctitle(+ or - 45) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_somatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
outreg2 using myreg8.doc, append ctitle(+ or - 60) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 


// for nonsomatic symptoms: 
reg z_nonsomatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
outreg2 using myreg9.doc, replace ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_nonsomatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
outreg2 using myreg9.doc, append ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_nonsomatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
outreg2 using myreg9.doc, append ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 

reg z_nonsomatic before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
outreg2 using myreg9.doc, append ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 dec(3) 


// for sum of "yes" answers in SRQ-20
reg sum_srq before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
sum sum_srq if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg10.doc, replace ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg sum_srq before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
sum sum_srq if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg10.doc, append ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg sum_srq before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
sum sum_srq if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg10.doc, append ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg sum_srq before1955 dif dif_x_before1955 before1955_x_hhsize before1955_x_hhsize2 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
sum sum_srq if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg10.doc, append ctitle(+ or - 17) keep(before1955 before1955_x_hhsize before1955_x_hhsize2) nocons nor2 e(outcome_mean) dec(3) adec(2)


