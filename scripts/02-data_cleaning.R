#### Preamble ####
# Purpose: Cleans the raw COVID data into an analysis dataset
# Author: Yunkai Gu
# Date: 23 September 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/covid_raw_data.csv")

# Remove rows where classification equals "probable"
# Remove rows with NA in the 'age_group' column
cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = reported_date,
           into = c("reported_year", "reported_month", "reported_day"),
           sep = "/") |>
  separate(col = episode_date,
           into = c("episode_year", "episode_month", "episode_day"),
           sep = "/") |>
  filter(classification != "probable") |>
  filter(!is.na(age_group))


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/covid_analysis_data.csv")
