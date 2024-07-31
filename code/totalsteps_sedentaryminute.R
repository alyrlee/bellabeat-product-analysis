ggplot(data=dailyActivity_merged, aes(x=TotalSteps, y=SedentaryMinutes)) + 
  geom_point() + 
  geom_smooth() + 
  labs(title="Total Steps vs. Sedentary Minutes",
       x = "Steps", y = "Minutes")