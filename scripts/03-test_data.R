#### Preamble ####
# Purpose: Tests the cleaned dataset for count of deaths for people experiencing homelessness.
# Author: Daisy Huo
# Date: 22 January 2024
# Contact: daisy.huo@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A


#### Workspace setup ####
library(tidyverse)
library(here)

#### Test data ####
# Refer to code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#acquire-2

cleaned_homeless_data <-
  read_csv(
    here::here("outputs/data/analysis_data.csv")
  )

cleaned_homeless_data$cause_of_death |>
  unique() |>
  length() == 9

cleaned_homeless_data$year |>
  min() == 2017
cleaned_homeless_data$year |>
  max() == 2023
cleaned_homeless_data$count |>
  class() == "numeric"