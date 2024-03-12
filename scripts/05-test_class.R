#### Preamble ####
# Purpose: Tests the model class
# Author: Hannah Yu
# Date: 06 March 2024
# Contact: realhananh.yu@mail.utoronto.ca
# Pre-requisites: run 04-model.R to get model

library("testthat")

test_that("Check class", {
  # Check if the model object inherits from any of the expected classes
  expect_true(
    inherits(political_preferences1, "stanreg") ||
      inherits(political_preferences1, "glm") ||
      inherits(political_preferences1, "lm"),
    info = "The class of political_preferences1 is as expected."
  )
})
