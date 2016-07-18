# Coursera Getting and Cleaning Data: Course Project
# Completed July 17, 2016

# uncomment to install packages
# install.packages("plyr", dependencies=TRUE)
# install.packages("dplyr", dependencies=TRUE)
# install.packages("data.table", dependencies=TRUE)
# install.packages("reshape2", dependencies=TRUE)


# load libraries
library(plyr)
library(dplyr)
library(data.table)
library(dtplyr)
library(reshape2)

# download the data set from the internet and unzip the file
filename <- "UCI HAR Dataset.zip"
if (!dir.exists("UCI HAR Dataset")) {
  if (!file.exists(filename)) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
  }
  unzip(filename)
}

#
# STEP 1: MERGE THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET
#

# WORK WITH TRAINING DATA
# check that train/X_train.txt exists
print("Preparing training data...")
trainDT <- fread("UCI HAR Dataset/train/X_train.txt", header=FALSE, sep=" ")

# read features.txt: read first column as ID and second column as Name
col_test <- scan("UCI HAR Dataset/features.txt", what=list(ID=0, Name=""), skip=0, quiet=TRUE)
# given list structure col_test[2], unlist it to get character
col_names <- unlist(col_test[2])
# use col_names as column names for trainDT
setnames(trainDT, col_names)

# read train/y_train.txt (activity data) and add as column
activity <- scan("UCI HAR Dataset/train/y_train.txt", quiet=TRUE)
trainDT <- cbind(trainDT, activity)

# read train/subject_train.txt (subject data) and add as column
subject <- scan("UCI HAR Dataset/train/subject_train.txt", quiet=TRUE)
trainDT <- cbind(trainDT, subject)

# WORK WITH TEST DATA
# check that test/X_test.txt exists
print("Preparing test data...")
testDT <- fread("UCI HAR Dataset/test/X_test.txt", header=FALSE, sep=" ")

# use col_names again as column names for testDT
setnames(testDT, col_names)

# read test/y_test.txt (activity data) and add as column
test_activity <- scan("UCI HAR Dataset/test/y_test.txt", quiet=TRUE)
testDT <- cbind(testDT, test_activity)

# read train/subject_train.txt (subject data) and add as column
test_subject <- scan("UCI HAR Dataset/test/subject_test.txt", quiet=TRUE)
testDT <- cbind(testDT, test_subject)

# NOW MERGE TRAINING AND TEST DATA TABLES
# need to rename test_activity and test_subject
setnames(testDT, "test_activity", "activity")
setnames(testDT, "test_subject", "subject")
print("Merging training and test data...")
combinedDT <- rbind(trainDT, testDT)

#
# STEP 2: Extract only the measurements on the mean and standard deviation
#         for each measurement 
# select columns from combinedDT for which column names includes mean or std as part
# of name; requiring matches to consider case removes columns angle(..., gravityMean)
# Note that meanFreq() columns are included.
#
print("Extracting measurements on mean and standard deviation")
reducedDT <- select(combinedDT, activity, subject, matches('mean|std', ignore.case=FALSE))

#
# STEP 3: Use descriptive activity names to label the activities in the data set
#
activity_table <- read.table("UCI HAR Dataset/activity_labels.txt",sep=" ", stringsAsFactors=FALSE)
reducedDT$activity_name <- mapvalues(reducedDT$activity, from=activity_table$V1, to=activity_table$V2)
reducedDT$activity_name <- tolower(reducedDT$activity_name)
reducedDT <- select(reducedDT, -activity)

#
# STEP 4: Label data set with descriptive variable names
#         Due to length of names, underscores were included to separate mean/std and x/y/z in names.
#
print("Cleaning variable names...")
# change variable names to all lowercase
names(reducedDT) <- tolower(names(reducedDT))
# remove () from variable names
names(reducedDT) <- gsub("\\(\\)", "", names(reducedDT))
# change dash to underscore
names(reducedDT) <- gsub("-", "_", names(reducedDT))
# change t at beginning to time
names(reducedDT) <- sub("^t", "time", names(reducedDT))
# change f at beginning to freq (frequency)
names(reducedDT) <- sub("^f", "freq", names(reducedDT))
# change bodybody to body for improved readablity
names(reducedDT) <- sub("bodybody", "body", names(reducedDT))



#
# STEP 5: Create an independent tidy data set with the average of each variable 
#         for each activity and each subject.
print("Creating data set with measurement averages")
long_form <- melt(reducedDT, id =c("subject", "activity_name"))
long_form_calc <- dcast(long_form, subject + activity_name ~ variable, mean)
write.table(long_form_calc, "tidydataset.txt", row.name=FALSE)
print("Tidy data set written to tidydataset.txt. Done.")




