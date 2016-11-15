library(shiny)

# Set up the shiny server
shinyServer(  
  function(input, output) {    
    
    df <- getData()
    
    output$myPlot <- renderPlot({
      data <- as.integer(input$data)
      
      plot(df[,data],df[,2],col="blue",main=paste("Calories Burned vs ",names(df)[data]),xlab=names(df)[data],ylab="Calories Burned")
      abline(lm(df[,2]~df[,data]),col="red")
    })
    }
)

# Get data exported from FitBit
getData <- function()
{
  require(lubridate)
  
  file_name <- "fitbit_export_20161113.csv"
  
  df <- read.csv(file=file_name,stringsAsFactors = FALSE)
  
  df$Calories.Burned <- as.numeric(gsub(",","",df$Calories.Burned))
  df$Steps <- as.numeric(gsub(",","",df$Steps))
  df$Minutes.Sedentary <- as.numeric(gsub(",","",df$Minutes.Sedentary))
  df$Activity.Calories <- as.numeric(gsub(",","",df$Activity.Calories))
  
  df$Date <- mdy(df$Date)
  
  return(df) 
}