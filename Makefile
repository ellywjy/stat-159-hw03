
# declare regression variable
reg = regression
script = code/scripts

# declaring phony targets
.PHONY: all data tests clean

# all
all: report/report.pdf data/eda-output.txt data/$(reg).RData

# download data file
data:
	curl -o data/Advertising.csv "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"

# run all tests through test-that
tests:
	Rscript test-that.R

# generate pdf by running Rmd
report/report.pdf: report/report.Rmd data/$(reg).RData images/scatterplot-tv-sales.png
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')"

# generate summary txt file from Rscript
data/eda-output.txt: $(script)/eda-script.R data/Advertising.csv
	Rscript $<

# create regression model and save to RData
data/$(reg).RData: $(script)/$(reg)-script.R data/Advertising.csv
	Rscript $<

# create session info
session-info.txt: $(script)/session-info-script.R
	Rscript $<

# remove report
clean:
	rm -f report/*.pdf