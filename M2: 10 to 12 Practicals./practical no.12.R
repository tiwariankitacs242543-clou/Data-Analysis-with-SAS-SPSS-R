employee_data <- data.frame(
  Age = c(25, 30, 35, 40, 45, 50, 55, 60),
  Salary = c(2500, 3200, 4000, 4800, 5500, 6000, 6500, 7200),
  Experience = c(1, 3, 5, 8, 12, 15, 18, 22),
  Performance_Score = c(2, 3, 4, 4, 5, 3, 4, 5),
  Working_Hours = c(35, 38, 40, 42, 45, 48, 50, 52)
)

correlation_matrix <- cor(employee_data)

print(correlation_matrix)
