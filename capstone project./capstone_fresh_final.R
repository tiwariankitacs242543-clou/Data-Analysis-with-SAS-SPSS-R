rm(list = ls())

packages <- c("dplyr","ggplot2","corrplot","psych","writexl")

for(p in packages){
  if(!require(p, character.only = TRUE)){
    install.packages(p)
    library(p, character.only = TRUE)
  }
}

data <- read.csv(file.choose(), stringsAsFactors = FALSE)

names(data)[2] <- "AgeGroup"
names(data)[3] <- "Gender"
names(data)[17] <- "Belief"

data$Gender <- as.factor(data$Gender)
data$AgeGroup <- as.factor(data$AgeGroup)


belief_questions <- data[,c(4,5,6,7,8)]

belief_numeric <- data.frame(
  lapply(belief_questions, function(x){
    
    x <- tolower(trimws(x))
    
    dplyr::case_when(
      grepl("strongly disagree", x) ~ 1,
      grepl("^disagree$", x) ~ 2,
      grepl("neutral|neither", x) ~ 3,
      grepl("^agree$", x) ~ 4,
      grepl("strongly agree", x) ~ 5,
      TRUE ~ NA_real_
    )
  })
)

colnames(belief_numeric) <- paste0("Belief_Q",1:5)


data$PBI <- rowMeans(belief_numeric, na.rm = TRUE)


data <- dplyr::bind_cols(data, belief_numeric)


print(summary(data))
print(psych::describe(data$PBI))

table(data$Gender)
table(data$AgeGroup)
prop.table(table(data$Gender))*100

table(data$Gender, data$AgeGroup)
table(data$Gender, data$Belief)

# One Sample T Test
t.test(data$PBI, mu = 3)

# Independent T Test
t.test(PBI ~ Gender, data = data)

# Paired T Test
paired_data <- na.omit(belief_numeric[,c(1,2), drop=FALSE])

if(nrow(paired_data) > 2){
  t.test(paired_data[,1], paired_data[,2], paired = TRUE)
}

# --------------------------------------------
# ANOVA
# --------------------------------------------

anova1 <- aov(PBI ~ AgeGroup, data = data)
summary(anova1)

anova2 <- aov(PBI ~ Gender * AgeGroup, data = data)
summary(anova2)

# --------------------------------------------
# Chi Square
# --------------------------------------------

belief_table <- table(data$Gender, data$Belief)
chisq.test(belief_table)


ggplot(data, aes(x = Gender)) +
  geom_bar(fill = "#2E86C1") +
  labs(
    title = "Gender Distribution of Participants",
    subtitle = "Shows representation of male and female respondents",
    x = "Gender",
    y = "Number of Participants"
  ) +
  theme_minimal()

ggplot(data, aes(x = AgeGroup)) +
  geom_bar(fill = "#F39C12") +
  labs(
    title = "Age Group Distribution",
    subtitle = "Age composition of survey participants",
    x = "Age Group",
    y = "Number of Participants"
  ) +
  theme_minimal()

ggplot(data, aes(x = PBI)) +
  geom_histogram(binwidth = 0.5, fill = "#8E44AD") +
  labs(
    title = "Distribution of Paranormal Belief Index (PBI)",
    subtitle = "Shows how strongly participants believe in paranormal phenomena",
    x = "PBI Score",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(data, aes(x = Gender, y = PBI)) +
  geom_boxplot(fill = "#27AE60") +
  labs(
    title = "Paranormal Belief Index by Gender",
    subtitle = "Comparison of belief scores between genders",
    x = "Gender",
    y = "Belief Index"
  ) +
  theme_minimal()


ggplot(data, aes(x = AgeGroup, y = PBI)) +
  geom_boxplot(fill="pink") +
  labs(
    title = "Paranormal Belief Index Across Age Groups",
    subtitle = "Analyzes if belief differs with age",
    x = "Age Group",
    y = "Belief Index"
  ) +
  theme_minimal()


belief_clean <- belief_numeric

belief_clean <- belief_clean[,colSums(!is.na(belief_clean)) > 0, drop=FALSE]

belief_clean <- belief_clean[,sapply(belief_clean, function(x){
  if(all(is.na(x))) return(FALSE)
  var(x, na.rm=TRUE) > 0
}), drop=FALSE]

if(ncol(belief_clean) >= 2){
  
  cor_matrix <- cor(belief_clean, use="pairwise.complete.obs")
  print(cor_matrix)
  
  corrplot::corrplot(cor_matrix, method="color")
  
}


if(ncol(belief_clean) >= 2){
  
  alpha_result <- psych::alpha(belief_clean)
  print(alpha_result)
  
}


reg_data <- data[,c("PBI","Belief_Q1","Belief_Q2","Belief_Q3","Belief_Q4","Belief_Q5")]

reg_data <- reg_data[complete.cases(reg_data),]

if(nrow(reg_data) > 5){
  
  model <- lm(PBI ~ Belief_Q1 + Belief_Q2 + Belief_Q3 +
                Belief_Q4 + Belief_Q5,
              data = reg_data)
  
  print(summary(model))
  
}


data$BeliefBinary <- ifelse(tolower(data$Belief)=="yes",1,0)

log_model <- glm(BeliefBinary ~ PBI + Gender + AgeGroup,
                 family="binomial",
                 data=data)

summary(log_model)


write.csv(data,"Paranormal_Analysis_Output.csv",row.names=FALSE)

writexl::write_xlsx(data,"Paranormal_Analysis_Output.xlsx")
