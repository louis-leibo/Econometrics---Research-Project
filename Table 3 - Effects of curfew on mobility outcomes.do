**** TABLE 3: 

clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

ssc install outreg2

gen window17 = abs(dif) <=17
gen window30 = abs(dif) <=30
gen window45 = abs(dif) <=45
gen window60 = abs(dif) <=60
gen dif_x_before1955 = dif * before1955 

eststo clear

// Days outside last week:
reg outside_week before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
sum outside_week if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg.doc, replace ctitle(+ or - 17) keep(before1955) nocons nor2 title(Table 3: effects of curfew on mobility outcomes) e(outcome_mean) dec(3) adec(2)

reg outside_week before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
sum outside_week if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg.doc, append ctitle(+ or - 30) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg outside_week before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
sum outside_week if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg.doc, append ctitle(+ or - 45) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg outside_week before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
sum outside_week if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg.doc, append ctitle(+ or - 60) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)


// Under curfew: 
reg under_curfew before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
sum under_curfew if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg1.doc, replace ctitle(+ or - 17) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)


reg under_curfew before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
sum under_curfew if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg1.doc, append ctitle(+ or - 30) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg under_curfew before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
sum under_curfew if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg1.doc, append ctitle(+ or - 45) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg under_curfew before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
sum under_curfew if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg1.doc, append ctitle(+ or - 60) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)


// Never goes out: 
reg never_out before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
sum never_out if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg2.doc, replace ctitle(+ or - 17) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg never_out before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
sum never_out if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg2.doc, append ctitle(+ or - 30) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)


reg never_out before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
sum never_out if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg2.doc, append ctitle(+ or - 45) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg never_out before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
sum never_out if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg2.doc, append ctitle(+ or - 60) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

// Mobility index: 
#delimit ;
global list1 "outside_week under_curfew never_out";
#delimit cr

gen controldummy = 0 
replace controldummy = 1 if before1955 == 0 

egen index_mobility = weightave2($list1), normby(controldummy)

reg index_mobility before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window17, vce(cluster dif)
sum index_mobility if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg11.doc, replace ctitle(+ or - 17) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg index_mobility before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window30, vce(cluster dif)
sum index_mobility if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg11.doc, append ctitle(+ or - 30) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg index_mobility before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window45, vce(cluster dif)
sum index_mobility if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg11.doc, append ctitle(+ or - 45) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)

reg index_mobility before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window60, vce(cluster dif)
sum index_mobility if e(sample) & before1955 == 0
estadd scalar outcome_mean = r(mean)
outreg2 using myreg11.doc, append ctitle(+ or - 60) keep(before1955) nocons nor2 e(outcome_mean) dec(3) adec(2)
