#### Preamble ####
# Purpose: Download data from f1dataR
# Author: Michael Fang
# Date: 22 April 2024
# Contact: m.fang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Not Applicable


#### Workspace setup ####
library(tidyverse)
library(f1dataR)
library(knitr)
library(janitor)
library(lubridate)

#### Download data ####

# To acquire laptime data for a specific driver for a specific race, we used the f1dataR package.
# Within the package, there is a function called "load_standings" where it is gives data on the standings for a specific season, "load_laps" where this function loads lap-by-lap time data for all drivers in a given season and round, and a function called "load_driver_telemetry" where this function loads driver telemetery from a certain session and lap.

# Load standings 2022

standings_2022 <- load_standings(season = "2022", round = "last")

# Load standings 2021

standings_2021 <- load_standings(season = "2021", round = "last")

# Load Circuits 2022

schedule_2022 <- load_schedule(season = 2022)

# Load Circuits 2021

schedule_2021 <- load_schedule(season = 2021)

# Load Verstappen Telemetry Data for Jeddah Qualifying in 2022

verstappen_telemetry_jeddah <- load_driver_telemetry(season = 2022, round = 2, "Q", "VER", laps = "fastest")

# Load Verstappen Telemetry Data for Jeddah Qualifying in 2021

verstappen_telemetry_jeddah_2021 <- load_driver_telemetry(season = 2021, round = 21, "Q", "VER", laps = "fastest")

# Load Hamilton Telemetry Data for Jeddah Qualifying in 2022

hamilton_telemetry_jeddah <- load_driver_telemetry(season = 2022, round = 2, "Q", "HAM", laps = "fastest")

# Load Hamilton Telemetry Data for Jeddah Qualifying in 2021

hamilton_telemetry_jeddah_2021 <- load_driver_telemetry(season = 2021, round = 21, "Q", "HAM", laps = "fastest")

# Load Leclerc Telemetry Data for Jeddah Qualifying in 2022

leclerc_telemetry_jeddah <- load_driver_telemetry(season = 2022, round = 2, "Q", "LEC", laps = "fastest")

# Load Leclerc Telemetry Data for Jeddah Qualifying in 2021

leclerc_telemetry_jeddah_2021 <- load_driver_telemetry(season = 2021, round = 21, "Q", "LEC", laps = "fastest")

# Load Verstappen Telemetry Data for Dutch Qualifying in 2022

verstappen_telemetry_dutch <- load_driver_telemetry(season = 2022, round = 15, "Q", "VER", laps = "fastest")

# Load Verstappen Telemetry Data for Dutch Qualifying in 2021

verstappen_telemetry_dutch_2021 <- load_driver_telemetry(season = 2021, round = 13, "Q", "VER", laps = "fastest")

# Load Hamilton Telemetry Data for Dutch Qualifying in 2022

hamilton_telemetry_dutch <- load_driver_telemetry(season = 2022, round = 15, "Q", "HAM", laps = "fastest")

# Load Hamilton Telemetry Data for Dutch Qualifying in 2021

hamilton_telemetry_dutch_2021 <- load_driver_telemetry(season = 2021, round = 13, "Q", "HAM", laps = "fastest")

# Load Leclerc Telemetry Data for Dutch Qualifying in 2022

leclerc_telemetry_dutch <- load_driver_telemetry(season = 2022, round = 15, "Q", "LEC", laps = "fastest")

# Load Leclerc Telemetry Data for Dutch Qualifying in 2021

leclerc_telemetry_dutch_2021 <- load_driver_telemetry(season = 2021, round = 13, "Q", "LEC", laps = "fastest")

# Load Data from the Jeddah Race in 2022 for Verstappen, Hamilton and Leclerc

# Verstappen Lap Times Jeddah 2022
laps_data_jeddah <- load_laps(season = 2022, round = 2)
verstappen_laps_jeddah <- laps_data_jeddah[laps_data_jeddah$driver_id == 'max_verstappen', ]

# Hamilton Lap Times Jeddah 2022
laps_data_jeddah <- load_laps(season = 2022, round = 2)
hamilton_laps_jeddah <- laps_data_jeddah[laps_data_jeddah$driver_id == 'hamilton', ]

# Leclerc Lap Times Jeddah 2022
laps_data_jeddah <- load_laps(season = 2022, round = 2)
leclerc_laps_jeddah <- laps_data_jeddah[laps_data_jeddah$driver_id == 'leclerc', ]

# Load Data from the Jeddah Race in 2021 for Verstappen, Hamilton and Leclerc

# Verstappen Lap Times Jeddah 2021
laps_data_jeddah <- load_laps(season = 2021, round = 21)
verstappen_laps_jeddah_2021 <- laps_data_jeddah[laps_data_jeddah$driver_id == 'max_verstappen', ]

# Hamilton Lap Times Jeddah 2021
laps_data_jeddah <- load_laps(season = 2021, round = 21)
hamilton_laps_jeddah_2021 <- laps_data_jeddah[laps_data_jeddah$driver_id == 'hamilton', ]

