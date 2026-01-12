library(ggplot2)

data <- read.csv("C:/Users/Admin/Desktop/ANKITA TIWARI (data science R)/datasets/student_spending.csv")

data$age <- as.factor(data$age)

sample_data <- data[1:10, ]

ggplot(sample_data, aes(x = monthly_income, y = tuition)) +
  geom_point(size = 3, color = "blue") +
  labs(
    title = "Scatter Plot: Monthly Income vs Tuition",
    x = "Monthly Income",
    y = "Tuition Fees"
  )

data$total_expense <- data$housing + data$food + data$transportation +
  data$books_supplies + data$entertainment + data$personal_care +
  data$technology + data$health_wellness + data$miscellaneous

volume_data <- data.frame(
  Type = c("Housing Expense", "Other Expenses"),
  Volume = c(
    sum(data$housing, na.rm = TRUE),
    sum(data$total_expense, na.rm = TRUE) - sum(data$housing, na.rm = TRUE)
  )
)

ggplot(volume_data, aes(x = "", y = Volume, fill = Type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Pie Chart of Housing vs Other Expenses")

hl_data <- sample_data

ggplot(hl_data, aes(x = age, ymin = food, ymax = housing)) +
  geom_linerange(size = 2, color = "red") +
  geom_point(aes(y = food), color = "blue", size = 3) +
  geom_point(aes(y = housing), color = "green", size = 3) +
  labs(
    title = "High-Low Expense Chart",
    x = "Age",
    y = "Expense Amount"
  )
