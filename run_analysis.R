## Download and unzip the data to the current working directory

file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.url, "dataset.zip", method="curl")
unzip("dataset.zip")

## Read the test dataset ======================================================

feature.labels <- read.table("UCI HAR Dataset/features.txt")

test.set <- read.table("UCI HAR Dataset/test/X_test.txt")
test.labels <- read.table("UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")

test.dataset <- cbind(subject.test, test.labels, test.set)
names(test.dataset) <- c("Subject","Activity",as.character(feature.labels[,2]))
rm("test.set", "test.labels", "subject.test")

## Read the training dataset ==================================================

training.set <- read.table("UCI HAR Dataset/train/X_train.txt")
training.labels <- read.table("UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")

training.dataset <- cbind(subject.train, training.labels, training.set)
names(training.dataset) <- c("Subject","Activity",as.character(feature.labels[,2]))
rm("training.set", "training.labels", "subject.train")

## Merge the training and the test sets to create one data set ================

full.dataset <- rbind(test.dataset, training.dataset)
rm("training.dataset","test.dataset")

## Extracts only the measurements on the mean and standard deviation ==========
## for each measurement.

df.temp <- full.dataset[,grep("(-mean\\(\\))|(-std\\(\\))",names(full.dataset),value=TRUE)]
df <- cbind(full.dataset[,1:2], df.temp)

rm("full.dataset","df.temp")

## Uses descriptive activity names to name the activities in the data set. ====

activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Appropriately labels the data set with descriptive activity names. =========

df <- df[order(df$Subject, df$Activity),] # Sort by Subject and Activity

labels <- function(n) {
    m <- as.numeric(n)
    as.factor(as.character(activity.labels[m,2]))
}

df$Activity <- sapply(df$Activity, labels)



## Creates a second, independent tidy data set with the average of each =======
## variable for each activity and each subject.

library(plyr)

tidy.dataset <- ddply(df, .(Subject, Activity), numcolwise(mean))
names(tidy.dataset) <- c("Subject", "Activity", paste0("AVG_", names(tidy.dataset[,3:68])))

## Write the tidy dataset into a csv file =====================================

names(tidy.dataset) <- gsub("-","_",names(tidy.dataset))
names(tidy.dataset) <- gsub("\\)|\\(","",names(tidy.dataset))

filename <- "tidy_dataset.csv"
write.csv(tidy.dataset, filename,row.names=FALSE)