# Leclerc Lap Times Jeddah 2021
laps_data_jeddah <- load_laps(season = 2021, round = 21)
leclerc_laps_jeddah_2021 <- laps_data_jeddah[laps_data_jeddah$driver_id == 'leclerc', ]

# Load Data from the Dutch Race in 2022 for Verstappen, Hamilton and Leclerc

# Verstappen Lap Times Dutch 2022
laps_data_dutch <- load_laps(season = 2022, round = 15)
verstappen_laps_dutch <- laps_data_dutch[laps_data_dutch$driver_id == 'max_verstappen', ]

# Hamilton Lap Times Dutch 2022
laps_data_dutch <- load_laps(season = 2022, round = 15)
hamilton_laps_dutch <- laps_data_dutch[laps_data_dutch$driver_id == 'hamilton', ]

# Leclerc Lap Times Dutch 2022
laps_data_dutch <- load_laps(season = 2022, round = 15)
leclerc_laps_dutch <- laps_data_dutch[laps_data_dutch$driver_id == 'leclerc', ]

# Load Data from the Dutch Race in 2021 for Verstappen, Hamilton and Leclerc

# Verstappen Lap Times Dutch 2021
laps_data_dutch <- load_laps(season = 2021, round = 13)
verstappen_laps_dutch_2021 <- laps_data_dutch[laps_data_dutch$driver_id == 'max_verstappen', ]

# Hamilton Lap Times Dutch 2021
laps_data_dutch <- load_laps(season = 2021, round = 13)
hamilton_laps_dutch_2021 <- laps_data_dutch[laps_data_dutch$driver_id == 'hamilton', ]

# Leclerc Lap Times Dutch 2021
laps_data_dutch <- load_laps(season = 2021, round = 13)
leclerc_laps_dutch_2021 <- laps_data_dutch[laps_data_dutch$driver_id == 'leclerc', ]


#### Save data ####
write_csv(standings_2022, "data/raw_data/standings_2022.csv") 
write_csv(standings_2021, "data/raw_data/standings_2021.csv")

write_csv(schedule_2022, "data/raw_data/schedule_2022.csv") 
write_csv(schedule_2021, "data/raw_data/schedule_2021.csv")

write_csv(verstappen_telemetry_jeddah, "data/raw_data/verstappen_telemetry_jeddah.csv")
write_csv(verstappen_telemetry_jeddah_2021, "data/raw_data/verstappen_telemetry_jeddah_2021.csv")
write_csv(verstappen_telemetry_jeddah, "data/raw_data/hamilton_telemetry_jeddah.csv")
write_csv(verstappen_telemetry_jeddah_2021, "data/raw_data/hamilton_telemetry_jeddah_2021.csv")
write_csv(verstappen_telemetry_jeddah, "data/raw_data/leclerc_telemetry_jeddah.csv")
write_csv(verstappen_telemetry_jeddah_2021, "data/raw_data/leclerc_telemetry_jeddah_2021.csv")

write_csv(verstappen_telemetry_dutch, "data/raw_data/verstappen_telemetry_dutch.csv")
write_csv(verstappen_telemetry_dutch_2021, "data/raw_data/verstappen_telemetry_dutch_2021.csv")
write_csv(verstappen_telemetry_dutch, "data/raw_data/hamilton_telemetry_dutch.csv")
write_csv(verstappen_telemetry_dutch_2021, "data/raw_data/hamilton_telemetry_dutch_2021.csv")
write_csv(verstappen_telemetry_dutch, "data/raw_data/leclerc_telemetry_dutch.csv")
write_csv(verstappen_telemetry_dutch_2021, "data/raw_data/leclerc_telemetry_dutch_2021.csv")

write_csv(verstappen_laps_jeddah, "data/raw_data/verstappen_laps_jeddah.csv") 
write_csv(hamilton_laps_jeddah, "data/raw_data/hamilton_laps_jeddah.csv") 
write_csv(leclerc_laps_jeddah, "data/raw_data/leclerc_laps_jeddah.csv") 

write_csv(verstappen_laps_jeddah_2021, "data/raw_data/verstappen_laps_jeddah_2021.csv") 
write_csv(hamilton_laps_jeddah_2021, "data/raw_data/hamilton_laps_jeddah_2021.csv") 
write_csv(leclerc_laps_jeddah_2021, "data/raw_data/leclerc_laps_jeddah_2021.csv") 

write_csv(verstappen_laps_dutch, "data/raw_data/verstappen_laps_dutch.csv") 
write_csv(hamilton_laps_dutch, "data/raw_data/hamilton_laps_dutch.csv") 
write_csv(leclerc_laps_dutch, "data/raw_data/leclerc_laps_dutch.csv") 

write_csv(verstappen_laps_dutch_2021, "data/raw_data/verstappen_laps_dutch_2021.csv") 
write_csv(hamilton_laps_dutch_2021, "data/raw_data/hamilton_laps_dutch_2021.csv") 
write_csv(leclerc_laps_dutch_2021, "data/raw_data/leclerc_laps_dutch_2021.csv") 

         
