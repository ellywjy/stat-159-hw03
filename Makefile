
.PHONY: all data clean

all: report/report.pdf data/eda-output.txt data/regression.RData

data/Advertising.csv: 
	curl -O "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"

report/report.pdf: report/report.md data/regression.RData images/scatterplot-tv-sales.png


data/eda-output.txt: eda-script.R Advertising.csv


data/regression.RData: regression-script.R Advertising.R


clean: 
	rm -f *.pdf
	rm -f *.html