# Load libraries
library(shiny)

# UI for house prices application
shinyUI(pageWithSidebar(

  # Title
  headerPanel("Seattle House Prices"),

  sidebarPanel(
    img(src = "old-english-house.jpg"),
    p("Image credit: Petr Kratochvil"),
    
    br(),

    radioButtons("compare", "Compare Seattle house prices against:",
                 list("Number of Bedrooms" = "bedrooms",
                      "Number of Bathrooms" = "bathrooms",
                      "Square Feet" = "sqft_living",
                      "Condition (1-5, higher is better)" = "condition",
                      "Year Built" = "yr_built",
                      "Zipcode" = "zipcode")
                 ),
    
    checkboxInput("outliers", "Show outliers", FALSE)
    
    ),

  # Four tabs to show plot, summary, table and linear regression
  mainPanel(
    tabsetPanel(
      tabPanel("Welcome!",
               br(),
               p("This is a house prices exploratory data analysis application."),
               p("The data were taken from a subset of houses for the Seattle area, as used in the",
                 strong("Coursera Machine Learning Specialization")),
               p("This application consists of 6 tabs (above):"),
               tags$ul(
                 tags$li(strong("Welcome!"),
                         p("This is the welcome screen you are now reading.")),
                 tags$li(strong("Summary"),
                         p("This provides a summary of the data read from the input file.")),
                 tags$li(strong("Table"),
                         p("This presents the data from the input file in a tabular format that can also be searched.")),
                 tags$li(strong("Plot"),
                         p("This enables you to plot house prices against various options, as shown on the left-hand side."),
                         p("These options include:", em("Number of Bedrooms, Number of Bathrooms, Square Feet, Condition (1-5, higher is better), Year Built and Zipcode")),
                         p("The plot excludes outliers by default, but you can choose to view outliers by selecting the check-box."),
                         p("The plot is automatically updated, based upon the radio-button and check-box selections.")),
                 tags$li(strong("Simple Linear Regression"),
                         p("This perfoms a simple linear regression comparing house prices against the selected option on the left-hand side.")),
                 tags$li(strong("About"),
                         p("This contains a link to the github repo for the shiny application source code."))
                 )
               ),
      tabPanel("Summary", verbatimTextOutput("summary")),
      tabPanel("Table", dataTableOutput("table")),
      tabPanel("Plot", plotOutput("plot")),
      tabPanel("Simple Linear Regression", plotOutput("regression")),
      tabPanel("About",
               br(),
               p("This application was developed by ", strong("VeryFatBoy"))
               )
      )
    )
  )
  )