# Code Book for Getting and Cleaning Data Course Project
Completed July 2016

This code book describes the variables, the data, and any transformations and work performed to clean up the data.

The tidy data set is derived from the original data set:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In the resulting data set, each row has the subject ID in the first column, the activity in the second column and then the average value (over all of the measurements for that subject and that activity) of each of the 79 measurements.

**Identifiers**

col 1: subject = number from 1 to 30 to identify test subject

col 2: activity_name = activity performed corresponding to measurements -- walking, walking_upstairs, walking_downstairs, sitting, standing, laying

**Description of Measurements**

From features_info.txt:

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

**Data Cleaning**

There seems to be no one standard R naming convention, so the conventions used here are:
 
* all lower case
* remove () from names 
* change dash to underscore (some people like underscores and some don't; the underscores were kept here to improve readability of the very long variable names)
* change initial t to time, intial f to freq and bodybody to body

**Column Measurements in Tidy Data Set**

col 3: timebodyacc_mean_x           
col 4: timebodyacc_mean_y          
col 5: timebodyacc_mean_z           
col 6: timebodyacc_std_x           
col 7: timebodyacc_std_y            
col 8: timebodyacc_std_z           
col 9: timegravityacc_mean_x        
col 10: timegravityacc_mean_y       
col 11: timegravityacc_mean_z        
col 12: timegravityacc_std_x        
col 13: timegravityacc_std_y         
col 14: timegravityacc_std_z        
col 15: timebodyaccjerk_mean_x       
col 16: timebodyaccjerk_mean_y      
col 17: timebodyaccjerk_mean_z       
col 18: timebodyaccjerk_std_x       
col 19: timebodyaccjerk_std_y        
col 20: timebodyaccjerk_std_z       
col 21: timebodygyro_mean_x          
col 22: timebodygyro_mean_y         
col 23: timebodygyro_mean_z          
col 24: timebodygyro_std_x          
col 25: timebodygyro_std_y           
col 26: timebodygyro_std_z          
col 27: timebodygyrojerk_mean_x      
col 28: timebodygyrojerk_mean_y     
col 29: timebodygyrojerk_mean_z      
col 30: timebodygyrojerk_std_x      
col 31: timebodygyrojerk_std_y       
col 32: timebodygyrojerk_std_z      
col 33: timebodyaccmag_mean          
col 34: timebodyaccmag_std          
col 35: timegravityaccmag_mean       
col 36: timegravityaccmag_std       
col 37: timebodyaccjerkmag_mean      
col 38: timebodyaccjerkmag_std      
col 39: timebodygyromag_mean         
col 40: timebodygyromag_std        
col 41: timebodygyrojerkmag_mean     
col 42: timebodygyrojerkmag_std     
col 43: freqbodyacc_mean_x           
col 44: freqbodyacc_mean_y          
col 45: freqbodyacc_mean_z           
col 46: freqbodyacc_std_x           
col 47: freqbodyacc_std_y            
col 48: freqbodyacc_std_z           
col 49: freqbodyacc_meanfreq_x       
col 50: freqbodyacc_meanfreq_y      
col 51: freqbodyacc_meanfreq_z       
col 52: freqbodyaccjerk_mean_x      
col 53: freqbodyaccjerk_mean_y       
col 54: freqbodyaccjerk_mean_z      
col 55: freqbodyaccjerk_std_x        
col 56: freqbodyaccjerk_std_y       
col 57: freqbodyaccjerk_std_z        
col 58: freqbodyaccjerk_meanfreq_x  
col 59: freqbodyaccjerk_meanfreq_y   
col 60: freqbodyaccjerk_meanfreq_z  
col 61: freqbodygyro_mean_x          
col 62: freqbodygyro_mean_y         
col 63: freqbodygyro_mean_z          
col 64: freqbodygyro_std_x          
col 65: freqbodygyro_std_y           
col 66: freqbodygyro_std_z          
col 67: freqbodygyro_meanfreq_x      
col 68: freqbodygyro_meanfreq_y     
col 69: freqbodygyro_meanfreq_z     
col 70: freqbodyaccmag_mean         
col 71: freqbodyaccmag_std           
col 72: freqbodyaccmag_meanfreq     
col 73: freqbodyaccjerkmag_mean      
col 74: freqbodyaccjerkmag_std      
col 75: freqbodyaccjerkmag_meanfreq

col 76: freqbodygyromag_mean        
col 77: freqbodygyromag_std          
col 78: freqbodygyromag_meanfreq    
col 79: freqbodygyrojerkmag_mean

col 80: freqbodygyrojerkmag_std     
col 81: freqbodygyrojerkmag_meanfreq