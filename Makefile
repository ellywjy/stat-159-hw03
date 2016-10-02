
.PHONY: all data clean

all: report/report.pdf data/eda-output.txt data/regression.RData

data: 
	curl -o data/Advertising.csv "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"

report/report.pdf: report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')

data/eda-output.txt: code/eda-script.R data/Advertising.csv
	Rscript code/eda-script.R

data/regression.RData: code/regression-script.R data/Advertising.csv
	Rscript code/regression-script.R 

clean: 
	rm -f *.pdf
	rm -f *.html