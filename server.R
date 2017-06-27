#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$prediction <- renderText({ 
  data=subset(ToothGrowth,supp==input$select)
  model<-lm(len~dose,data)
  new <- data.frame(dose = input$dose )
  value<-predict(model,new)
  paste("The predicted length for the tooth is:",value)
  })
  output$regression <- renderPlot({
    data=subset(ToothGrowth,supp==input$select)
    library(ggplot2)
    ggplot(data, aes(x=dose, y=len)) +
      geom_point(shape=1) +    # Use hollow circles
      geom_smooth(method=lm,   # Add linear regression line
                  se=FALSE)    # Don't add shaded confidence region
    
    
  })
})
