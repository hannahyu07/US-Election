#### Preamble ####
# Purpose: Tests the cleaned US CES 2020 data 
# Author: Yimiao Yuan
# Date: 06 March 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: --
# Pre-requisites: run 01-download_data.R and 02-data_cleaning.R first to
# get the cleaned dataset
# Any other information needed? --


#### Workspace setup ####
library(tidyverse)
library(readr)


#### Test data ####
# read in cleaned data
cleaned_ces2020 <-  read_csv("data/analysis_data/cleaned_ces2020.csv")

# Check column class voted_for, race, region, and employ
class(cleaned_ces2020$voted_for) == "character"
class(cleaned_ces2020$race) == "character"
class(cleaned_ces2020$region) == "character"
class(cleaned_ces2020$employ) == "character"

# Range of data
# Check range of data for voted_for  
correct_voted_for <- 
  c("Trump", "Biden")

if (all(cleaned_ces2020$voted_for |>
        unique() %in% correct_voted_for)) 
  {
  "The cleaned voted_for match the expected voted_for"
} else {
  "Not all of the voted_for have been cleaned completely"
}


# Check range of data for race
correct_race <-
  c(
    "White",
    "Black",
    "Hispanic",
    "Asian",
    "Native American",
    "Middle Eastern",
    "Two or more races",
    "Other"
  )

if (all(cleaned_ces2020$race |>
        unique() %in% correct_race)) 
{
  "The cleaned race match the expected race"
} else {
  "Not all of the race have been cleaned completely"
}


# Check range of data for region
correct_region <-
  c(
    "Northeast",
    "Midwest",
    "South",
    "West"
  )

if (all(cleaned_ces2020$region |>
        unique() %in% correct_region)) 
{
  "The cleaned region match the expected region"
} else {
  "Not all of the region have been cleaned completely"
}


# Check range of data for employ
correct_employ <-
  c(
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

if (all(cleaned_ces2020$employ |>
        unique() %in% correct_employ)) 
{
  "The cleaned employ match the expected employ"
} else {
  "Not all of the employ have been cleaned completely"
}
