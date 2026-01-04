titanic <- read.csv("C:/Users/Admin/Desktop/ANKITA TIWARI (data science R)/datasets/titanic.csv")

str(titanic)

titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)

titanic_clean <- na.omit(titanic[, c("Fare", "Sex", "Pclass")])

anova_two <- aov(Fare ~ Sex * Pclass, data = titanic_clean)

summary(anova_two)

