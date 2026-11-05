# Makefile for Final Project 2

.PHONY: all clean

all: reports/Final\ Project\ 2.html

# 1. Clean the raw data
Data\ clean/data_clean.rds: code/00_clean_data.R Data/screen_time_mental_health.csv
	Rscript code/00_clean_data.R

# 2. Make summary tables
tables/summary_table.rds: code/01_make_tables.R Data\ clean/data_clean.rds
	Rscript code/01_make_tables.R

# 3. Make figures
figures/Figure\ 1.png: code/02_make_figures.R Data\ clean/data_clean.rds
	Rscript code/02_make_figures.R

# 4. Render the report
reports/Final\ Project\ 2.html: code/03_render_FP2.R Final\ Project\ 2.Rmd tables/summary_table.rds figures/Figure\ 1.png
	Rscript code/03_render_FP2.R

# Delete everything the pipeline creates
clean:
	rm -f "Data clean/data_clean.rds" tables/*.rds figures/*.png "reports/Final Project 2.html"
