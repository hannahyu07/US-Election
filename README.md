# Understanding the Socio-Economic Determinants of Voter Behavior: An Analysis of the 2020 U.S. Presidential Election

## Overview

This repo contains the analysis of the voting turnouts of the U.S. 2020 Presidential Election based on voters' backgrounds.

To use this folder, click the green "Code" button", then "Download ZIP". Move the downloaded folder to where you want to work on your own computer, and then modify it to suit.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from X.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models.
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts` contains the R scripts used to simulate, download, and clean data and model.

list_files_tree <- function(path, depth = 0) {
  # Indentation based on the depth
  indent <- paste0(rep("│   ", depth - 1), collapse = "")
  
  # List files and directories
  files <- list.files(path, full.names = TRUE)
  dirs <- list.dirs(path, full.names = TRUE, recursive = FALSE)
  
  # Print directories
  cat(indent, "├── ", basename(path), "/", "\n", sep = "")
  
  # Recursively list files and directories within directories
  for (i in seq_along(dirs)) {
    list_files_tree(dirs[i], depth + 1)
    if (i < length(dirs) || length(files) > 0) {
      cat(indent, "│", "\n", sep = "")
    }
  }
  
  # Print files
  for (file in files) {
    cat(indent, "├── ", basename(file), "\n", sep = "")
  }
}

# Replace "path_to_your_directory" with the path to the directory you want to include
list_files_tree("path_to_your_directory")


## Statement on LLM usage

**Statement on LLM Usage: Aspects of the code and paper were written with the help of ChatGPT. Some of the data interpretation, introduction, abstract and discussion were also written using ChatGPT. The entire chat history is available in `inputs/llms/usage.txt`**
