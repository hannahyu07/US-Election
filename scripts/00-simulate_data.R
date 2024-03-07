#### Preamble ####
# Purpose: Simulates the US political support data
# Author: Yimiao Yuan
# Date: 06 March 2024
# Contact: yymlinda.yuan@mail.utoronto.ca
# License: --
# Pre-requisites: --
# Any other information needed? --


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# set seed
set.seed(853)

num_obs <- 500

# chance that people support Trump depends on race, region, employ
simulate_us_vote <- 
  tibble(
  race = sample(0:3, size = num_obs, replace = TRUE),
  region = sample(0:3, size = num_obs, replace = TRUE),
  employ = sample(0:4, size = num_obs, replace = TRUE),
  support_prob = ((race + region + employ) / 5),
) |>
  mutate(
    support_trump = if_else(runif(n = num_obs) < support_prob, "yes", "no"),
    race = case_when(
      race == 0 ~ "White",
      race == 1 ~ "Black",
      race == 2 ~ "Asian",
      race == 3 ~ "Other"
    ),
    region = case_when(
      region == 0 ~ "South",
      region == 1 ~ "North",
      region == 2 ~ "West",
      region == 3 ~ "East",
      region == 4 ~ "Post-grad"
    ),
    employ = case_when(
      employ == 0 ~ "Full time",
      employ == 1 ~ "Part time",
      employ == 2 ~ "Student",
      employ == 3 ~ "Retired",
      employ == 4 ~ "Other"
    )
  ) |>
  select(support_trump, race, region, employ)

