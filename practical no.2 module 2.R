library(dplyr)

df2 <- read.csv("C:/Users/mvluc/OneDrive/Desktop/ankita tiwari/python/sales_data.csv")

table(df2$Region)

df2 %>% 
  count(Product_Category)






