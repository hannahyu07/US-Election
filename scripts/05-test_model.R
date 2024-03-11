#### Preamble ####
# Purpose: Tests the model
# Author: Hannah Yu
# Date: 06 March 2024
# Contact: realhananh.yu@mail.utoronto.ca
# License: --
# Pre-requisites: run 04-model.R to get model


# Check the class of the model object
if ("stanreg" %in% class(political_preferences1) || "glm" %in% class(political_preferences1) || "lm" %in% class(political_preferences1)) {
  "The class of political_preferences1 is as expected."
} else {
  "The class of political_preferences1 is not as expected."
}
# Get the number of observations
if (!is.null(political_preferences1$data)) {
  if (nrow(political_preferences1$data) == 1000) {
    "The number of observations is 1000."
  } else {
    "The number of observations is not 1000."
  }
} else {
  "The number of observations is not available."
}


# Check the coefficients of the model 
summary(political_preferences1)
