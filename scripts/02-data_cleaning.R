#### Preamble ####
# Purpose: Cleans the raw COVID dataset into an analysis dataset
# Author: Yunkai Gu
# Date: 27 September 2024
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

all_cleaned_data <-
  all_raw_data |>
  # Simplify column names by standardizing them
  janitor::clean_names() |>
  # Extract the year from reported_date columns
  mutate(
    reported_year = year(reported_date),
  ) |>
  # Remove rows where classification equals "probable"
  filter(classification != "probable") |>
  # Filters rows where reported_year equals 2020
  filter(reported_year == 2020) |>
  # Select only the columns that are necessary for data analysis
  select(age_group, source_of_infection, client_gender) |>
  # Remove rows that lack information in all three columns
  filter(!is.na(age_group) |
    source_of_infection != "No Information" |
    client_gender != "UNKNOWN") |>
  # Rewrite the client_gender equals "TRANSWOMAN" to "TRANSGENDER"
  mutate(client_gender = ifelse(client_gender == "TRANS WOMAN", "TRANSGENDER", client_gender))


#### Save data ####
write_csv(all_cleaned_data, "data/analysis_data/covid_analysis_data.csv")
