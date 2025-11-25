# Install and load necessary packages
install.packages("dplyr")
install.packages("readr")

library(dplyr)
library(readr)

# Load your dataset
my_data <- read_csv("C:/Users/mvluc/OneDrive/Desktop/ankita tiwari/python/Student Mental Health.csv")

# Remove the first column if it's just an index
my_data <- my_data[ , -1]

# View first few rows
head(my_data)

# 1. Female students
female_students <- subset(my_data, `Choose your gender` == "Female")
cat("Number of female students:", nrow(female_students), "\n")
head(female_students)

# 2. Students with Depression
depression_students <- subset(my_data, `Do you have Depression?` == "Yes")
cat("Number of students with depression:", nrow(depression_students), "\n")
head(depression_students)

# 3. Students in year 3 or 4 OR have Panic attacks
senior_or_panic <- subset(my_data, `Your current year of Study` %in% c("year 3", "year 4") | `Do you have Panic attack?` == "Yes")
cat("Number of seniors or students with panic attacks:", nrow(senior_or_panic), "\n")
head(senior_or_panic)

# 4. Students with CGPA >= 3.50 (assuming CGPA ranges as factor/character)
high_cgpa <- my_data %>%
  filter(`What is your CGPA?` %in% c("3.50 - 3.99", "4.00"))
cat("Number of students with high CGPA:", nrow(high_cgpa), "\n")
head(high_cgpa)

# 5. Married students who have sought specialist treatment
married_treated <- my_data %>%
  filter(`Marital status` == "Yes", `Did you seek any specialist for a treatment?` == "Yes")
cat("Number of married students who sought treatment:", nrow(married_treated), "\n")
head(married_treated)

# 6. Students with both Anxiety and Panic attacks
anxiety_panic <- my_data %>%
  filter(`Do you have Anxiety?` == "Yes", `Do you have Panic attack?` == "Yes")
cat("Number of students with both Anxiety and Panic attacks:", nrow(anxiety_panic), "\n")
head(anxiety_panic)
