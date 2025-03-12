* Load data
use "${DescStats_dtInt}\school_level_data.dta", clear

* Creating dummy variables
generate rural = (location==1)
generate urban = (location==2)
generate type_primary = (educlevel==2)
generate type_community = (educlevel==1)
generate GRZ_run = (runningagency==2 | runningagency==3)
generate community_run = (runningagency==1)
replace onschoolfeeding=0

label define yesno 0 "no" 1 "yes"
label value rural urban type_primary type_community GRZ_run community_run onschoolfeeding yesno

drop location onschoolfeeding educlevel runningagency

order province-school rural-community_run boys girls total

* iecodebook template using "${DescStats_outInt}\constructing_four_dist_codebook.xlsx", replace
iecodebook apply using "${DescStats_outInt}\constructing_four_dist_codebook.xlsx"

save "${DescStats_dtInt}\constructed_school_level_data.dta", replace

* Ward level data
bysort province district constituency ward: gen schools_per_ward = _N

collapse (count) schools_per_ward (sum) rural urban type_primary type_community GRZ_run community_run boys girls total, by( province district constituency ward)
rename schools_per_ward schools
save "${DescStats_dtInt}\ward_level_data.dta", replace

* Constituency level data
bysort province district constituency: gen wards_per_constituency = _N

collapse (count) wards_per_constituency (sum) schools rural urban type_primary type_community GRZ_run community_run boys girls total, by(province district constituency)
rename wards_per_constituency wards
save "${DescStats_dtInt}\constituency_level_data.dta", replace

* District level data
bysort province district: gen constituencies_per_district = _N

collapse (count) constituencies_per_district (sum) wards schools rural urban type_primary type_community GRZ_run community_run boys girls total, by(province district)
rename constituencies_per_district constituencies
save "${DescStats_dtInt}\district_level_data.dta", replace

* Province level data
bysort province: gen districts_per_province = _N

collapse (count) districts_per_province (sum) constituencies wards schools rural urban type_primary type_community GRZ_run community_run boys girls total, by(province)
rename districts_per_province districts
save "${DescStats_dtInt}\province_level_data.dta", replace

****************************************************************************end!