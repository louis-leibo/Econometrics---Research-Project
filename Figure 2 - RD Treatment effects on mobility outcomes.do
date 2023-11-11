**** FIGURE 2:

// Days outside last week: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 
reg outside_week before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse outside_week before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window44, by(dif)

reg outside_week dif before1955 dif_x_before1955
predict fit 
gen fit_l = dif < 0
gen fit_r = dif > 0

twoway (scatter outside_week dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)") title("Days outside last week", size(large)) xlabel(-44(22)44) ylabel(0 2 4 6) legend(off)) (line fit_l fit_r)(lfitci outside_week dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci outside_week dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Days outside week", replace

// Under curfew: problème: certains points touchent en haut et en bas du graph: car extreme valeurs? possible de les enlever? 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 
reg under_curfew before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse under_curfew before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window44, by(dif)

reg under_curfew dif before1955 dif_x_before1955
predict fit 
gen fit_l2 = dif < 0
gen fit_r2 = dif > 0

twoway (scatter under_curfew dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)") title("Under curfew", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l2 fit_r2) (lfitci under_curfew dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci under_curfew dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Under curfew", replace


// Never goes out: 
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 
reg never_out before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse never_out before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window44, by(dif)

reg never_out dif before1955 dif_x_before1955
predict fit 
gen fit_l3 = dif < 0
gen fit_r3 = dif > 0

twoway (scatter never_out dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)") title("Never goes out", size(large)) xlabel(-44(22)44) ylabel(0 .2 .4 .6 .8 1) legend(off)) (line fit_l3 fit_r3) (lfitci never_out dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci never_out dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) 
graph save "Never goes out", replace

// Restricted mobility index:  
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

#delimit ;
global list1 "outside_week under_curfew never_out";
#delimit cr

gen controldummy = 0 
replace controldummy = 1 if before1955 == 0 

egen index_mobility = weightave2($list1), normby(controldummy)

gen window44 = abs(dif) <=44
gen dif_x_before1955 = dif * before1955 

reg index_mobility before1955 dif dif_x_before1955 i.month i.province_n i.ethnicity i.education i.female i.survey_taker_id if window44, vce(cluster dif)

collapse index_mobility before1955 dif_x_before1955 month province_n ethnicity education female survey_taker_id if window, by(dif)

reg index_mobility dif before1955 dif_x_before1955
predict fit 
gen fit_l = dif < 0
gen fit_r = dif > 0

twoway (scatter index_mobility dif, xline(0) msize(small) xtitle("Born before December 1955 (in months)") title("Restricted mobility index", size(medium)) xlabel(-44(22)44) ylabel(-2 0 2 4) legend(off)) (line fit_l fit_r) (lfitci index_mobility dif if dif <0, ciplot(rline) color(black) alwidth(thin) fintensity(50)) (lfitci index_mobility dif if dif >0, ciplot(rline) color(black) alwidth(thin) fintensity(50))
graph save "Restricted mobility index", replace


// Combining the 3 graphs into 1 figure: 
graph combine "Days outside week" "Under curfew" "Never goes out" "Restricted mobility index", col(2) imargin(small) graphregion(color(white) lcolor(white) lwidth(thick)) ysize(6) xsize(5.5) iscale(*.7) title("Figure 2: RD Treatment effects on mobility outcomes", size(3.5) color(black)) saving("Figure 2.gph", replace)




