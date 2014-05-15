# Study Design

## Original Data Set (*)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The original variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

**The set of variables that were originally estimated from these signals and then extracted for the tidy data set are:**

**-mean(): Mean value**

**-std(): Standard deviation**


The complete list of variables of each feature vector is available in 'features.txt'.
**All variables mentioned above are normalized and bounded within [-1,1].**

## Methodology

* The original data for this project is downloaded and unziped into the current working directory using the functions `download.file` and `unzip` respectively. The data is subsequently read using the `read.table` function.

* Since the data has originally been partitioned into two sets (70% of training data and 30% of test data), the script merges the training and the test sets using the `rbind` function.

* In order to extract only the measurements on the mean and standard deviation for each measurement, the script searches for either *-mean()* or *-std()* in the data set names (these names came from _features.txt_) using the `grep` function.

* The descriptive activity names came from *activity_labels.txt* and are converted into factors using a custom function and `sapply`.

* The second, independent tidy data set with the average of each variable for each activity and each subject, is created using the `ddply` function of the **plyr** package. The data set names are prepended with *AVG_* (using the `paste0` function) to distinguish them from the original variable names. The *(* and *)* characters are substituted by empty strings and the *-* character is substituted by an underscore using the `gsub` function. 
This data set is sorted by subject and activity using the `order` function.

* The tidy data set is finally saved into a CSV file called **tidy_dataset.csv**

# Code Book


* Subject  : Volunteer number (**integer**)
* Activity : Activities performed (**Factor w/ 6 levels: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS**)

The following variables were extracted from the original data set on the mean *-mean()* and standard deviation *-std()* and then averaged for each activity and each subject as described above. These variable names are therefore prepended with *AVG_* to distinguish them from the original variable names. 


* AVG_tBodyAcc_mean_X           (**numeric**)
* AVG_tBodyAcc_mean_Y           (**numeric**)
* AVG_tBodyAcc_mean_Z           (**numeric**)
* AVG_tBodyAcc_std_X            (**numeric**)
* AVG_tBodyAcc_std_Y            (**numeric**)
* AVG_tBodyAcc_std_Z            (**numeric**)
* AVG_tGravityAcc_mean_X        (**numeric**)
* AVG_tGravityAcc_mean_Y        (**numeric**)
* AVG_tGravityAcc_mean_Z        (**numeric**)
* AVG_tGravityAcc_std_X         (**numeric**)
* AVG_tGravityAcc_std_Y         (**numeric**)
* AVG_tGravityAcc_std_Z         (**numeric**)
* AVG_tBodyAccJerk_mean_X       (**numeric**)
* AVG_tBodyAccJerk_mean_Y       (**numeric**)
* AVG_tBodyAccJerk_mean_Z       (**numeric**)
* AVG_tBodyAccJerk_std_X        (**numeric**)
* AVG_tBodyAccJerk_std_Y        (**numeric**)
* AVG_tBodyAccJerk_std_Z        (**numeric**)
* AVG_tBodyGyro_mean_X          (**numeric**)
* AVG_tBodyGyro_mean_Y          (**numeric**)
* AVG_tBodyGyro_mean_Z          (**numeric**)
* AVG_tBodyGyro_std_X           (**numeric**)
* AVG_tBodyGyro_std_Y           (**numeric**)
* AVG_tBodyGyro_std_Z           (**numeric**)
* AVG_tBodyGyroJerk_mean_X      (**numeric**)
* AVG_tBodyGyroJerk_mean_Y      (**numeric**)
* AVG_tBodyGyroJerk_mean_Z      (**numeric**)
* AVG_tBodyGyroJerk_std_X       (**numeric**)
* AVG_tBodyGyroJerk_std_Y       (**numeric**)
* AVG_tBodyGyroJerk_std_Z       (**numeric**)
* AVG_tBodyAccMag_mean          (**numeric**)
* AVG_tBodyAccMag_std           (**numeric**)
* AVG_tGravityAccMag_mean       (**numeric**)
* AVG_tGravityAccMag_std        (**numeric**)
* AVG_tBodyAccJerkMag_mean      (**numeric**)
* AVG_tBodyAccJerkMag_std       (**numeric**)
* AVG_tBodyGyroMag_mean         (**numeric**)
* AVG_tBodyGyroMag_std          (**numeric**)
* AVG_tBodyGyroJerkMag_mean     (**numeric**)
* AVG_tBodyGyroJerkMag_std      (**numeric**)
* AVG_fBodyAcc_mean_X           (**numeric**)
* AVG_fBodyAcc_mean_Y           (**numeric**)
* AVG_fBodyAcc_mean_Z           (**numeric**)
* AVG_fBodyAcc_std_X            (**numeric**)
* AVG_fBodyAcc_std_Y            (**numeric**)
* AVG_fBodyAcc_std_Z            (**numeric**)
* AVG_fBodyAccJerk_mean_X       (**numeric**)
* AVG_fBodyAccJerk_mean_Y       (**numeric**)
* AVG_fBodyAccJerk_mean_Z       (**numeric**)
* AVG_fBodyAccJerk_std_X        (**numeric**)
* AVG_fBodyAccJerk_std_Y        (**numeric**)
* AVG_fBodyAccJerk_std_Z        (**numeric**)
* AVG_fBodyGyro_mean_X          (**numeric**)
* AVG_fBodyGyro_mean_Y          (**numeric**)
* AVG_fBodyGyro_mean_Z          (**numeric**)
* AVG_fBodyGyro_std_X           (**numeric**)
* AVG_fBodyGyro_std_Y           (**numeric**)
* AVG_fBodyGyro_std_Z           (**numeric**)
* AVG_fBodyAccMag_mean          (**numeric**)
* AVG_fBodyAccMag_std           (**numeric**)
* AVG_fBodyBodyAccJerkMag_mean  (**numeric**)
* AVG_fBodyBodyAccJerkMag_std   (**numeric**)
* AVG_fBodyBodyGyroMag_mean     (**numeric**)
* AVG_fBodyBodyGyroMag_std      (**numeric**)
* AVG_fBodyBodyGyroJerkMag_mean (**numeric**)
* AVG_fBodyBodyGyroJerkMag_std  (**numeric**)


*) from: _features_info.txt_