
.PHONY: all data clean

all: report/report.pdf data/eda-output.txt data/regression.RData

data/Advertising.csv: 
	curl -o data/Advertising.csv "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"

report/report.pdf: report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')


data/eda-output.txt: eda-script.R Advertising.csv
	Rscript eda-script.R

data/regression.RData: regression-script.R Advertising.R
	Rscript regression-script.R 

clean: 
	rm -f *.pdf
	rm -f *.html