#### Preamble ####
# Purpose: Sanity check of the data
# Author: Yunkai Gu
# Date: 25 September 2024
# Contact: kylie.gu@utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data and cleaned data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Test data based on simulated data ####
simulated_data <- read_csv("data/raw_data/simulated_covid_data.csv")

# Test for any missing values (NAs)
any(is.na(simulated_data$outbreak_associated))
any(is.na(simulated_data$age_group))
any(is.na(simulated_data$source_of_infection))
any(is.na(simulated_data$client_gender))
any(is.na(simulated_data$outcome))
any(is.na(simulated_data$reported_year))
any(is.na(simulated_data$reported_month))
any(is.na(simulated_data$reported_day))


#### Update the test based on the cleaned data ####
cleaned_data <- read_csv("data/analysis_data/covid_analysis_data.csv")

# Test for any rows missing information in all three columns: 
#   age_group, source_of_infection and client_gender
# Since I wish to keep the cases which contain at least one
#   piece of information (either age group, source of infection or gender)
# Also, is.na() is no longer applicable to source_of_infection and client_gender
#   as the missing value are presented as "No Information" and "UNKNOWN" in
#  these two columns respectively
any(is.na(cleaned_data$age_group) &
      cleaned_data$source_of_infection == "No Information" &
      cleaned_data$client_gender == "UNKNOWN")

# Test for any missing values (NAs) in other columns:
any(is.na(cleaned_data$outbreak_associated))
any(is.na(cleaned_data$outcome))
any(is.na(cleaned_data$reported_year))
any(is.na(cleaned_data$reported_month))
any(is.na(cleaned_data$reported_day))