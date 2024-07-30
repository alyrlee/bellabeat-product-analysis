read_csv("/Users/ashley/Desktop/Data Analytics/bellabeat-product-analysis/data/mturkfitbit_export_4.12.16-5.12.16/Fitabase Data 4.12.16-5.12.16")

install.packages("here")
install.packages("skimr")
install.packages("janitor")

library("here")
library("skimr")
library("janitor")

clean_names(dailyActivity_merged)

clean_names(dailyCalories_merged)

clean_names(dailyIntensities_merged)

clean_names(dailySteps_merged)

clean_names(heartrate_seconds_merged)

clean_names(hourlyCalories_merged)

clean_names(minuteCaloriesNarrow_merged)

clean_names(minuteIntensitiesWide_merged)

clean_names(minuteMETsNarrow_merged)

clean_names(minuteSleep_merged)

clean_names(minuteStepsNarrow_merged)

clean_names(minuteStepsWide_merged)

clean_names(sleepDay_merged)

clean_names(weightLogInfo_merged)

