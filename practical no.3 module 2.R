df3 <- read.csv("C:/Users/mvluc/OneDrive/Desktop/ankita tiwari/python/Student Mental health.csv", stringsAsFactors = FALSE)

colnames(df3)

table(df3$`Choose your gender`, df3$`Do you have Depression?`)
