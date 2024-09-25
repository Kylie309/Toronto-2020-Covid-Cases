#### Preamble ####
# Purpose: Downloads and saves the raw data "Covid-19 cases in Toronto" from Open Data Toronto
# Author: Yunkai Gu
# Date: 24 September 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Download data ####
all_data <- read_csv("https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/64b54586-6180-4485-83eb-81e8fae3b8fe/resource/fff4ee65-3527-43be-9a8a-cb9401377dbc/download/COVID19%20cases.csv")


#### Save data ####
write_csv(all_data, "data/raw_data/covid_raw_data.csv")