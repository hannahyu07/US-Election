#### Preamble ####
# Purpose: Tests the model cofficient
# Author: Hannah Yu
# Date: 06 March 2024
# Contact: realhananh.yu@mail.utoronto.ca
# Pre-requisites: run 04-model.R to get model


test_that("Check summary", {
  summary_political <- summary(political_preferences1)
  expect_true("summary.stanreg" %in% class(summary_political))
})
