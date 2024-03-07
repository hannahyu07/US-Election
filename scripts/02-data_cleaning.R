#### Preamble ####
# Purpose: Cleans the raw CES data in the data folder
# Author: Yimiao Yuan
# Date: 06 March 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: --
# Pre-requisites: run 01-download_data.R in scripts folder first to get the raw data
# Common Content of dataset: https://doi.org/10.7910/DVN/E9N6PH

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
# read in raw data, define column type
raw_ces2020 <-
  read_csv(
    "data/raw_data/ces2020.csv",
    col_types =
      cols(
        "votereg" = col_integer(),
        "CC20_410" = col_integer(),
        "race" = col_integer(),
        "region" = col_integer(),
        "employ" = col_integer()
      )
  )

# only interested in:
# respondents who are registered to vote: votereg = 1
# vote for Trump or Biden: CC20_410 = 1 Biden, 2 Trump
cleaned_ces2020 <-
  raw_ces2020 |>
  filter(votereg == 1,
         CC20_410 %in% c(1, 2)) |>
  mutate(
    voted_for = if_else(CC20_410 == 1, "Biden", "Trump"),
    voted_for = as_factor(voted_for),
    race = case_when(
      race == 1 ~ "White",
      race == 2 ~ "Black",
      race == 3 ~ "Hispanic",
      race == 4 ~ "Asian",
      race == 5 ~ "Native American",
      race == 6 ~ "Middle Eastern",
      race == 7 ~ "Two or more races",
      race == 8 ~ "Other"
    ),
    race = factor(
      race,
      levels = c(
        "White",
        "Black",
        "Hispanic",
        "Asian",
        "Native American",
        "Middle Eastern",
        "Two or more races",
        "Other"
      )
    ),
    region = case_when(
      region == 1 ~ "Northeast",
      region == 2 ~ "Midwest",
      region == 3 ~ "South",
      region == 4 ~ "West"
    ),
    region = factor(
      region,
      levels = c(
        "Northeast",
        "Midwest",
        "South",
        "West"
      )
    ),
    employ = case_when(
      employ == 1 ~ "Full-time",
      employ == 2 ~ "Part-time",
      employ == 3 ~ "Temporarily laid off",
      employ == 4 ~ "Unemployed",
      employ == 5 ~ "Retired",
      employ == 6 ~ "Permanently disabled",
      employ == 7 ~ "Homemaker",
      employ == 8 ~ "Student",
      employ == 9 ~ "Other"
      
    ),
    employ = factor(
      employ,
      levels = c(
        "Full-time",
        "Part-time",
        "Temporarily laid off",
        "Unemployed",
        "Retired",
        "Permanently disabled",
        "Homemaker",
        "Student",
        "Other"
      )
    )
  ) |>
  select(voted_for, race, region, employ)

#### Save data ####
write_csv(cleaned_ces2020, "data/analysis_data/cleaned_ces2020.csv")
