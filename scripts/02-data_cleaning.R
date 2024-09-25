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
# Extract the year, month, and day from reported_date columns
# Filters rows where reported_year equals 2020
# Remove rows where classification equals "probable"
# Remove rows without information in all three columns:
#   age_group, source_of_infection and client_gender 
# Select only the columns that are necessary for data analysis

all_cleaned_data <-
  all_raw_data |>
  janitor::clean_names() |> 
  mutate(
    reported_year = year(reported_date),
    reported_month = month(reported_date),
    reported_day = day(reported_date)
  ) |> 
  filter(reported_year == 2020) |>
  filter(classification != "probable") |> 
  filter(!is.na(outbreak_associated)) |>
  filter(!is.na(age_group) |
           source_of_infection != "No Information" |
           client_gender != "UNKNOWN") |>
  select(outbreak_associated, age_group, source_of_infection, client_gender, 
         outcome, reported_year, reported_month, reported_day)


#### Save data ####
write_csv(all_cleaned_data, "data/analysis_data/covid_analysis_data.csv")