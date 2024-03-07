#### Preamble ####
# Purpose: Downloads and saves the data from 2020 Cooperative Election Study (CES)
# Author: Yimiao Yuan
# Date: 06 March 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: --
# Pre-requisites: --
# CES website: https://doi.org/10.7910/DVN/E9N6PH


#### Workspace setup ####
library(dataverse)
library(tidyverse)


#### Download data ####
ces2020 <-
  get_dataframe_by_name(
    filename = "CES20_Common_OUTPUT_vv.csv",
    dataset = "10.7910/DVN/E9N6PH",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) 

ces2020 <-
  ces2020 |>
  select(votereg, CC20_410, race, region, employ)


#### Save data ####
write_csv(ces2020, "data/raw_data/ces2020.csv")
