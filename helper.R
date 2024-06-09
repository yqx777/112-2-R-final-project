# 描述資料框 'data' -----

library(tidyverse)
library(lubridate)

describe_data <- function(df) {
  # 描述數據框的基本訊息
  num_rows <- nrow(df)
  num_cols <- ncol(df)
  
  overall_description <- list(
    total_rows = num_rows,
    total_columns = num_cols
  )
  
  column_descriptions <- lapply(names(df), function(col_name) {
    col_data <- df[[col_name]]
    num_missing <- sum(is.na(col_data))
    missing_ratio <- num_missing / num_rows
    
    if (is.numeric(col_data)) {
      description <- list(
        missing_values = num_missing,
        missing_ratio = missing_ratio,
        range = range(col_data, na.rm = TRUE),
        mean = mean(col_data, na.rm = TRUE),
        max = max(col_data, na.rm = TRUE),
        min = min(col_data, na.rm = TRUE),
        quantiles = quantile(col_data, na.rm = TRUE),
        median = median(col_data, na.rm = TRUE)
      )
    } else {
      unique_values <- unique(col_data)
      num_unique <- length(unique_values)
      
      if (num_unique < 10) {
        value_counts <- table(col_data, useNA = "ifany")
        value_ratios <- prop.table(value_counts)
        description <- list(
          missing_values = num_missing,
          missing_ratio = missing_ratio,
          value_counts = value_counts,
          value_ratios = value_ratios
        )
      } else {
        description <- list(
          missing_values = num_missing,
          missing_ratio = missing_ratio,
          num_unique_values = num_unique
        )
      }
    }
    
    return(description)
  })
  
  names(column_descriptions) <- names(df)
  
  description_list <- list(
    overall = overall_description,
    columns = column_descriptions
  )
  
  return(description_list)
}

