* ******************************************************************** *
* ******************************************************************** *
*                                                                      *
*                     	 Descriptive Analysis                          *
*                                Zambia                                *
*                                                                      *
* ******************************************************************** *
* ******************************************************************** *

/*
  ** PURPOSE            Descriptive statistics, randomization, and balance table
  ** MAIN ID            hhid
  ** AUTHOR             Rohini Iyer
  ** LAST UPDATE        September, 2024
*/

* Load data
import excel "${DescStats_dtDeID}\district_data.xlsx", sheet("Sheet1") firstrow clear

* Converting all uppercase names to first letter capital followed by all lowercase
ds
foreach var in `r(varlist)' {
	rename `var', lower(`var')
}

foreach var of varlist province district consttuency ward nameoftheschool onschoolfeeding {
	replace `var' = proper(`var')
}

* Encoding all string variables
foreach var of varlist province district consttuency ward nameoftheschool location educationlevell onschoolfeeding runningagency {
    encode `var', gen(`var'_n) label()
	drop `var'
}

isid emisno // data is at the school level

* iecodebook template using "${DescStats_outInt}\processing_four_dist_codebook.xlsx", replace
iecodebook apply using "${DescStats_outInt}\processing_four_dist_codebook.xlsx"

order province- ward emisno school location- runningagency boys- total

save "${DescStats_dtInt}\school_level_data.dta", replace

****************************************************************************end!