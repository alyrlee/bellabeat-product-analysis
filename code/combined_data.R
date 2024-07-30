sleepDay_dailyActivity_combined_data <-merge(sleepDay_merged, dailyActivity_merged,by="Id")
n_distinct(sleepDay_dailyActivity_combined_data$Id)

view(sleepDay_dailyActivity_combined_data)

hourlySteps_weightLogInfo_combined_data <-merge(hourlySteps_merged, weightLogInfo_merged, by="Id")
n_distinct(hourlySteps_weightLogInfo_combined_data$Id)

view(hourlySteps_weightLogInfo_combined_data)

#merge data frames by ID
all_combined_data <-merge(sleepDay_dailyActivity_combined_data,hourlySteps_weightLogInfo_combined_data,by="Id" )
n_distinct(all_combined_data$Id)
view(all_combined_data)


#Check for duplicates and NA
sum(is.na(sleepDay_dailyActivity_combined_data))
