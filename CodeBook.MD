# Getting and Cleaning Data Course Project
## Download Datafile

### Source and Load dataset

The dataset used for this project is taken from the accelerometer and gyroscope 3-axial raw signals,  tAcc-XYZ and tGyro-XYZ, from data captured using a Samsung Galaxy 5.

The data came from the following research paper:
 Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Downloaded zipped file with dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Both the train and test datasets included 3 files: captured data, activity, and subject. Respective datsets were combined together in two data frames (testData and trainData) before being combined into one single dataset: samsungData.

### Identifying Variables of Interest and Subset

Identified mean and SD variables (and thus column names) using grep for "mean" and "std". Isolated column numbers and column names and subsetted data (samsungMeanSD) and renamed columns using the following scheme:

* removed hyphens and parens
* labeled time variables as "time"
* labeled frequency variables as "freq"
* added "mean" to mean variables and "sd" to standard devation variables



### Providing Descriptive Activity Names

Extracted the activity names from the activity class labels in the dataset. Assigned these names as labels (revised to lowercase with underscores removed) to the "activity" factor variable, and confirmed correct label-level assignment.
