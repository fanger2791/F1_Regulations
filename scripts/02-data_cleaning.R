#### Preamble ####
# Purpose: Cleans the raw F1 data
# Author: Michael Fang
# Date: 22 April 2024
# Contact: m.fang@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)
library(stringr)

#### Clean data ####

# Read in DataSets
raw_standings_2022 <- read_csv("data/raw_data/standings_2022.csv")
raw_standings_2021 <- read_csv("data/raw_data/standings_2021.csv")
raw_ver_jeddah_2022 <- read_csv("data/raw_data/verstappen_laps_jeddah.csv")
raw_ver_jeddah_2021 <- read_csv("data/raw_data/verstappen_laps_jeddah_2021.csv")
raw_ham_jeddah_2022 <- read_csv("data/raw_data/hamilton_laps_jeddah.csv")
raw_ham_jeddah_2021 <- read_csv("data/raw_data/hamilton_laps_jeddah_2021.csv")
raw_lec_jeddah_2022 <- read_csv("data/raw_data/leclerc_laps_jeddah.csv")
raw_lec_jeddah_2021 <- read_csv("data/raw_data/leclerc_laps_jeddah_2021.csv")

raw_ver_dutch_2022 <- read_csv("data/raw_data/verstappen_laps_dutch.csv")
raw_ver_dutch_2021 <- read_csv("data/raw_data/verstappen_laps_dutch_2021.csv")
raw_ham_dutch_2022 <- read_csv("data/raw_data/hamilton_laps_dutch.csv")
raw_ham_dutch_2021 <- read_csv("data/raw_data/hamilton_laps_dutch_2021.csv")
raw_lec_dutch_2022 <- read_csv("data/raw_data/leclerc_laps_dutch.csv")
raw_lec_dutch_2021 <- read_csv("data/raw_data/leclerc_laps_dutch_2021.csv")


#### Clean Standings 2022 DataSet ####
raw_standings_2022 <- raw_standings_2022 %>%
  mutate(driver_id = str_replace_all(driver_id, "_", " "),
         constructor_id = str_replace_all(constructor_id, "_", " ")) %>%
  mutate(driver_id = str_to_title(driver_id),
         constructor_id = str_to_title(constructor_id))

raw_standings_2022 <- raw_standings_2022 %>%
  rename(Driver = driver_id,`Position`= position, `Points` = points, `Wins`= wins, `Constructors`= constructor_id)

#### Clean Standings 2021 DataSet ####

raw_standings_2021 <- raw_standings_2021 %>%
  mutate(driver_id = str_replace_all(driver_id, "_", " "),
         constructor_id = str_replace_all(constructor_id, "_", " ")) %>%
  mutate(driver_id = str_to_title(driver_id),
         constructor_id = str_to_title(constructor_id))

raw_standings_2021 <- raw_standings_2021 %>%
  rename(Driver = driver_id,`Position`= position, `Points` = points, `Wins`= wins, `Constructors`= constructor_id)

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

# Check structure
str(raw_lec_jeddah_2022)
# Convert time_sec to numeric
raw_lec_jeddah_2022 <- raw_lec_jeddah_2022 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_lec_jeddah_2022 <- filter(raw_lec_jeddah_2022, time_sec < 100)
#Remove rows with missing values
raw_lec_jeddah_2022 <- drop_na(raw_lec_jeddah_2022)
raw_lec_jeddah_2022 <- raw_lec_jeddah_2022 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Leclerc Jeddah 2021 DataSet ####

# Check structure
str(raw_lec_jeddah_2021)
# Convert time_sec to numeric
raw_lec_jeddah_2021 <- raw_lec_jeddah_2021 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_lec_jeddah_2021 <- filter(raw_lec_jeddah_2021, time_sec < 100)
#Remove rows with missing values
raw_lec_jeddah_2021 <- drop_na(raw_lec_jeddah_2021)
raw_lec_jeddah_2021 <- raw_lec_jeddah_2021 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Verstappen Dutch 2022 DataSet ####

# Check structure
str(raw_ver_dutch_2022)
# Convert time_sec to numeric
raw_ver_dutch_2022 <- raw_ver_dutch_2022 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ver_dutch_2022 <- filter(raw_ver_dutch_2022, time_sec < 100)
#Remove rows with missing values
raw_ver_dutch_2022 <- drop_na(raw_ver_dutch_2022)
raw_ver_dutch_2022 <- raw_ver_dutch_2022 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Verstappen Dutch 2021 DataSet ####

