### Code 

This folder contains three folders -- scipts, functions, and tests-- and a test-that file. 

* **test-that.R** will run the tests located in the test folder and return results in the terminal.

#### scripts folder
Scripts used to perform analysis and produce graphs that are used in this report will be located in the **scripts** folder. Specifically, there are three scripts: 

* **eda-script.R**, which reads the raw data from **Advertising.csv** and outputs simple data summaries of TV, Radio, Newspaper, and Sales data to **eda-output.txt** file in the *data* folder. In addition, this file also creates the histograms of all the four variables and output them as png images in the *images* folder. This script will also create a upper triangular correlation matrix, and it will be part of the output that's written to **eda-output.txt** and also saved to the **correlation-matrix.RData** file that's located in the **data** folder.   
* **regression-script.R**, which runs three simple linear regressions and a multiple linear regreesion in R and saves the models into RData file in *data* folder for future uses. This script also genenates a scatterplots for all pairs of variables used in the simple linear regression and also residual plot, normal qq plot, and the scale-location plot for the multiple linear regression in *images* folder.   
* **session-info-script.R**, which loads libraries and session info and outputs them to the **session-info.txt** file that's located in the home directory.   

#### functions folder
**Functions** folder contains **regression-functions.R** file which contains functions used to calculate Residual Sum of Squares (RSS), Total Sum of Squares(TSS), R-Squared value(R2), F-Statistic(F), and Residual Standard Error(RSE).

#### tests folder
**Tests** folder contains the file **test-regression.R**, which contains test-that functions that are used to test the correctness of the functions, ensuring the functions are working.  
