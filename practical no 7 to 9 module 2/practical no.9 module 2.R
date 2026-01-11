data <- read.csv("C:/Users/Admin/Desktop/ANKITA TIWARI (data science R)/datasets/Suicides_in_India_random_500 (1).csv")

observed <- table(data$Gender, data$Age_group)

row_totals <- rowSums(observed)
col_totals <- colSums(observed)
grand_total <- sum(observed)

expected <- outer(row_totals, col_totals) / grand_total

chi_square <- sum((observed - expected)^2 / expected)

df <- (nrow(observed) - 1) * (ncol(observed) - 1)

observed
expected
chi_square
df
