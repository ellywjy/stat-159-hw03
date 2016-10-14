# Statistics 159 - Homework #3
# Multiple Regression

##  Author: Elly Wang

This is the repo for HW 3, where we will use git, github, R, and Makefiles to reproduce the statistical analysis presented in Sections 3.1 and 3.2 of "An Introduction to Statistical Learning."

### The structure of this project is as follow:

* **code** folder contains all the R scripts, functions, and tests used for running regressions and producing plots.  
* **data** folder contains the raw and processed data ready to be used in the final report.  
* **images** contains all the images produced by the R scripts. Images include histograms for data, scatterplots for regressions, residual plots for analyzing fitness of regressions.   
* **report** will contain a Rmd file with the narrative of the final report and a pdf file which is the final report created by knitting the Rmd file.  
* The **Makefile** in this home directory can be used to create and remove all pdf, images, and txt files in this directory.   
* **LICENSE** includes the terms and details on the BSD 2-Clause License, which is the license used for code written in this assignment  
* **.gitignore** lists all files that were ignored by Git.


### Instructions for reproducing this project 
**Softwares needed to reproduced this project: R, pandoc, latex, and serveral R packages (see `session-info.txt` for details)**  

1. To download data file, run `make data` in command line. The file `Advertising.csv` should be downloaded to data folder  
2. The tests used for test-that are located in test-regression.R under code/tests folder. Additional tests could be added there.  
3. To test the functions written in regression-functions. R, run `make tests` in command line  
4. To produce preliminary summary, correlation matrix, and histograms on the dataset, use `make eda`. Outputs/results are located in eda-output.txt and correlation-matrix.RData in data folder and images folder.  
5. To run regression on the data and save relevant objects to RData, run `make regression`  
6. To generate the final report, given that all previous steps worked and narrative is written in report.Rmd, run `make report`
7. To see session details, run `make session`. session-info.txt file located in the home directory will be produced, and it will contain information regarding R version and all libraries used in this assignment
8. Given that all scripts and data are located in correct directory, run `make all` will automatically create the final report in pdf and all other relevant graphs and data objects in their respective folders. 


### Licenses

![License](https://i.creativecommons.org/l/by-nc/4.0/88x31.png)

All media used in this assignment is licensed under [Attribution-NonCommercial 4.0 International](http://creativecommons.org/licenses/by-nc/4.0/)  

All code used in this assignment is licensed under BSD 2-Clause License. See LICENSE in the home directory for more info. 

