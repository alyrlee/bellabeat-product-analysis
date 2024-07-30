install.packages('tidyverse')
library(tidyverse)

#library(readr)
dailyActivity_merged <- read_csv("Desktop/Data Analytics/bellabeat-product-analysis/data/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv")

View(dailyActivity_merged)
#daily_activity <- read.csv("dailyActivity_merged")

head(dailyActivity_merged)
colnames(dailyActivity_merged)

#Check for duplicates and NA
n_distinct(dailyActivity_merged$Id)

nrow(dailyActivity_merged)

# For the daily activity dataframe:
dailyActivity_merged %>% 
  select(TotalSteps,TotalDistance,SedentaryMinutes) %>% 
summary()

# What's the relationship between steps taken in a day and sedentary minutes? 
# How could this help inform the customer segments that we can market to? 

ggplot(data=dailyActivity_merged,aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()
