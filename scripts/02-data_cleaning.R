#### Preamble ####
# Purpose: Cleans the raw homeless deaths by cause data by simplifying names and only keeping the rows and columns that we are interested in.
# Author: Daisy Huo
# Date: 20 January 2024
# Contact: daisy.huo@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
library(opendatatoronto)
library(readr)
library(ggplot2)

#### Clean data ####
# Refer to code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#acquire-2

raw_homeless_data <-
  read_csv(
    file = "inputs/data/raw_homeless_data.csv",
    show_col_types = FALSE
  )

# Make the names easier to type.
cleaned_homeless_data <-
  clean_names(raw_homeless_data)

head(cleaned_homeless_data)

# Choose certain variables of interest.
cleaned_homeless_data <-
  cleaned_homeless_data |>
  select(
    year_of_death,
    cause_of_death,
    count
  )

names(cleaned_homeless_data)

# Rename.
cleaned_homeless_data <-
  cleaned_homeless_data |>
  rename(
    year = year_of_death,
  )

head(cleaned_homeless_data)

# Combine rows.
cleaned_homeless_data <-
  cleaned_homeless_data |>
  group_by(year, cause_of_death) |>
  summarise(across(c(count), sum))

head(cleaned_homeless_data)

#### Save data ####
write_csv(cleaned_homeless_data, "outputs/data/analysis_data.csv")

### Graph data ###
# Refer to code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#acquire-2

cleaned_homeless_data <-
  read_csv(
    file = "outputs/data/analysis_data.csv",
    show_col_types = FALSE
  )

cleaned_homeless_data |>
  ggplot(aes(x = year, y = count, color = cause_of_death)) +
  geom_point() +
  theme_minimal() +
  labs(x = "Year", y = "Count", color = "Count of Death") +
  scale_color_brewer(palette = "Set1") +
  theme(legend.position = "bottom")

### Test data ###
# Refer to code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#acquire-2

cleaned_homeless_data$cause_of_death |>
  unique() |>
  length() == 9

cleaned_homeless_data$year |>
  min() == 2017
cleaned_homeless_data$year |>
  max() == 2023
cleaned_homeless_data$count |>
  class() == "numeric"
