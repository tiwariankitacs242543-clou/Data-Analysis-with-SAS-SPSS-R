data1 <- read.csv("C:/Users/Admin/Desktop/student data.csv")

colnames(data1)

colnames(data1) <- c("ID", "Age", "Study_Hours", "Attendance", "Score")

data1$Age <- as.factor(data1$Age)

anova_one <- aov(Score ~ Age, data = data1)

summary(anova_one)
