data1 <- read.csv("C:/Users/Admin/Desktop/ANKITA TIWARI (data science R)/datasets/student data.csv")

print(data1)

colnames(data1)[colnames(data1) == "Score (%)"] <- "Score"

data1$Age <- as.factor(data1$Age)

group_means <- tapply(data1$Score, data1$Age, mean)

grand_mean <- mean(data1$Score)

group_sizes <- table(data1$Age)

SSB <- sum(group_sizes * (group_means - grand_mean)^2)

SSW <- sum((data1$Score - group_means[data1$Age])^2)

df_between <- length(group_means) - 1
df_within <- nrow(data1) - length(group_means)

MSB <- SSB / df_between
MSW <- SSW / df_within

F_value <- MSB / MSW


F_value
