# Getting-Cleaning-Data
## Repo for Getting and Cleaning Data Course Project

This repo contains the r script *run_analysis.R* and the associated code book *CodeBook.MD* that were used to create tidy dataset *tidyData.csv* of summary statistics (mean of time and frequency variables [means and SDs] by subject and activity) using activity tracking data from accelerometers from the Samsung Galaxy 5 (original dataset at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

Per the researchers who conducted this study: *The data are from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.*

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).*

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).*

*These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

Details on the steps used to clean the data are provided in the Code Book (CodeBook.MD).

The mean values for each variable measured were summarized by activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and for each of 30 subjects in the study.

Data for this project was obtained at the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
