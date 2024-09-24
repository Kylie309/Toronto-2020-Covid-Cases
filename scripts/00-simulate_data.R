#### Preamble ####
# Purpose: Simulates data
# Author: Yunkai Gu
# Date: 23 September 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(304)

# Define the start and end date
start_date <- as.Date("2020-01-01")
end_date <- as.Date("2020-11-30")

# Set the number of random dates you want to generate
number_of_dates <- 32000

simulated_data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_dates,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
    ),
    outbreak_associated = sample(
      x = c("YES", "NO"),
      size = 32000,
      replace = TRUE
    ),
    age_group = sample(
      x = c("19 and younger", "20 to 29 Years", "30 to 39 Years", 
            "40 to 49 Years", "50 to 59 Years", "60 to 69 Years", 
            "70 to 79 Years", "80 to 89 Years", "90 and older"),
      size = 32000,
      replace = TRUE
    ),
    source_of_infection = sample(
      x = c("Close Contact", "Community", "Household Contact", "Travel",
            "Outbreaks, Congregate Settings", "Outbreaks, Healthcare Institutions",
            "Outbreaks, Other Settings", "No Information"),
      size = 32000,
      replace = TRUE
    ),
    client_gender = sample(
      x = c("Female", "Male", "Non-Binary", "Transgender", "Other", "Unknown"),
      size = 32000,
      replace = TRUE
    )
  )


#### Write_csv
write_csv(simulated_data, file = "data/raw_data/simulated_covid_data.csv")
