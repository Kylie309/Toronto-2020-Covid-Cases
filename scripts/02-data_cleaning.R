#### Preamble ####
# Purpose: Cleans the raw COVID data into an analysis dataset
# Author: Yunkai Gu
# Date: 25 September 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)


#### Clean data ####
all_raw_data <- read_csv("data/raw_data/covid_raw_data.csv")


# Simplify column names by standardizing them
# Extract the year, month, and day from date columns
# Filters rows where either the reported_year or the episode_year is equal to 2020
# Remove rows where classification equals "probable"
# Remove rows with NA in the 'age_group' column
# Remove columns unnecessary for data analysis


all_cleaned_data <-
  all_raw_data |>
  janitor::clean_names() |> 
  mutate(
    reported_year = year(reported_date),
    reported_month = month(reported_date),
    reported_day = day(reported_date),
    episode_year = year(episode_date),
    episode_month = month(episode_date),
    episode_day = day(episode_date)
  ) |> 
  filter(reported_year == 2020 | episode_year == 2020) |>
  filter(classification != "probable") |> 
  filter(!is.na(age_group)) |> 
  select(-id, -assigned_id, -neighbourhood_name, -fsa, -classification,
         -episode_date, -reported_date, -ever_intubated)


#### Save data ####
write_csv(all_cleaned_data, "data/analysis_data/covid_analysis_data.csv")