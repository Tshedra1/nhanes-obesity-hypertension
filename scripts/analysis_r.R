# =========================
# NHANES Analysis
# =========================

# Load package
library(haven)

# Import NHANES dataset
data <- read_dta("C:/NHANES/01_clean/merged_clean.dta")

# Create obesity variable (BMI = 30)
data$obese <- ifelse(data$bmi >= 30, 1, 0)

# Check distribution of obesity
table(data$obese)

# Run logistic regression
model <- glm(htn ~ obese + age + sex,
             data = data,
             family = binomial)

# View model summary
summary(model)

#Results
# Extract odds ratios
exp(coef(model))

# Confidence intervals
exp(confint(model))
 