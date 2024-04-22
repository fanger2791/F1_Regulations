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
library(gridExtra)

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

#### Simulate Verstappen Netherland Speed ####

# Set seed for reproducibility
set.seed(123)

# Simulate telemetry data for 2021 and 2022
n_data_points <- 120  # Suppose each session has 120 data points

ver_telemetry_data_jeddah_2021 <- data.frame(
  time = seq(0, 119),  # Time from start to end of session
  speed = rnorm(n_data_points, mean=200, sd=10),  # Normal distribution, mean=200 km/h, sd=10
  season = "2021"
)

ver_telemetry_data_jeddah_2022 <- data.frame(
  time = seq(0, 119),
  speed = rnorm(n_data_points, mean=205, sd=8),  # Slightly higher average speed in 2022
  season = "2022"
)

# Combine the datasets
combined_data <- rbind(ver_telemetry_data_jeddah_2021, ver_telemetry_data_jeddah_2022)

# Convert session_time to a numeric type if not already
combined_data$session_time <- as.numeric(combined_data$time)

# Plotting overall speeds comparison
plot1 <- ggplot(combined_data, aes(x = time, y = speed, color = season)) +
  geom_line() +
  labs(title = "Comparison of Speeds: 2021 vs 2022",
       x = "Session Time (s)",
       y = "Speed (km/h)") +
  theme_minimal() +
  scale_color_manual(values = c("2021" = "red", "2022" = "blue"))

# Filter data around 60 seconds (between 55 and 65 seconds)
filtered_data <- combined_data %>%
  filter(time >= 55 & time <= 65)

# Plotting speeds comparison at a specific segment
plot2 <- ggplot(filtered_data, aes(x = time, y = speed, color = season)) +
  geom_line() +
  labs(title = "Comparison of Speeds: 2021 vs 2022 at Final Corner",
       x = "Session Time (s)",
       y = "Speed (km/h)") +
  theme_minimal() +
  scale_color_manual(values = c("2021" = "red", "2022" = "blue"))

# Arrange the two plots vertically
grid.arrange(plot1, plot2, ncol = 1, nrow = 2)



