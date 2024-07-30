# Google Analytics, Capstone: How Can a Wellness Technology Company Play It Smart?
## Introduction
In this case study, I will perform real-world analysis at a fictional company, Bellabeat, a high-tech manufacturer of health-focused products for women using BigQury, R and Tableau.

### Data Source
[FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) (CC0: Public Domain, dataset made available through Mobius): This Kaggle data set contains personal tness trackers from thirty fittbit users.

### Scenraio
You are a junior data analyst working on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for women. Bellabeat is a successful small company, but they have the potential to become a larger player in the global [smart device](https://en.wikipedia.org/wiki/Smart_device) market. Urška Sršen, co-founder and Chief Creative Officer of Bellabeat, believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. You have been asked to focus on one of Bellabeat’s products and analyze smart device data to gain insight into how consumers are using their smart devices. The insights you discover will then help guide the company's marketing strategy. You will present your analysis to the Bellabeat executive team along with your high-level recommendations for Bellabeat’s marketing strategy.

### Background
Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused sma products. Sršen used her background as an artist to develop beautifully designed technology that informs and inspires women around the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.

## Ask
## Business Task
analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat sma devices.
### Analysis Questions
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

## Data Preparation 
1. Load CVS files
Remember to upload your CSV files to your project from the relevant data source:
https://www.kaggle.com/arashnic/fitbit

```daily_activity <- read.csv("dailyActivity_merged.csv")```

Repeat this step for all csv files

2. Load and install common packages and libraries 
   ```
   #set working directory
   #setwd("~/Fitbit Case Study
   #install.packages('tidyverse')
   #install.packages('skimr')
   library(tidyverse) #wrangle data
   library(dplyr) #clean data
   library(skimr) #get summary data
   library(ggplot2) #visualize data
   library(readr) #save csv 
   ``` 
### Data Exploration
Explore a few key tables

 Take a look at the daily_activity data.
```head(daily_activity)```

Identify all the columns in the daily_activity data.
```colnames(daily_activity)```


Take a look at the sleep_day data.
```head(sleep_day)```

Identify all the columns in the daily_activity data.
```colnames(sleep_day)```

## Data Summary Statistics

1.  How many unique participants are there in each dataframe? 
It looks like there may be more participants in the daily activity dataset than the sleep dataset.

```n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)```


2. How many observations are there in each dataframe?

```nrow(daily_activity)
nrow(sleep_day)```


# What are some quick summary statistics we'd want to know about each data frame?
  
# For the daily activity dataframe:
```daily_activity %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes) %>%
  summary()```


# For the sleep dataframe:

```sleep_day %>%  
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()```


# What does this tell us about how this sample of people's activities? 
### Data Plots
# What's the relationship between steps taken in a day and sedentary minutes? 
# How could this help inform the customer segments that we can market to? 
# E.g. position this more as a way to get started in walking more? 
# Or to measure steps that you're already taking?

```ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()```


# What's the relationship between minutes asleep and time in bed? 
# You might expect it to be almost completely linear - are there any unexpected trends?
  

```ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()```


# What could these trends tell you about how to help market this product? Or areas where you might want to explore further?

### Summary statistics and merged data:
```combined_data <- merge(sleep_day, daily_activity, by="Id")```

# Take a look at how many participants are in this data set.
```n_distinct(combined_data$Id)```


## Process
BigQuery is used to upload the dataset, format, clean, and prepare data to be loaded into R.
Data is imported into R, cleaned, transformed, and summary statistics. 

```

```

### Combining the Data
Data is combined and loaded into R for visualization
### Data Exploration

### Data Cleaning

## Analyze and Share 
