* Defining globals with variables used for summary stats

global sumvars rural urban type_primary type_community GRZ_run community_run boys girls total

* Province level analysis

use "${DescStats_dtInt}\province_level_data.dta", clear

eststo all: estpost sum districts constituencies wards schools $sumvars

esttab 	all ///
		using "${DescStats_outFin}\summary_province.csv", replace ///
		nonotes addn(Summary statistics at the province level)

* District level analysis

use "${DescStats_dtInt}\district_level_data.dta", clear

eststo all: estpost sum constituencies wards schools $sumvars

esttab 	all ///
		using "${DescStats_outFin}\summary_district.csv", replace ///
		nonotes addn(Summary statistics at the district level)
		
* Constituency level analysis

use "${DescStats_dtInt}\constituency_level_data.dta", clear

eststo all: estpost sum wards schools $sumvars

esttab 	all ///
		using "${DescStats_outFin}\summary_constituency.csv", replace ///
		nonotes addn(Summary statistics at the constituency level)

* Ward level analysis		

use "${DescStats_dtInt}\ward_level_data.dta", clear

eststo all: estpost sum schools $sumvars

esttab 	all ///
		using "${DescStats_outFin}\summary_ward.csv", replace ///
		nonotes addn(Summary statistics at the ward level)
		
* School level analysis		

use "${DescStats_dtInt}\constructed_school_level_data.dta", clear

eststo all: estpost sum $sumvars

esttab 	all ///
		using "${DescStats_outFin}\summary_school.csv", replace ///
		nonotes addn(Summary statistics at the school level)
		
****************************************************************************end!