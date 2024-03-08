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


# Model 2 for South
# Filter data to include only observations where region is "South"
ces2020_reduced_south <- subset(analysis_data, region == "South")

# Sample 1000 observations from the filtered dataset
ces2020_reduced_south <- ces2020_reduced_south[sample(nrow(ces2020_reduced_south), 1000), ]

# Fit logistic regression model using the filtered dataset
political_preferences2 <- stan_glm(
  voted_for_binary ~ race + employ,
  data = ces2020_reduced_south,
  family = binomial(link = "logit"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)
#### Save model ####
saveRDS(
  political_preferences2,
  file = "models/political_preferences2.rds"
)

# Model 3 for Northeast

# Filter data to include only observations where region is "Northeast"
ces2020_reduced_north <- subset(analysis_data, region == "Northeast")

# Sample 1000 observations from the filtered dataset
ces2020_reduced_north <- ces2020_reduced_north[sample(nrow(ces2020_reduced_north), 1000), ]

# Fit logistic regression model using the filtered dataset
political_preferences3 <- stan_glm(
  voted_for_binary ~ race + employ,
  data = ces2020_reduced_north,
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


# Model 4 for West
# Filter data to include only observations where region is "West"
ces2020_reduced_west <- subset(analysis_data, region == "West")

# Sample 1000 observations from the filtered dataset
ces2020_reduced_west <- ces2020_reduced_west[sample(nrow(ces2020_reduced_west), 1000), ]

# Fit logistic regression model using the filtered dataset
political_preferences4 <- stan_glm(
  voted_for_binary ~ race + employ,
  data = ces2020_reduced_west,
  family = binomial(link = "logit"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)
#### Save model ####
saveRDS(
  political_preferences4,
  file = "models/political_preferences4.rds"
)