# Check structure
str(raw_ver_dutch_2021)
# Convert time_sec to numeric
raw_ver_dutch_2021 <- raw_ver_dutch_2021 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ver_dutch_2021 <- filter(raw_ver_dutch_2021, time_sec < 100)
#Remove rows with missing values
raw_ver_dutch_2021 <- drop_na(raw_ver_dutch_2021)
raw_ver_dutch_2021 <- raw_ver_dutch_2021 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Hamilton Dutch 2022 DataSet ####

# Check structure
str(raw_ham_dutch_2022)
# Convert time_sec to numeric
raw_ham_dutch_2022 <- raw_ham_dutch_2022 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ham_dutch_2022 <- filter(raw_ham_dutch_2022, time_sec < 100)
#Remove rows with missing values
raw_ham_dutch_2022 <- drop_na(raw_ham_dutch_2022)
raw_ham_dutch_2022 <- raw_ham_dutch_2022 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Hamilton Dutch 2021 DataSet ####

# Check structure
str(raw_ham_dutch_2021)
# Convert time_sec to numeric
raw_ham_dutch_2021 <- raw_ham_dutch_2021 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_ham_dutch_2021 <- filter(raw_ham_dutch_2021, time_sec < 100)
#Remove rows with missing values
raw_ham_dutch_2021 <- drop_na(raw_ham_dutch_2021)
raw_ham_dutch_2021 <- raw_ham_dutch_2021 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Leclerc Dutch 2022 DataSet ####

# Check structure
str(raw_lec_dutch_2022)
# Convert time_sec to numeric
raw_lec_dutch_2022 <- raw_lec_dutch_2022 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_lec_dutch_2022 <- filter(raw_lec_dutch_2022, time_sec < 100)
#Remove rows with missing values
raw_lec_dutch_2022 <- drop_na(raw_lec_dutch_2022)
raw_lec_dutch_2022 <- raw_lec_dutch_2022 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)

#### Clean Leclerc Dutch 2021 DataSet ####

# Check structure
str(raw_lec_dutch_2021)
# Convert time_sec to numeric
raw_lec_dutch_2021 <- raw_lec_dutch_2021 %>%
  mutate(time_sec = as.numeric(time_sec), 
         season = as.factor(season))
#Assuming laps over 100 seconds are due to errors or non-racing reasons (pitstops):
raw_lec_dutch_2021 <- filter(raw_lec_dutch_2021, time_sec < 100)
#Remove rows with missing values
raw_lec_dutch_2021 <- drop_na(raw_lec_dutch_2021)
raw_lec_dutch_2021 <- raw_lec_dutch_2021 %>%
  rename(Driver = driver_id,`Position`= position, `Lap Time` = time, `Lap #`= lap, `LapTime in Seconds`= time_sec, `Season` = season)



#### Save data ####

# Becase of errors that occur when trying to save files as parquet, the files will not be saved as parquet format.
# Error that Occurs:
# Error in parquet___WriterProperties___Builder__create() : 
# Cannot call parquet___WriterProperties___Builder__create(). See https://arrow.apache.org/docs/r/articles/install.html for help installing Arrow C++ libraries. 

write_csv(raw_standings_2022, "data/analysis_data/standings_2022_cleaned.csv")
write_csv(raw_standings_2021, "data/analysis_data/standings_2021_cleaned.csv")

write_csv(raw_ver_jeddah_2022, "data/analysis_data/verstappen_laps_jeddah_2022_cleaned.csv")
write_csv(raw_ver_jeddah_2021, "data/analysis_data/verstappen_laps_jeddah_2021_cleaned.csv")
write_csv(raw_ham_jeddah_2022, "data/analysis_data/hamilton_laps_jeddah_2022_cleaned.csv")
write_csv(raw_ham_jeddah_2021, "data/analysis_data/hamilton_laps_jeddah_2021_cleaned.csv")
write_csv(raw_lec_jeddah_2022, "data/analysis_data/leclerc_laps_jeddah_2022_cleaned.csv")
write_csv(raw_lec_jeddah_2021, "data/analysis_data/leclerc_laps_jeddah_2021_cleaned.csv")

write_csv(raw_ver_dutch_2022, "data/analysis_data/verstappen_laps_dutch_2022_cleaned.csv")
write_csv(raw_ver_dutch_2021, "data/analysis_data/verstappen_laps_dutch_2021_cleaned.csv")
write_csv(raw_ham_dutch_2022, "data/analysis_data/hamilton_laps_dutch_2022_cleaned.csv")
write_csv(raw_ham_dutch_2021, "data/analysis_data/hamilton_laps_dutch_2021_cleaned.csv")
write_csv(raw_lec_dutch_2022, "data/analysis_data/leclerc_laps_dutch_2022_cleaned.csv")
write_csv(raw_lec_dutch_2021, "data/analysis_data/leclerc_laps_dutch_2021_cleaned.csv")


