install.packages(c("readr", "psych"))

library(readr)    # For efficient data reading
library(psych)    # For descriptive statistics

Student.Mental.health <- read.csv("C:\Users\Admin\Desktop\ANKITA TIWARI\DATA ANALYSIS\student data.csv")

# View the first few rows
head(Student.Mental.health)

# View the last few rows
tail(Student.Mental.health)

# Get dimensions (rows and columns)
dim(Student.Mental.health)

cat("Dimensions (Rows, Columns): ", dim(Student.Mental.health), "\n")

# Structure of the dataset
str(Student.Mental.health)

# Summary statistics
summary(Student.Mental.health)

# Column names
names(Student.Mental.health)
cat("Column Names: ", names(Student.Mental.health), "\n")

# Detailed descriptive statistics
describe(Student.Mental.health)
