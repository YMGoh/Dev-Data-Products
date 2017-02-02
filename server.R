#server.R
library(shiny)

shinyServer(function(input, output) {
  
  # Reactive expression to build a data frame cfor all the values
  sliderValues <- reactive({
    
    # extracting the values for age and load from user inputs
    data.frame(
      Name = c("Current_age", "Exercise_intensity"),
      
      Value = c(input$Current_age,
                input$Exercise_intensity),
      
      stringsAsFactors=FALSE)
  })
  
  # calculation using the MHR formula from Tanaka et al., 2001
  # Load factor is incorporated in this calculation, but not in the original Tanaka formula 
  
  f <- function(Current_age, Exercise_intensity) {
    (208 - (0.7*Current_age)) * (Exercise_intensity/100)
  }
  
  
  # Show the values using an HTML table
  output$values <- renderTable(bordered = TRUE, spacing = c("l"), colnames = FALSE, {
    sliderValues()
  })
  
  # Show the final calculated value 
  output$focal <- renderText(
    {f(input$Current_age, input$Exercise_intensity)}
  )
})