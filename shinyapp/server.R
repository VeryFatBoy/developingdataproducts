# Load libraries
library(shiny)
library(DT)

# Set numeric display
options(scipen = 10)

# Load the house data
filename <- "kc_house_data_small.csv"
inputdata <- read.csv(filename, header = TRUE, sep = ",")
housedata <- data.frame(inputdata)

# Server logic required to plot various variables against house prices
shinyServer(function(input, output) {
  
  # Where the magic happens
  formulaText <- reactive({
    paste("housedata$price ~ housedata$", input$compare)
    })

  # Boxplot output
  output$plot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = housedata,
            outline = input$outliers,
            xlab = input$compare,
            ylab = "Price ($)",
            col = "turquoise")
  })

  # Linear Regression output
  output$regression <- renderPlot({
    par(mfrow = c(2, 2))
    plot(lm(as.formula(formulaText())))
    })

  # Summary output
  output$summary <- renderPrint({
    summary(housedata)
  })
  
  # Table output
  output$table <- DT::renderDataTable({
    housedata
  },
  options = list(lengthMenu = c(10, 20, 30),
                 pageLength = 10)
  )
  })