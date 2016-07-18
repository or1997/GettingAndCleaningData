# Getting and Cleaning Data: Course Project
Completed July 2016

This repository contains the following files:

* README.md: this file
* run_analysis.R: script to create tidydataset.txt file per the course project instructions
* CodeBook.md: code book that describes the data, the variables, and the work done to clean up the data

### Project Description
Instructions from the course website:

"One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:"

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Summary of Analysis

The run_analysis.R script downloads and unzips the project data if necessary and then performs the following analysis.

1. **Prepares the training and test sets separately and then combines the two data sets.**

* read train/X_train.txt
* read features.txt and use second column as variable names
* read train/y_train.txt and attach as column of activity values
* read train/subject.txt and attach as column of subject IDs

* read test/X_test.txt
* read features.txt and use second column as variables names
* read test/y_test.txt and attach as column of activity values
* read test/subject.txt and attach as column of subject IDs

2. **Extract the subset of data that corresponds to measurements on the mean and standard deviation.**

From the 561 measurements, the columns selected were those for which the column name included "mean" or "std" as part of the name. The "angle" column measurements in which gravityMean is part of the name were NOT included. The meanFreq() measurements were included.

3. **Label the activities using descriptive names.**

The activities in the data set were mapped from values 1 to 6 to activities as follows:

1 = walking, 2 = walking_upstairs, 3 = walking_downstairs, 4 = sitting, 5 = standing, 6 = laying

4. **Label the data set with descriptive variable names.**

There seems to be no one standard R naming convention, so the conventions used here are:
 
* all lower case
* remove () from names 
* change dash to underscore (some people like underscores and some don't; the underscores were kept here to improve readability of the very long variable names)
* change initial t to time, intial f to freq and bodybody to body

5. **Create an independent tidy data set with the average of each variable for each subject and each activity.**

* The tidy data set is written to a file: tidydataset.txt using write.table().
* Each row of the tidy data set has the subject ID in the first column, the activity in the second column and then the average value (over all of the measurements for that subject and that activity) of each of the 79 measurements.
* There are 180 rows = 30 subjects times 6 activities.
* The data set is tidy because there is one column per variable, one row per observation and clear headings.

**Note**: To read the file back into R, use
```{r}
data <- read.table("tidydataset.txt", header=TRUE)
view(data)
```


