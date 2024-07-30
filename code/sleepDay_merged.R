install.packages('tidyverse')
library(tidyverse)
library(readr)
sleepDay_merged <- read_csv("Desktop/Data Analytics/bellabeat-product-analysis/data/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")

View(sleepDay_merged)

head(sleepDay_merged)

colnames(sleepDay_merged)

n_distinct(sleepDay_merged$Id)

nrow(sleepDay_merged)

# For the sleep dataframe:
sleepDay_merged %>% 
  select(TotalSleepRecords,TotalMinutesAsleep,TotalTimeInBed) %>% 
summary()

# What's the relationship between minutes asleep and time in bed? 
# You might expect it to be almost completely linear - are there any unexpected trends?

ggplot(data=sleepDay_merged, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()
