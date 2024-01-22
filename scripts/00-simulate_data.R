#### Preamble ####
# Purpose: Simulate the Deaths of People Experiencing Homelessness by Cause dataset.
# Author: Daisy Huo
# Date: 20 February 2024
# Contact: daisy.huo@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A
# Dataset:
## - https://open.toronto.ca/dataset/deaths-of-people-experiencing-homelessness/

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Refer to code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate-2

set.seed(312)

simulated_count_data <-
  tibble(
    cause_of_death =
      c(rep("Accident", 7), rep("Cancer", 7), rep("Cardiovascular Disease", 7),
        rep("Drug Toxicity", 7), rep("Homicide", 7), rep("Other", 7),
        rep("Pneumonia", 7), rep("Suicide", 7), rep("Unknown/Pending", 7)),
    year =
      rep(c(2017:2023), 9),
    count =
      runif(n = 63, min = 0, max = 100)
  )

### Tests ###
# Refer to code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate-2

simulated_count_data$cause_of_death |>
  unique() |>
  length() == 9

simulated_count_data$year |>
  min() == 2017
simulated_count_data$year |>
  max() == 2023

simulated_count_data$count |>
  class() == "numeric"

