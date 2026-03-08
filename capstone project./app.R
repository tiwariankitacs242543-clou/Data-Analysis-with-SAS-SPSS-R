library(shiny)
library(dplyr)
library(ggplot2)

data <- read.csv(file.choose(), stringsAsFactors = FALSE)

names(data)[2] <- "AgeGroup"
names(data)[3] <- "Gender"

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

ui <- fluidPage(
  
  titlePanel("Paranormal Belief & Cognitive Bias Dashboard"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput("gender",
                  "Select Gender",
                  choices = c("All", levels(data$Gender))),
      
      selectInput("age",
                  "Select Age Group",
                  choices = c("All", levels(data$AgeGroup)))
      
    ),
    
    mainPanel(
      
      tabsetPanel(
        
        tabPanel("PBI Distribution",
                 plotOutput("hist")),
        
        tabPanel("Gender Comparison",
                 plotOutput("box1")),
        
        tabPanel("Age Comparison",
                 plotOutput("box2"))
        
      )
    )
  )
)


server <- function(input, output) {
  
  filtered_data <- reactive({
    
    df <- data
    
    if(input$gender != "All"){
      df <- df[df$Gender == input$gender,]
    }
    
    if(input$age != "All"){
      df <- df[df$AgeGroup == input$age,]
    }
    
    df
  })
  
  # Histogram
  
  output$hist <- renderPlot({
    
    ggplot(filtered_data(), aes(x = PBI)) +
      geom_histogram(fill="purple", bins=20) +
      theme_minimal() +
      labs(
        title="Distribution of Paranormal Belief Index",
        x="Belief Score",
        y="Frequency"
      )
    
  })
  
  # Gender Boxplot
  
  output$box1 <- renderPlot({
    
    ggplot(filtered_data(), aes(x=Gender,y=PBI))+
      geom_boxplot(fill="green")+
      theme_minimal()+
      labs(
        title="Paranormal Belief Index by Gender",
        x="Gender",
        y="Belief Score"
      )
    
  })
  
  # Age Boxplot
  
  output$box2 <- renderPlot({
    
    ggplot(filtered_data(), aes(x=AgeGroup,y=PBI))+
      geom_boxplot(fill="orange")+
      theme_minimal()+
      labs(
        title="Paranormal Belief Index by Age Group",
        x="Age Group",
        y="Belief Score"
      )
    
  })
  
}


shinyApp(ui = ui, server = server)