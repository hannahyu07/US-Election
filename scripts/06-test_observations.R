#### Preamble ####
# Purpose: Tests the model number of observations
# Author: Hannah Yu
# Date: 06 March 2024
# Contact: realhananh.yu@mail.utoronto.ca
# Pre-requisites: run 04-model.R to get model

test_that("Check number of observations is correct", {
  # Check if the number of observations is equal to 1000
  expect_equal(nrow(political_preferences1$data), 1000,
               info = "The number of observations is 1000."
  )
})
