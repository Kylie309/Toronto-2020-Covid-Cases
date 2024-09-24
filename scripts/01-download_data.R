#### Preamble ####
# Purpose: Downloads and saves the data "covid-19 cases in toronto" from Open Data Toronto
# Author: Yunkai Gu
# Date: 22 September 2024
# Contact: kylie.gu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Search for package ID of my selected data ####
search_results <- search_packages("covid-19 cases in toronto")
package_ID <- search_results$id


#### Download data ####
# get package
package <- show_package(package_ID)

# get all resources for this package
resources <- list_package_resources(package_ID)

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()


#### Save data ####
write_csv(data, "data/raw_data/covid_raw_data.csv") 
