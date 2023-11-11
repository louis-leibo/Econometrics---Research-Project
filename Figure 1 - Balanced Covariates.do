

**** FIGURE 1: 

// highschool: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg highschool before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse highschool before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg highschool dif before1955 dif_x_before1955
predict fit 
gen fit_l = dif < 0
gen fit_r = dif > 0

twoway (scatter highschool dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Completed highschool", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l fit_r) (lfitci highschool dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci highschool dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) 
graph save "Highschool", replace

// illiterate: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg illiterate before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse illiterate before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg illiterate dif before1955 dif_x_before1955
predict fit 
gen fit_l2 = dif < 0
gen fit_r2 = dif > 0

twoway (scatter illiterate dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Illiterate", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l2 fit_r2) (lfitci illiterate dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci illiterate dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Illiterate", replace

// female: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg female before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg female dif before1955 dif_x_before1955
predict fit 
gen fit_l3 = dif < 0
gen fit_r3 = dif > 0

twoway (scatter female dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Female", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l3 fit_r3) (lfitci female dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci female dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Female", replace

// Married: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg married before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse married before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg married dif before1955 dif_x_before1955
predict fit 
gen fit_l4 = dif < 0
gen fit_r4 = dif > 0

twoway (scatter married dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Married", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l4 fit_r4) (lfitci married dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci married dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Married", replace

// Widowed or separated: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg widowed_separated before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse widowed_separated before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg widowed_separated dif before1955 dif_x_before1955
predict fit 
gen fit_l5 = dif < 0
gen fit_r5 = dif > 0

twoway (scatter widowed_separated dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Widowed or separated", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (lfitci widowed_separated dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci widowed_separated dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Widowed or separated", replace

// Non-Turkish: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg non_turk before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse non_turk before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg non_turk dif before1955 dif_x_before1955
predict fit 
gen fit_l6 = dif < 0
gen fit_r6 = dif > 0

twoway (scatter non_turk dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Non-Turkish", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l6 fit_r6) (lfitci non_turk dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci non_turk dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Non-Turkish", replace

// Pre-Covid 19 household size: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg pre_covid_hhsize before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse pre_covid_hhsize before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg pre_covid_hhsize dif before1955 dif_x_before1955
predict fit 
gen fit_l7 = dif < 0
gen fit_r7 = dif > 0

twoway (scatter pre_covid_hhsize dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Pre-Covid 19 household size", size(large)) xlabel(-44(22)44) ylabel(0 2 4 6) legend(off)) (line fit_l7 fit_r7) (lfitci pre_covid_hhsize dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci pre_covid_hhsize dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Pre-Covid 19 household size", replace

// Ever received psychological support: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg psych_support before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse psych_support before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg psych_support dif before1955 dif_x_before1955
predict fit 
gen fit_l8 = dif < 0
gen fit_r8 = dif > 0

twoway (scatter psych_support dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Ever received psychological support", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l8 fit_r8) (lfitci psych_support dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci psych_support dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Ever received psychological support", replace

// Has a chronic disease: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg chronic_disease before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse chronic_disease before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg chronic_disease dif before1955 dif_x_before1955
predict fit 
gen fit_l9 = dif < 0
gen fit_r9 = dif > 0

twoway (scatter chronic_disease dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(small)) title("Has a chronic disease", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l9 fit_r9) (lfitci chronic_disease dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci chronic_disease dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Has a chronic disease", replace


// Combining the 9 graphs into 1 figure: 
graph combine "Highschool" "Illiterate" "Female" "Married" "Widowed or separated" "Non-Turkish" "Pre-Covid 19 household size" "Ever received psychological support" "Has a chronic disease", imargin(small) graphregion(color(white) lcolor(white) lwidth(thick)) ysize(4) xsize(5.5)  iscale(*.7) title("Figure 1: Balanced covariates", size(3.5) color(black)) saving("Figure1.gph", replace)
