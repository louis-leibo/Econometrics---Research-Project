**** TABLE 7:
clear all
global dir= "/Users/louisleibovici/Desktop/EC2C1 Project"

use "project1.dta", clear

#delimit ;
global list1 "outside_week under_curfew never_out";
#delimit cr

gen controldummy = 0 
replace controldummy = 1 if before1955 == 0 

egen index_mobility = weightave2($list1), normby(controldummy)

ssc install ivregress2

ivregress 2sls z_depression dif (index_mobility = before1955), first vce(cluster dif)
est store first
outreg2 using myreg21.doc, cttop(first) replace dec(3) 
est store second
outreg2 using myreg21.doc, cttop(second) dec(3) 

ivregress 2sls z_somatic dif (index_mobility = before1955), first vce(cluster dif)
est store first
outreg2 using myreg22.doc, cttop(first) replace dec(3) 
est store second
outreg2 using myreg22.doc, cttop(second) dec(3) 

ivregress 2sls z_nonsomatic dif (index_mobility = before1955), first vce(cluster dif)
est store first
outreg2 using myreg23.doc, cttop(first) replace dec(3) 
est store second
outreg2 using myreg23.doc, cttop(second) dec(3) 

ivregress 2sls sum_srq dif (index_mobility = before1955), first vce(cluster dif)
est store first
outreg2 using myreg24.doc, cttop(first) replace dec(3) 
est store second
outreg2 using myreg24.doc, cttop(second) dec(3) 
