sleepDay_dailyActivity_combined_data <-merge(sleepDay_merged, dailyActivity_merged,by="Id")

n_distinct(sleepDay_dailyActivity_combined_data$Id)

View(sleepDay_dailyActivity_combined_data)

write_csv(sleepDay_dailyActivity_combined_data,"sleep_merged_data.csv")

hourlySteps_weightLogInfo_combined_data <-merge(hourlySteps_merged, weightLogInfo_merged, by="Id")
n_distinct(hourlySteps_weightLogInfo_combined_data$Id)

View(hourlySteps_weightLogInfo_combined_data)

write.csv(hourlySteps_weightLogInfo_combined_data, "hourlySteps_weightInfo_merged.csv")

#merge data frames by ID
all_combined_data <-merge(sleepDay_dailyActivity_combined_data,hourlySteps_weightLogInfo_combined_data,by="Id" )
n_distinct(all_combined_data$Id)
View(all_combined_data)


#Check for duplicates and NA
sum(is.na(sleepDay_dailyActivity_combined_data))
write_csv(all_combined_data, "merged_data.csv")
