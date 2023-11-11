
**** FIGURE 3: 

// mental distress index: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg z_depression before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse z_depression before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg z_depression dif before1955 dif_x_before1955
predict fit 
gen fit_l = dif < 0
gen fit_r = dif > 0

twoway (scatter z_depression dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(medium)) title("Mental distress index", size(large)) xlabel(-44(22)44) ylabel(-1 -.5 0 .5 1) legend(off)) (line fit_l fit_r) (lfitci z_depression dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci z_depression dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Mental distress index", replace


// somatic symptoms: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 
reg z_somatic before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse z_somatic before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window44, by(dif)

reg z_somatic dif before1955 dif_x_before1955
predict fit 
gen fit_l2 = dif < 0
gen fit_r2 = dif > 0

twoway (scatter z_somatic dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(medium)) title("Somatic symptoms of distress index", size(large)) xlabel(-44(22)44) ylabel(-1 -.5 0 .5 1) legend(off)) (line fit_l2 fit_r2) (lfitci z_somatic dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci z_somatic dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Somatic symptoms of distress index", replace

// nonsomatic symptoms: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 
reg z_nonsomatic before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse z_nonsomatic before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window44, by(dif)

reg z_nonsomatic dif before1955 dif_x_before1955
predict fit 
gen fit_l3 = dif < 0
gen fit_r3 = dif > 0

twoway (scatter z_nonsomatic dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(medium)) title("Nonsomatic symptoms of distress index", size(large)) xlabel(-44(22)44) ylabel(-1 -.5 0 .5 1) legend(off)) (line fit_l3 fit_r3) (lfitci z_nonsomatic dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci z_nonsomatic dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Nonsomatic symptoms of distress index", replace


// sum of "yes" answers in SRQ-20
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear
 
gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 
reg sum_srq before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse sum_srq before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window44, by(dif)

reg sum_srq dif before1955 dif_x_before1955
predict fit 
gen fit_l4 = dif < 0
gen fit_r4 = dif > 0

twoway (scatter sum_srq dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)", size(medium)) title("Sum of yes answers in SRQ­20", size(large)) xlabel(-44(22)44) ylabel(-4(2)4) legend(off)) (line fit_l4 fit_r4) (lfitci sum_srq dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci sum_srq dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Sum of yes answers in SRQ­20", replace


// Combining the 4 graphs into 1 figure: 
graph combine "Mental distress index" "Somatic symptoms of distress index" "Nonsomatic symptoms of distress index" "Sum of yes answers in SRQ­20", col(2) imargin(small) graphregion(color(white) lcolor(white) lwidth(thick)) ysize(6) xsize(5.5) iscale(*.7) title("Figure 3: RD Treatment effects on mental health outcomes", size(3.5) color(black)) saving("Figure 3.gph", replace)

