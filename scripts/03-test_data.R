#### Preamble ####
# Purpose: Sanity check of the data
# Author: Yunkai Gu
# Date: 22 September 2024
# Contact: kylie.gu@utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Test data ####
simulated_data <- read_csv("data/raw_data/simulated_covid_data.csv")

# Test for any missing values (NAs)
any(is.na(simulated_data$dates))
any(is.na(simulated_data$age_group))