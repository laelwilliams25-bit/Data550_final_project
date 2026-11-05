here::i_am(
  "code/01_make_tables.R"
)

library(tidyverse)
library(readr)
st_mh <- readRDS(
  file = here::here("Data clean/data_clean.rds")
)

#table 1
summary_table <- st_mh %>%
  summarise("Sample Size" = n(),
            "Mean Screen Hours" = mean(est_leisure_screen_hours),
            "SD Screen Hours" = sd(est_leisure_screen_hours),
            "Mean BDI Score" = mean(bdi_total),
            "SD BDI Score" = sd(bdi_total),
            "Mean Sleep Quality" = mean(sleep_quality_index, na.rm = TRUE),
            "SD Sleep Quality" = sd(sleep_quality_index, na.rm = TRUE),
            "Mean Sleep Hours" = mean(avg_sleep_hours, na.rm = TRUE),
            "SD Sleep Hours" = sd(avg_sleep_hours, na.rm = TRUE),
            "Number Depressed" = sum(depressed == 1),
            "Percent Depressed" = mean(depressed == 1, na.rm = TRUE) * 100
  )

saveRDS(
  summary_table,
  file = here::here("tables", "summary_table.rds")
)
#table 2
summary_by_sex <- st_mh %>%
  group_by(sex) %>%
  summarise("n" = n(),
            "Mean Screen Hours" = mean(est_leisure_screen_hours, na.rm = TRUE),
            "SD Screen Hours" = sd(est_leisure_screen_hours, na.rm = TRUE),
            "Mean BDI Score" = mean(bdi_total, na.rm = TRUE),
            "SD BDI Score" = sd(bdi_total, na.rm = TRUE),
            "Mean Sleep Quality" = mean(sleep_quality_index, na.rm = TRUE),
            "SD Sleep Quality" = sd(sleep_quality_index, na.rm = TRUE),
            "Mean Sleep Hours" = mean(avg_sleep_hours, na.rm = TRUE),
            "SD Sleep Hours" = sd(avg_sleep_hours, na.rm = TRUE),
            "Number Depressed" = sum(depressed == 1, na.rm = TRUE),
            "Percent Depressed" = mean(depressed == 1, na.rm = TRUE) * 100
  )

saveRDS(
  summary_by_sex,
  file = here::here("tables", "summary_by_sex.rds")
)

#table 3
summary_by_depression <- st_mh %>%
  mutate( Depression_Status = ifelse(
    depressed == 1,
    "Depressed",
    "Not Depressed")
  ) %>%
  group_by(Depression_Status) %>%
  summarise("n" = n(),
            "Mean Screen Hours" = mean(est_leisure_screen_hours, na.rm = TRUE),
            "SD Screen Hours" = sd(est_leisure_screen_hours, na.rm = TRUE),
            "Mean BDI Score" = mean(bdi_total, na.rm = TRUE),
            "SD BDI Score" = sd(bdi_total, na.rm = TRUE),
            "Mean Sleep Quality" = mean(sleep_quality_index, na.rm = TRUE),
            "SD Sleep Quality" = sd(sleep_quality_index, na.rm = TRUE),
            "Mean Sleep Hours" = mean(avg_sleep_hours, na.rm = TRUE),
            "SD Sleep Hours" = sd(avg_sleep_hours, na.rm = TRUE),
  )

saveRDS(
  summary_by_depression,
  file = here::here("tables", "summary_by_depression.rds")
)