# Makefile

RMD_FILE := hiv_reportupdate.Rmd
REPORT_DIR := report
OUTPUT_FILE := report.html

# Install packages from renv
install:
	R -e "renv::restore()"

# Render the report locally
report:
	mkdir -p $(REPORT_DIR)
	R -e "rmarkdown::render('$(RMD_FILE)', output_file='$(REPORT_DIR)/$(OUTPUT_FILE)')"
