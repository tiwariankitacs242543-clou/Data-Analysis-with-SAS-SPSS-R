data2 <- read.csv("C:/Users/Admin/Desktop/titanic.csv")

head(data2)

data2$Sex <- as.factor(data2$Sex)
data2$Survived <- as.factor(data2$Survived)

table_data <- table(data2$Sex, data2$Survived)

chisq.test(table_data)
