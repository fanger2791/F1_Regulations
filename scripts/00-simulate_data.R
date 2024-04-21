#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(dplyr)

#### Simulate data ####

#### Simulate Verstappen Jeddah Laptimes ####

# Set a seed for reproducibility
set.seed(123)

# Generate random lap times for 2021 and 2022
n_laps <- 50  # Number of laps to simulate

ver_jeddah_2021 <- data.frame(
  LapNum = 1:n_laps,
  LapTimeSeconds = rnorm(n_laps, mean=90, sd=2),  # Normal distribution, mean=90s, sd=2s
  Season = '2021'
)

ver_jeddah_2022 <- data.frame(
  LapNum = 1:n_laps,
  LapTimeSeconds = rnorm(n_laps, mean=88, sd=1.8),  # Improved times in 2022
  Season = '2022'
)

# Combine the two dataframes
combined_df <- rbind(ver_jeddah_2021, ver_jeddah_2022)

# Create the plot
ggplot(combined_df, aes(x = LapNum, y = LapTimeSeconds, color = Season)) +
  geom_line() +  # Connects points with lines, showing the trend
  geom_point() +  # Plots individual lap times as points
  theme_minimal() +  # A clean, minimal theme for the plot
  labs(
    title = "Max Verstappen Lap Times in Jeddah - 2021 vs. 2022",
    x = "Lap Number",
    y = "Lap Time (Seconds)",
    color = "Season"
  ) +
  scale_color_manual(values = c("2021" = "blue", "2022" = "red"))



