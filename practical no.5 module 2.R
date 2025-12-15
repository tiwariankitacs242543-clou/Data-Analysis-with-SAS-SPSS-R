# Load necessary library
library(dplyr)

# Read the CSV
df5 <- read.csv("C:/Users/mvluc/OneDrive/Desktop/ankita tiwari/python/heart.csv")

# Subset to only Male and Female (just in case there are other codes)
df5_sub <- df5 %>% filter(Sex %in% c("M", "F"))

# Perform t-test comparing RestingBP by Sex
t.test(RestingBP ~ Sex, data = df5_sub)
