here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("Data", "screen_time_mental_health.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

library(labelled)
library(gtsummary)
library(tidyverse)

data_clean <- data %>% drop_na()
view(data_clean)


saveRDS(
  data_clean, 
  file = here::here("Data clean/data_clean.rds")
)