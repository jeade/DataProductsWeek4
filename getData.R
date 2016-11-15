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