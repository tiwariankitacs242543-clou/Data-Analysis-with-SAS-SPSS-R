library(psych)

df1 <- read.csv("C:/Users/mvluc/OneDrive/Desktop/ankita tiwari/python/sales_data.csv")

summary(df1$Sales_Amount)

psych::describe(df1$Quantity_Sold)

