# Starter folder

## Overview

This repository contains the data, code and paper for the analysis of Toronto COVID-19 cases in 2020. This paper analyzes COVID-19 case data obtained from Open Data Toronto, and specifically investigates the trends of cases by age group, gender, and sources of infection.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Open Data Toronto and the simulated data.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

ChatGPT-4 was used to provide assistance on resolving issues occurring in the process of generating plots and tables in `paper.qmd`, and the process of data cleaning in `02-data_cleaning.R`. The entire chat history is available in`other/llm/usage.txt`.