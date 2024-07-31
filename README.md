# Google Analytics, Capstone: How Can a Wellness Technology Company Play It Smart?
## Introduction
In this case study, I will perform real-world analysis at a fictional company, Bellabeat, a high-tech manufacturer of health-focused products for women using R and Tableau.

### Data Source
[FitBit Fitness Tracker Data](https://www.kaggle.com/datasets/arashnic/fitbit) (CC0: Public Domain, dataset made available through Mobius): This Kaggle data set contains personal fitness trackers from thirty Fitbit users.

### Scenario
You are a junior data analyst working on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for women. Bellabeat is a successful small company, but they have the potential to become a larger player in the global [smart device](https://en.wikipedia.org/wiki/Smart_device) market. Urška Sršen, co-founder and Chief Creative Officer of Bellabeat, believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. You have been asked to focus on one of Bellabeat’s products and analyze smart device data to gain insight into how consumers are using their smart devices. The insights you discover will then help guide the company's marketing strategy. You will present your analysis to the Bellabeat executive team along with your high-level recommendations for Bellabeat’s marketing strategy.

### Background
Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused smart products. Sršen used her background as an artist to develop beautifully designed technology that informs and inspires women around the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women.

## Ask
## Business Task
Analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart devices.

### Analysis Questions
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

## Data Preparation 
1. Load CVS files
Remember to upload your CSV files to your project from the relevant data source:
https://www.kaggle.com/arashnic/fitbit

``` r
daily_activity <- read.csv("dailyActivity_merged.csv")
```

Repeat this step for all csv files

2. Load and install common packages and libraries 
   ```r
   #set working directory
   #setwd("~/Fitbit Case Study")
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
```r
head(daily_activity)
```

Identify all the columns in the daily_activity data.
```r
colnames(daily_activity)
```

Take a look at the sleep_day data.
```r
head(sleep_day)
```

Identify all the columns in the daily_activity data.
```r
colnames(sleep_day)
```

## Data Summary Statistics

1.  How many unique participants are there in each dataframe? 
It looks like there may be more participants in the daily activity dataset than the sleep dataset.

```r
n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)
n_distinct(calries$Id)
n_distinct(sleep$Id)
n_distinct(weight$Id)
```
33

24

33

33

8

2. How many observations are there in each dataframe?

```r
nrow(daily_activity)
nrow(sleep_day)
```
3. Summary statistics for dailyActivity, sleepDay, hourlySteps, and weightInfo

```r
dailyActivity_merged %>% 
  select(TotalSteps,
         TotalDistance,
         VeryActiveMinutes,
         FairlyActiveMinutes,
         LightlyActiveMinutes,
         SedentaryMinutes,
         Calories) %>% 
  summary()
```
![Screenshot 2024-07-31 at 3 35 22 PM](https://github.com/user-attachments/assets/17a380cb-78ab-4c64-a041-53a6f2ca430d)

```r
sleepDay_merged %>% 
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>% 
  summary()
```
![Screenshot 2024-07-31 at 3 36 11 PM](https://github.com/user-attachments/assets/cf075fcf-26e3-4370-a87e-752740ccc44e)

```r
hourlySteps_merged %>% 
  select(ActivityHour,
         StepTotal) %>% 
  summary()
```
![Screenshot 2024-07-31 at 3 36 22 PM](https://github.com/user-attachments/assets/7424ec6a-bf44-49ba-a4c3-4e00e0f16716)

```r
weightLogInfo_merged %>% 
  select(WeightPounds,
         Fat,
         BMI) %>% 
summary()
```
![Screenshot 2024-07-31 at 3 36 35 PM](https://github.com/user-attachments/assets/87f6f25f-b3ef-4ef6-9d03-0a02ace429f3)

## What are some quick summary statistics we'd want to know about each data frame?
  
# Daily activity dataframe:
```r
daily_activity %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes) %>%
  summary()
```
# Percentage of Activity Types
```r
# Summarize the total minutes spent on different activities
activity_summary <- dailyActivity_merged %>%
  summarise(
    TotalSedentaryMinutes = sum(SedentaryMinutes),
    TotalLightlyActiveMinutes = sum(LightlyActiveMinutes),
    TotalFairlyActiveMinutes = sum(FairlyActiveMinutes),
    TotalVeryActiveMinutes = sum(VeryActiveMinutes)
  )

