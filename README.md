# Course Project
## Getting and Cleaning Data

The R script *run_analysis.R* collects data from the Samsung Galaxy S smartphone accelerometers and outputs a new tidy data set called *tidy_dataset.csv* in the current working directory. The new variables, data, and any transformations or work performed to clean up the original data are fully described in *CodeBook.md*

A full description of the original data can be obtained at the site:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data is downloaded by the script from:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip])

In summary, *run_analysis.R* does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

If R is properly added to your PATH environment variable then this script can be run from the command line:

`$ R CMD BATCH run_analysis.R`

When the script is successfully terminated, you shoud have a CSV file called *tidy_dataset.csv* in your current working directory.

###### _&copy; César Ribeiro_


