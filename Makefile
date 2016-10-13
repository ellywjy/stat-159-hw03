
# declare regression variable
reg = regression

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
data/eda-output.txt: code/eda-script.R data/Advertising.csv
        Rscript $<

# create regression model and save to RData
data/$(reg).RData: code/$(reg)-script.R data/Advertising.csv
        Rscript $<

# remove report
clean:
        rm -f report/*.pdf