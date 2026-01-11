data2 <- read.csv("C:/Users/Admin/Desktop/ANKITA TIWARI (data science R)/datasets/titanic.csv")

data2$Pclass <- as.factor(data2$Pclass)
data2$Sex <- as.factor(data2$Sex)

grand_mean <- mean(data2$Fare)

tm_means <- tapply(data2$Fare, data2$Pclass, mean)
tm_sizes <- table(data2$Pclass)
SS_TM <- sum(tm_sizes * (tm_means - grand_mean)^2)

gender_means <- tapply(data2$Fare, data2$Sex, mean)
gender_sizes <- table(data2$Sex)
SS_G <- sum(gender_sizes * (gender_means - grand_mean)^2)

SS_total <- sum((data2$Fare - grand_mean)^2)
SS_error <- SS_total - SS_TM - SS_G

df_TM <- length(tm_means) - 1
df_G <- length(gender_means) - 1
df_error <- nrow(data2) - length(tm_means) - length(gender_means) + 1

MS_TM <- SS_TM / df_TM
MS_G <- SS_G / df_G
MS_error <- SS_error / df_error

F_TM <- MS_TM / MS_error
F_G <- MS_G / MS_error

F_TM
F_G

