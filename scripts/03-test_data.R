#### Preamble ####
# Purpose: Basic data integrity checks for datasets using tidyverse. This script first defines the check_lap_data function tailored to check for:
# - Check if all expected columns are present
# - Check for missing values in key columns
# - Check data types for each column
# - Check for unexpected values in 'Position' and 'Season'
# - Check for range of lap times in seconds
# Author: Michael Fang
# Date: 22 April 2024
# Contact: m.fang@mail.utoronto.ca
# License: MIT
# Prerequisites:
# - 01-download_data.R
# - 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)
library(stringr)

#### Test data ####

ver_jeddah_lap_data_2022 <- read_csv("data/analysis_data/verstappen_laps_jeddah_2022_cleaned.csv")
ver_jeddah_lap_data_2021 <- read_csv("data/analysis_data/verstappen_laps_jeddah_2021_cleaned.csv")
ham_jeddah_lap_data_2022 <- read_csv("data/analysis_data/hamilton_laps_jeddah_2022_cleaned.csv")
ham_jeddah_lap_data_2021 <- read_csv("data/analysis_data/hamilton_laps_jeddah_2021_cleaned.csv")
lec_jeddah_lap_data_2022 <- read_csv("data/analysis_data/leclerc_laps_jeddah_2022_cleaned.csv")
lec_jeddah_lap_data_2021 <- read_csv("data/analysis_data/leclerc_laps_jeddah_2021_cleaned.csv")
ver_dutch_lap_data_2022 <- read_csv("data/analysis_data/verstappen_laps_dutch_2022_cleaned.csv")
ver_dutch_lap_data_2021 <- read_csv("data/analysis_data/verstappen_laps_dutch_2021_cleaned.csv")
ham_dutch_lap_data_2022 <- read_csv("data/analysis_data/hamilton_laps_dutch_2022_cleaned.csv")
ham_dutch_lap_data_2021 <- read_csv("data/analysis_data/hamilton_laps_dutch_2021_cleaned.csv")
lec_dutch_lap_data_2022 <- read_csv("data/analysis_data/leclerc_laps_dutch_2022_cleaned.csv")
lec_dutch_lap_data_2021 <- read_csv("data/analysis_data/leclerc_laps_dutch_2021_cleaned.csv")

check_lap_data <- function(data, dataset_name) {
  cat("### Checks for", dataset_name, "###\n")
  
  # Check if all expected columns are present
  required_columns <- c("Driver", "Position", "Lap Time", "Lap #", "LapTime in Seconds", "Season")
  missing_columns <- setdiff(required_columns, names(data))
  if (length(missing_columns) > 0) {
    cat("Missing columns:", paste(missing_columns, collapse=", "), "\n")
  } else {
    cat("All expected columns are present.\n")
  }
  
  # Check for missing values in key columns
  missing_values <- sapply(data, function(x) sum(is.na(x)))
  cat("Missing values per column:\n")
  print(missing_values)
  
  # Check data types for each column
  cat("Data types for each column:\n")
  sapply(data, function(x) cat(class(x)[1], "\n"))
  
  # Check for unexpected values in 'Position' and 'Season'
  if("Position" %in% names(data)) {
    if(any(data$Position < 1 | data$Position > 3)) {
      cat("Invalid values found in Position column.\n")
    } else {
      cat("Position values are within expected range (1-3).\n")
    }
  }
  
  if("Season" %in% names(data)) {
    if(any(data$Season != 2021)) {
      cat("Unexpected year values in Season column.\n")
    } else {
      cat("Season column has consistent value of 2021.\n")
    }
  }
  
  # Check for range of lap times in seconds
  if("LapTime in Seconds" %in% names(data)) {
    lap_time_range <- range(data[["LapTime in Seconds"]], na.rm = TRUE)
    cat("Lap time in seconds range:", lap_time_range[1], "-", lap_time_range[2], "\n")
  } else {
    cat("LapTime in Seconds column missing.\n")
  }
  
  cat("\n")
}

check_lap_data(ver_jeddah_lap_data_2022, "Verstappen Lap Times Jeddah 2022")
check_lap_data(ver_jeddah_lap_data_2021, "Verstappen Lap Times Jeddah 2021")
check_lap_data(ham_jeddah_lap_data_2022, "Hamilton Lap Times Jeddah 2022")
check_lap_data(ham_jeddah_lap_data_2021, "Hamilton Lap Times Jeddah 2021")
check_lap_data(lec_jeddah_lap_data_2022, "Leclerc Lap Times Jeddah 2022")
check_lap_data(lec_jeddah_lap_data_2021, "Leclerc Lap Times Jeddah 2021")

check_lap_data(ver_dutch_lap_data_2022, "Verstappen Lap Times Dutch 2022")
check_lap_data(ver_dutch_lap_data_2021, "Verstappen Lap Times Dutch 2021")
check_lap_data(ham_dutch_lap_data_2022, "Hamilton Lap Times Dutch 2022")
check_lap_data(ham_dutch_lap_data_2021, "Hamilton Lap Times Dutch 2021")
check_lap_data(lec_dutch_lap_data_2022, "Leclerc Lap Times Dutch 2022")
check_lap_data(lec_dutch_lap_data_2021, "Leclerc Lap Times Dutch 2021")

