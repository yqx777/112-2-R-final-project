install.packages("tidyverse")

data <- read_csv("111oversea_APP1.csv")
print(data)

source("helper.R")

asia_data |> describe_data() -> result_asia


library(dplyr)
計算亞洲海外海外學生來台就讀大學校院的人數
asia_data <- data %>%
  filter(洲別 == "亞洲")
total_asian_university_enrollment <- sum(asia_data$大學校院, na.rm = TRUE)
total_asian_university_enrollment

計算亞洲海外學生來台就讀大學校院占比
asia_university_data <- data %>%
  filter(洲別 == "亞洲")
total_asian_university_enrollment <- sum(asia_university_data$大學校院, na.rm = TRUE)
total_university_enrollment <- sum(data$大學校院, na.rm = TRUE)
asia_proportion <- total_asian_university_enrollment / total_university_enrollment
asia_proportion <- (total_asian_university_enrollment / total_university_enrollment) * 100
asia_proportion

計算亞洲海外學生來台就讀高級中等學校的人數
asia_data <- data %>%
  filter(洲別 == "亞洲")
total_asian_university_enrollment <- sum(asia_data$高級中等學校, na.rm = TRUE)
total_asian_university_enrollment

計算亞洲海外學生來台就讀高級中等學校占比
asia_university_data <- data %>%
  filter(洲別 == "亞洲")
total_asian_university_enrollment <- sum(asia_university_data$高級中等學校, na.rm = TRUE)
total_university_enrollment <- sum(data$高級中等學校, na.rm = TRUE)
asia_proportion <- total_asian_university_enrollment / total_university_enrollment
asia_proportion <- (total_asian_university_enrollment / total_university_enrollment) * 100
asia_proportion







source("helper.R")

asia_data |> describe_data() -> result_asia
