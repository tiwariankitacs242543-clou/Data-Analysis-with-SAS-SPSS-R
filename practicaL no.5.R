library(dplyr)
library(readr)

my_data <- read_csv("C:/Users/mvluc/OneDrive/Desktop/ankita tiwari/python/Student Mental Health.csv")

my_data <- my_data[, -1]

head(my_data)

students_sorted_age <- my_data %>%
  arrange(Age)
cat("Top 5 youngest students:\n")
head(students_sorted_age, 5)

students_sorted_cgpa_desc <- my_data %>%
  arrange(desc(`What is your CGPA?`))
cat("Top 5 students with highest CGPA:\n")
head(students_sorted_cgpa_desc, 5)

students_multi_sort <- my_data %>%
  arrange(`Your current year of Study`, Age)
cat("Top 10 students sorted by year and age:\n")
head(students_multi_sort, 10)

high_risk_students <- my_data %>%
  filter(`Do you have Anxiety?` == "Yes", `Do you have Panic attack?` == "Yes") %>%
  arrange(Age)
cat("Top 5 students with Anxiety and Panic attacks, youngest first:\n")
print(high_risk_students %>%
        select(`Choose your gender`, Age, `Your current year of Study`, `Do you have Anxiety?`, `Do you have Panic attack?`) %>%
        head(5))
