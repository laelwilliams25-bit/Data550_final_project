here::i_am("code/03_render_FP2.R")

library(rmarkdown)
# rendering a report in production mode
render("Final Project 2.Rmd", output_file = here::here("reports/Final Project 2.html"))