# Convert the data to long format for easier plotting
activity_long <- activity_summary %>%
  pivot_longer(
    cols = everything(),
    names_to = "ActivityType",
    values_to = "Minutes"
  )

# Calculate the percentage of each activity type
activity_long <- activity_long %>%
  mutate(Percentage = Minutes / sum(Minutes) * 100)

# Define high contrast colors
high_contrast_colors <- c("#FFFF00", "#008000", "#FFA500", "#FF0000")

# Create the pie chart with custom colors and percentage labels
pie_chart <- ggplot(activity_long, aes(x = "", y = Percentage, fill = ActivityType)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  coord_polar("y") +
  theme_void() +
  scale_fill_manual(values = high_contrast_colors) +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), 
            position = position_stack(vjust = 0.5)) +
  labs(title = "Percentage of Activity Types")

# Display the pie chart
print(pie_chart)
```
![image](https://github.com/user-attachments/assets/9a52b1bf-d71d-4df2-b948-a5bf8cb8c7b9)


```r
## Id ActivityDate TotalSteps TotalDistance TrackerDistance
## 1 1503960366 4/12/2016         13162          8.5             8.5 
## 2 1503960366 4/13/2016         10735          6.97            6.97
## 3 1503960366 4/14/2016         10460          6.74            6.74
## 4 1503960366 4/15/2016          9762          6.28            6.28
## 5 1503960366 4/16/2016         12669          8.16            8.16
## 6 1503960366 4/17/2016          9705          6.48            6.48
```

### Sleep dataframe:

```r
sleep_day %>%  
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()
```
```r
 ## TotalSleepRecords TotalMinutesAsleep TotalTimeInBed 
 ## Min.   :1.000     Min.   : 58.0      Min.   : 61.0  
 ## 1st Qu.:1.000     1st Qu.:361.0      1st Qu.:403.0  
 ## Median :1.000     Median :433.0      Median :463.0  
 ## Mean   :1.119     Mean   :419.5      Mean   :458.6  
 ## 3rd Qu.:1.000     3rd Qu.:490.0      3rd Qu.:526.0  
 ## Max.   :3.000     Max.   :796.0      Max.   :961.0 

```

What does this tell us about how this sample of people's activities? 

### Data Plots

What's the relationship between steps taken in a day and sedentary minutes? 
How could this help inform the customer segments that we can market to? 
E.g. position this more as a way to get started in walking more? 
Or to measure steps that you're already taking?

```r
ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()
```
![dataframe_daily_activities](https://github.com/user-attachments/assets/ed5ea077-21ad-4a60-8f20-e8351c72d2a0)

```r
```
What's the relationship between minutes asleep and time in bed? 
You might expect it to be almost completely linear - are there any unexpected trends?
  
```r
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()
```
![dataframe_sleepDay](https://github.com/user-attachments/assets/851ddfe1-6b8b-4c4c-9499-c6a8d0e94fa5)

```r

What could these trends tell you about how to help market this product? Or areas where you might want to explore further?

### Summary statistics and merged data:
```r
combined_data <- merge(sleep_day, daily_activity, by="Id")
```

Relationship between minutes and time in bed
![image](https://github.com/user-attachments/assets/3374a823-0270-4301-9617-df792a5e05d6)

Relationship between steps taken in a day and sedentary minutes
![image](https://github.com/user-attachments/assets/30a3a540-d0e5-4601-860f-a906f62c869e)

```r
ggplot(data=dailyActivity_merged, aes(x=TotalSteps, y=SedentaryMinutes)) + 
  geom_point() + 
  geom_smooth() + 
  labs(title="Total Steps vs. Sedentary Minutes",
       x = "Steps", y = "Minutes")
```

![image](https://github.com/user-attachments/assets/66c30c8e-cad8-4a63-aa66-ce3c2ea23382)


## Process
R Studio is used to upload the dataset, format, clean, and prepare data to be loaded into Tableau

### R Visualization in Tableau 
