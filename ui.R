#ui.R
library(shiny)

# Define UI for Heart Rate Predictor
shinyUI(pageWithSidebar(
  
  #  Application title
  headerPanel("Exercise Intensity Heart Rate Predictor"),
  
    sidebarPanel(width = 9,
        # defining sliders
    sliderInput("Current_age", "Please enter your current age :", 
                min=0, max=130, value=25, post = " years old"),
    

    sliderInput("Exercise_intensity", "Please enter your desired exercise intensity:", 
                min=0, max=100, value=50, post = " % of maximal heart rate"),
    print("(Maximal Heart Rate for a given age can be obtained by setting the exercise intensity to 100 %)"),
    print("")    
    
  ),
  
  # Show a table summarizing the values entered
  mainPanel(width = 3,
    tableOutput("values"),
    
    print("At this age and exercise intensity,"),
    print("your targeted heart rate should not exceed :"),
    uiOutput("focal"),
    print("beats per minute"))
)
) 