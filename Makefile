
# declare variables
reg = regression
script = code/scripts
paper = report/report
session = session-info
images = $(wildcard images/*.png)
dataset = data/Advertising.csv


# declaring phony targets
.PHONY: all data tests clean

# all
all: data tests eda $(reg) report
# download data file/phony target
data:
	curl -o $(dataset) "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"

# run all tests through test-that
tests:
	Rscript code/test-that.R

# phony target for eda
eda: data/eda-output.txt

# phony target for regression
$(reg): data/$(reg).RData

# phony target for report
report: $(paper).pdf

#phony target for session-info doc
session: $(session).txt


# generate pdf by running Rmd
$(paper).pdf: $(paper).Rmd data/$(reg).RData $(images)
	Rscript -e "library(rmarkdown); render('$(paper).Rmd','pdf_document')"

# generate summary txt file from Rscript
data/eda-output.txt: $(script)/eda-script.R $(dataset)
	Rscript $<

data/correlation-matrix.RData: $(script)/eda-script.R $(dataset)
	Rscript $<

# create regression model and save to RData
data/$(reg).RData: $(script)/$(reg)-script.R $(dataset)
	Rscript $<

# create session info
$(session).txt: $(script)/$(session)-script.R
	Rscript $<

# remove report
clean:
	rm -f report/*.pdf