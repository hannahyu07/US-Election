#### Preamble ####
# Purpose: Models
# Author: 
# Date: 07 March 2024
# Contact: 
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_ces2020.csv")

# Convert variables to factors
analysis_data$race <- factor(analysis_data$race)
analysis_data$region <- factor(analysis_data$region)
analysis_data$employ <- factor(analysis_data$employ)

# Create voted_for variable in binary form
analysis_data$voted_for_binary <- ifelse(analysis_data$voted_for == "Biden", 1, 0)

# Model data
set.seed(123)

political_preferences <-
  stan_glm(
    voted_for_binary ~ race + region + employ,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 123
  )

#### Save model ####
saveRDS(
  political_preferences,
  file = "models/political_preferences.rds"
)

# Model 2 for n = 1000
set.seed(123)

ces2020_reduced <- 
  analysis_data |> 
  slice_sample(n = 1000)

political_preferences2 <-
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
  political_preferences2,
  file = "models/political_preferences2.rds"
)



# Filter data to include only observations where region is "South"
ces2020_reduced_south <- subset(analysis_data, region == "South")

# Sample 1000 observations from the filtered dataset
ces2020_reduced_south <- ces2020_reduced_south[sample(nrow(ces2020_reduced_south), 1000), ]

# Fit logistic regression model using the filtered dataset
political_preferences3 <- stan_glm(
  voted_for_binary ~ race + employ,
  data = ces2020_reduced_south,
  family = binomial(link = "logit"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)
#### Save model ####
saveRDS(
  political_preferences3,
  file = "models/political_preferences3.rds"
)
