#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(f1dataR)
library(knitr)
library(janitor)
library(lubridate)

#### Download data ####

# EXPLAIAN THE f1dataR package

# To acquire laptime data for a specific driver for a specific race, we used the f1dataR package.
# Within the package, there is a function called "load_laps" where this function loads lap-by-lap time data for all drivers in a given season and round.

# Load standings 2022

standings_2022 <- load_standings(season = "2022", round = "last")

# Load standings 2021

standings_2021 <- load_standings(season = "2021", round = "last")

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
laps_data_jeddah <- load_laps(season = 2021, round = 2)
verstappen_laps_jeddah_2021 <- laps_data_jeddah[laps_data_jeddah$driver_id == 'max_verstappen', ]

# Hamilton Lap Times Jeddah 2021
laps_data_jeddah <- load_laps(season = 2021, round = 2)
hamilton_laps_jeddah_2021 <- laps_data_jeddah[laps_data_jeddah$driver_id == 'hamilton', ]

# Leclerc Lap Times Jeddah 2021
laps_data_jeddah <- load_laps(season = 2021, round = 2)
leclerc_laps_jeddah_2021 <- laps_data_jeddah[laps_data_jeddah$driver_id == 'leclerc', ]


#### Save data ####
write_csv(standings_2022, "data/raw_data/standings_2022.csv") 
write_csv(standings_2021, "data/raw_data/standings_2021.csv") 

write_csv(verstappen_laps_jeddah, "data/raw_data/verstappen_laps_jeddah.csv") 
write_csv(hamilton_laps_jeddah, "data/raw_data/hamilton_laps_jeddah.csv") 
write_csv(leclerc_laps_jeddah, "data/raw_data/leclerc_laps_jeddah.csv") 

write_csv(verstappen_laps_jeddah_2021, "data/raw_data/verstappen_laps_jeddah_2021.csv") 
write_csv(hamilton_laps_jeddah_2021, "data/raw_data/hamilton_laps_jeddah_2021.csv") 
write_csv(leclerc_laps_jeddah_2021, "data/raw_data/leclerc_laps_jeddah_2021.csv") 

         
