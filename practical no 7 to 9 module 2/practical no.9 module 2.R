#Chi-Square Test of Independence
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

#Chi-Square Test of Goodness of Fit
data <- read.csv("C:/Users/Admin/Desktop/ANKITA TIWARI (data science R)/datasets/Suicides_in_India_random_500 (1).csv")

observed <- tapply(data$Total, data$Age_group, sum)

k <- length(observed)

expected <- rep(sum(observed) / k, k)

chi_square <- sum((observed - expected)^2 / expected)

df <- k - 1

observed
expected
chi_square
df


