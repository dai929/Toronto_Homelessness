#### Preamble ####
# Purpose: Downloads and saves the data from the Open Data Toronto webpage.
# Author: Daisy Huo
# Date: 20 February 2024
# Contact: daisy.huo@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(readr)

#### Download data ####
# Refer to code from: https://open.toronto.ca/dataset/deaths-of-people-experiencing-homelessness/
# & https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#acquire-1

raw_homeless_data <-
  list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e") |>
  filter(name ==
           "Homeless deaths by cause.csv") |>
  get_resource()

#### Save data ####
# Refer to code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#acquire-1
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(
  x = raw_homeless_data, 
  file = "raw_homeless_data.csv"
) 

