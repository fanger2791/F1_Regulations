#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)

#### Clean data ####

# Read in DataSets
raw_ver_jeddah_2022 <- read_csv("data/raw_data/verstappen_laps_jeddah.csv")
raw_ver_jeddah_2021 <- read_csv("data/raw_data/verstappen_laps_jeddah_2021.csv")
raw_ham_jeddah_2022 <- read_csv("data/raw_data/hamilton_laps_jeddah.csv")
raw_ham_jeddah_2021 <- read_csv("data/raw_data/hamilton_laps_jeddah_2021.csv")
raw_lec_jeddah_2022 <- read_csv("data/raw_data/leclerc_laps_jeddah.csv")
raw_lec_jeddah_2021 <- read_csv("data/raw_data/leclerc_laps_jeddah_2021.csv")


#### Clean Verstappen Jeddah 2022 DataSet ####

# Check structure
str(raw_ver_jeddah_2022)
# Convert time_sec to numeric
raw_ver_jeddah_2022 <- raw_ver_jeddah_2022 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ver_jeddah_2022 <- filter(raw_ver_jeddah_2022, time_sec < 100)
#Remove rows with missing values
raw_ver_jeddah_2022 <- drop_na(raw_ver_jeddah_2022)
raw_ver_jeddah_2022 <- raw_ver_jeddah_2022 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Verstappen Jeddah 2021 DataSet ####

# Check structure
str(raw_ver_jeddah_2021)
# Convert time_sec to numeric
raw_ver_jeddah_2021 <- raw_ver_jeddah_2021 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ver_jeddah_2021 <- filter(raw_ver_jeddah_2021, time_sec < 100)
#Remove rows with missing values
raw_ver_jeddah_2021 <- drop_na(raw_ver_jeddah_2021)
raw_ver_jeddah_2021 <- raw_ver_jeddah_2021 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Hamilton Jeddah 2022 DataSet ####

# Check structure
str(raw_ham_jeddah_2022)
# Convert time_sec to numeric
raw_ham_jeddah_2022 <- raw_ham_jeddah_2022 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ham_jeddah_2022 <- filter(raw_ham_jeddah_2022, time_sec < 100)
#Remove rows with missing values
raw_ham_jeddah_2022 <- drop_na(raw_ham_jeddah_2022)
raw_ham_jeddah_2022 <- raw_ham_jeddah_2022 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Hamilton Jeddah 2021 DataSet ####

# Check structure
str(raw_ham_jeddah_2021)
# Convert time_sec to numeric
raw_ham_jeddah_2021 <- raw_ham_jeddah_2021 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ham_jeddah_2021 <- filter(raw_ham_jeddah_2021, time_sec < 100)
#Remove rows with missing values
raw_ham_jeddah_2021 <- drop_na(raw_ham_jeddah_2021)
raw_ham_jeddah_2021 <- raw_ham_jeddah_2021 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Leclerc Jeddah 2022 DataSet ####





#### Save data ####
write_csv(raw_ver_jeddah_2022, "data/analysis_data/verstappen_laps_jeddah_2022_cleaned.csv")
write_csv(raw_ver_jeddah_2021, "data/analysis_data/verstappen_laps_jeddah_2021_cleaned.csv")
write_csv(raw_ham_jeddah_2022, "data/analysis_data/hamilton_laps_jeddah_2022_cleaned.csv")
write_csv(raw_ham_jeddah_2021, "data/analysis_data/hamilton_laps_jeddah_2021_cleaned.csv")

