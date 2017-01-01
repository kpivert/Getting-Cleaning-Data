# Getting and Cleaning Data Course Project
## Download Datafile

### Source and Load dataset

The dataset used for this project is taken from the accelerometer and gyroscope 3-axial raw signals,  tAcc-XYZ and tGyro-XYZ, from data captured using a Samsung Galaxy 5.

The data came from the following research paper:
 Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Downloaded zipped file with dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Both the train and test datasets included 3 files: captured data, activity, and subject. Respective datsets were combined together in two data frames (testData and trainData) before being combined into one single dataset (samsungData).

### Identifying Variables of Interest and Subset

Using the features.txt file I identified mean and SD variables (and column names) using grep for "mean" and "std". Isolated column numbers and column names and subsetted data into new dataset (samsungMeanSD) and renamed columns using the following schema:

* removed hyphens and parens
* labeled time variables as "time"
* labeled frequency variables as "freq"
* added "mean" to mean variables and "sd" to standard deviation variables

Details on the measurements captured in the dataset are available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### Providing Descriptive Activity Names

Extracted the activity names from the activity class labels in the dataset (activity_labels.txt). Assigned these names as labels (revised to lowercase with underscores removed) to the "activity" factor variable, and confirmed correct label-level assignment.


### Arrange into Tidy Data Set and Calculate Summary Statistics

Created a tidy dataset (tidyData) by ordering by subject and activity. Using aggregate, calculated mean values for each measurement (means and sds)for each activity by each subject. Saved in separate dataset (tidyDataSummary) and saved as a text file (tidyData.txt).
