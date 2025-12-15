library(dplyr)

df6 <- read.csv("C:/Users/mvluc/OneDrive/Desktop/ankita tiwari/python/titanic.csv")

df6_sub <- df6 %>% filter(Sex %in% c("male", "female"))

t.test(Age ~ Sex, data = df6_sub)
