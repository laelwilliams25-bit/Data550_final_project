here::i_am(
  "code/02_make_figures.R"
)

library(tidyverse)
library(readr)

st_mh <- readRDS(
  file = here::here("Data clean/data_clean.rds")
)

#figure 1
Figure_1 <-
  ggplot(st_mh, aes(x = est_leisure_screen_hours, y = bdi_total)) +
  geom_jitter(alpha = 0.3, width = 0.1) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Figure 1. Screen Time and Depressive Symptoms",
    x = "Estimated Leisure Screen Time (Hours)",
    y = "BDI-II Total Score"
  ) +
  theme_minimal()

ggsave(
  here::here("figures/Figure 1.png"),
  plot = Figure_1,
  device = "png"
)

#figure 2
Figure_2 <- 
  ggplot(st_mh, aes(
  x = factor(depressed),
  y = est_leisure_screen_hours
)) +
  geom_boxplot() +
  scale_x_discrete(
    labels = c(
      "0" = "Not Depressed",
      "1" = "Depressed"
    )
  ) +
  labs(
    title = "Figure 2. Screen Time by Depression Status",
    x = "Depression Status",
    y = "Estimated Leisure Screen Time (Hours)"
  ) +
  theme_minimal()

ggsave(
  here::here("figures/Figure 2.png"),
  plot = Figure_2,
  device = "png"
)

#figure 3
Figure_3 <-
  ggplot(st_mh, aes(x = avg_sleep_hours, y = bdi_total)) +
  geom_jitter(alpha = 0.3, width = 0.1) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Figure 3. Average Sleep Duration and Depressive Symptoms",
    x = "Average Sleep Hours",
    y = "BDI-II Total Score"
  ) +
  theme_minimal()

ggsave(
  here::here("figures/Figure 3.png"),
  plot = Figure_3,
  device = "png"
)

####figure 4
Figure_4 <- 
  ggplot(st_mh, aes(x = sleep_quality_index, y = bdi_total)) +
  geom_jitter(alpha = 0.3, width = 0.1) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Figure 4. Sleep Quality and Depressive Symptoms",
    x = "Sleep Quality Index",
    y = "BDI-II Total Score"
  ) +
  theme_minimal()

ggsave(
  here::here("figures/Figure 4.png"),
  plot = Figure_4,
  device = "png"
)