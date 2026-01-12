library(ggplot2)

data <- read.csv("C:/Users/Admin/Desktop/ANKITA TIWARI (data science R)/datasets/Employe_Performance_dataset.csv")

ggplot(data, aes(x = Salary)) +
  geom_histogram(bins = 10, fill = "purple", color = "black") +
  labs(
    title = "Histogram of Employee Salary",
    x = "Salary",
    y = "Frequency"
  )

ggplot(data, aes(x = as.factor(Department), y = Salary)) +
  geom_boxplot(fill = "green") +
  labs(
    title = "Box Plot of Salary by Department",
    x = "Department",
    y = "Salary"
  )
