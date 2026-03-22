*Load data
use "C:\NHANES\01_clean\merged_clean.dta", clear

* Create obesity variable
gen obese = (bmi >= 30)

* Descriptive
tab obese hypertension

* Logistic regression
logit hypertension obese age sex

* Odds ratios
logit hypertension obese age sex, or