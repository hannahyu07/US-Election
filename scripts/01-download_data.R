#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(dataverse)
library(tidyverse)
# [...UPDATE THIS...]

ces2020 <-
  get_dataframe_by_name(
    filename = "CES20_Common_OUTPUT_vv.csv",
    dataset = "10.7910/DVN/E9N6PH",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, CC20_410, race, region, CC20_300b_4, CC20_300b_5, CC20_303)

write_csv(ces2020, "ces2020.csv")
git lfs install

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data.csv, "inputs/data/raw_data.csv") 

git lfs track "path/to/large/file"
git lfs track "data/raw_data/CES20_Common_OUTPUT_vv.csv"
git lfs ls-files
git push --force origin <your_branch_name>
  
         
