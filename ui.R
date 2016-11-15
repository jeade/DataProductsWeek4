library(shiny)

# Set up the shiny UI
shinyUI(pageWithSidebar(  
  headerPanel("Jeremy's FitBit Activity for Oct 2016"),  
  radioButtons("data", "Activity data:",
               c("Steps" = "3",
                 "Distance" = "4",
                 "Floors" = "5",
                 "Minutes.Sedentary" = "6",
                 "Minutes.Lightly.Active" = "7",
                 "Minutes.Fairly.Active" = "8",
                 "Minutes.Very.Active" = "9"
                 )), 
    mainPanel(plotOutput('myPlot')  
  )
))
