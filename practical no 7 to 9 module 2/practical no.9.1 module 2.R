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
