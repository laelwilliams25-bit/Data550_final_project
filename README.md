# Final Project: Screen Time and Mental Health

## Overview

This project looks at the relationship between screen time and mental health, using depression (BDI) scores. The full analysis will be in `reports`. Data from: https://www.kaggle.com/datasets/kylefengkfeng209/screen-time-vs-mental-health-ml-ready/dataLinks 

## How to reproduce the report
- make 

## Code Description

## Code Description

`code/00_clean_data.R`
- reads the raw data `Data/screen_time_mental_health.csv`
- cleans the data and removes rows with missing (`NA`) values
- saves the cleaned data as a `.rds` object in `Data clean/` folder (`data_clean.rds`)

`code/01_make_tables.R`
- reads the cleaned data saved by `code/00_clean_data.R`
- makes summary tables overall, by sex, and by depression status
- saves the tables as `.rds` objects in `tables/` folder (`summary_table.rds`, `summary_by_sex.rds`, `summary_by_depression.rds`)

`code/02_make_figures.R`
- reads the cleaned data saved by `code/00_clean_data.R`
- makes figures showing screen time and depression scores
- saves the figures as `.png` files in `figures/` folder (`Figure 1.png` – `Figure 4.png`)

`code/03_render_FP2.R`
- renders `Final Project 2.Rmd`
- saves the final report as `reports/Final Project 2.html`

`Final Project 2.Rmd`
- describes the final project proposal
- loads the tables saved by `code/01_make_tables.R`
- loads the figures saved by `code/02_make_figures.R`
- displays the tables and figures with the descriptions 

`Final Project Proposal.Rmd`
- original Rmd submission on canvas
- shows all of the code and description to make all tables and figures
