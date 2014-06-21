# Getting and Cleaning Data 
###CourseProject

The goal of this project is to clean make any transformations for the given data produced from *"wearable devices"*. The data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained from

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data that is obtained for the project can be downloaded from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The output of this project is that we have to produce CodeBook.md that describes the variables, the data, and any transformations or work that we performed to clean up the data. To produce the final output of the project these are the steps that needs to executed in the given order. This script uses [data.table] package (version 1.9)


  - First, unzip the [data] and place it in the folder called * **data** *.
  - Have the * **data** * folder and * **run_analysis.R** * placed in the same directory.
  - Execute the script as mentioned below
```sh
source("run_analysis.R")
```
  - After the script is executed successfully, a file with * **tidydata.txt** * is created with the final output.

  The data file will be of size 180 x 68 columns. Each row represents average for each measurement for an activity for each subject. Apart from the index the column names consists of transformed labels. The columns will have subject, activities (named as _standing, sitting, laying, walking, walkingDownstairs, walkingUpstairs_). 


[data.table]:http://cran.r-project.org/web/packages/data.table/index.html
[data]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip