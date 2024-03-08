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


# Filter data to include only observations where region is "Northeast"
ces2020_reduced_north <- subset(analysis_data, region == "Northeast")

# Sample 1000 observations from the filtered dataset
ces2020_reduced_north <- ces2020_reduced_north[sample(nrow(ces2020_reduced_north), 1000), ]

# Fit logistic regression model using the filtered dataset
political_preferences4 <- stan_glm(
  voted_for_binary ~ race + employ,
  data = ces2020_reduced_north,
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


# Filter data to include only observations where region is "West"
ces2020_reduced_west <- subset(analysis_data, region == "West")

# Sample 1000 observations from the filtered dataset
ces2020_reduced_west <- ces2020_reduced_west[sample(nrow(ces2020_reduced_west), 1000), ]

# Fit logistic regression model using the filtered dataset
political_preferences5 <- stan_glm(
  voted_for_binary ~ race + employ,
  data = ces2020_reduced_west,
  family = binomial(link = "logit"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)
#### Save model ####
saveRDS(
  political_preferences5,
  file = "models/political_preferences5.rds"
)



# Filter data to include only observations where region is "West"
ces2020_reduced_black <- subset(analysis_data, race == "Black")

# Sample 1000 observations from the filtered dataset
ces2020_reduced_black <- ces2020_reduced_black[sample(nrow(ces2020_reduced_black), 1000), ]

# Fit logistic regression model using the filtered dataset
political_preferences6 <- stan_glm(
  voted_for_binary ~ region + employ,
  data = ces2020_reduced_black,
  family = binomial(link = "logit"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)
#### Save model ####
saveRDS(
  political_preferences6,
  file = "models/political_preferences6.rds"
)

# Fit normal linear regression model using the filtered dataset
political_preferences7 <- stan_glm(
  voted_for_binary ~ region + employ,
  data = ces2020_reduced_black,
  family = gaussian(link = "identity"),  # Specify Gaussian family for normal linear regression
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)

# Save the model
saveRDS(
  political_preferences7,
  file = "models/political_preferences7.rds"
)

# Fit normal linear regression model using the filtered dataset
political_preferences8 <- stan_glm(
  voted_for_binary ~ race + region + employ,
  data = ces2020_reduced,
  family = gaussian(link = "identity"),  # Specify Gaussian family for normal linear regression
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  seed = 123
)

# Save the model
saveRDS(
  political_preferences8,
  file = "models/political_preferences8.rds"
)

# leave out employ and region
political_preferences9 <-
  stan_glm(
    voted_for_binary ~ race,
    data = ces2020_reduced,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = 
      normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 123
  )

#### Save model ####
saveRDS(
  political_preferences9,
  file = "models/political_preferences9.rds"
)
