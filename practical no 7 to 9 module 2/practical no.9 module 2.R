data3 <- read.csv("C:/Users/Admin/Desktop/Suicides_in_India_random_500 (1).csv")

head(data3)

data3$Gender <- as.factor(data3$Gender)
data3$Age_group <- as.factor(data3$Age_group)

table_data <- table(data3$Gender, data3$Age_group)

table_data

chisq.test(table_data)
