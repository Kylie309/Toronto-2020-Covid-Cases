#### Preamble ####
# Purpose: Simulates dataset of COVID-19 cases
# Author: Yunkai Gu
# Date: 27 September 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(304)

# Set the number of random cases desired to generate
# Equal to the approximate cleaned data size
number_of_cases <- 63000

# Simulate variables needed for each case
simulated_data <-
  tibble(
    age_group = sample(
      x = c("19 and younger", "20 to 29 Years", "30 to 39 Years", 
            "40 to 49 Years", "50 to 59 Years", "60 to 69 Years", 
            "70 to 79 Years", "80 to 89 Years", "90 and older"),
      size = number_of_cases,
      replace = TRUE
    ),
    source_of_infection = sample(
      x = c("Close Contact", "Community", "Household Contact", "Travel",
            "Outbreaks, Congregate Settings", "Outbreaks, Healthcare Institutions",
            "Outbreaks, Other Settings"),
      size = number_of_cases,
      replace = TRUE
    ),
    client_gender = sample(
      x = c("Female", "Male", "Non-Binary", "Transgender", "Other"),
      size = number_of_cases,
      replace = TRUE
    )
  )
  

#### Write_csv
write_csv(simulated_data, file = "data/raw_data/simulated_covid_data.csv")
