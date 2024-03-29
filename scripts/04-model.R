#### Preamble ####
# Purpose: Models
# Author: Hannah Yu
# Date: 07 March 2024
# Contact: realhannah.yu@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 01-download_data.R and 02-data_cleaning.R first to 
# get the cleaned dataset


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(testthat)
#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_ces2020.csv")

# Convert variables to factors
analysis_data$race <- factor(analysis_data$race)
analysis_data$region <- factor(analysis_data$region)
analysis_data$employ <- factor(analysis_data$employ)

# Create voted_for variable in binary form
analysis_data$voted_for_binary <- ifelse(analysis_data$voted_for == "Biden", 1, 0)

# Model 1 for n = 1000
set.seed(123)

ces2020_reduced <- 
  analysis_data |> 
  slice_sample(n = 1000)

political_preferences1 <-
  stan_glm(
    voted_for_binary ~ race + region + employ,
    data = ces2020_reduced,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 123
  )

saveRDS(
  political_preferences1,
  file = "models/political_preferences1.rds"
)

test_file("scripts/05-test_class.R")
test_file("scripts/06-test_observations.R")
test_file("scripts/07-test_coefficients.R")

