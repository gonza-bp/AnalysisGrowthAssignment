#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Analysis of tooth growth in Guinea Pigs"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
      sidebarPanel(
        h4("Overview"),
        helpText("This app allows to estimate the growth of the tooth of 
                 Guinea pig depending on the dose of Ascorbic Acid and 
                 the type of supplement used (Vitamin C or Orange Juice).
                 This estimation is based on a linear regression model obtained
                 from the dataset ToothGrowth available in R"),
        h4("Usage"),
        helpText("Select the type of supplement used to feed the Guinea Pig and 
                  then choose the dosage for that supplement in milligrams/day. On the right panel, you 
                 will see the regression model used for the prediction and the estimated length of the 
                 tooth for the chosen dosage"),
      selectInput("select", label = "Supplement type", 
                  choices = list("Vitamin C" = "VC", "Orange Juice" = "OJ"), 
                  selected = "VC"),
       sliderInput("dose",
                   "Dose in milligrams/day:",
                   min = 0,
                   max = 5,
                   value = 0.5,
                   step = 0.1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Expected growth using linear regression"),
      textOutput("prediction"),
      plotOutput('regression')
    )
  )
))
