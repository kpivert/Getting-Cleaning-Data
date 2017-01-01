################################

## Getting and Cleaning Data Course Project

################################


    ## Download zipped files

        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                      temp)
    
        
    ## Unzip and Review File Names   
        
        con <- unzip(temp)
        con ## list of files names in unzipped folder UCI HAR Dataset
        unlink(temp)
        
    ## Load test and train data sets
        
        ## Test Data Set
        test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        dim(test) ## 2947 observations of 561 variables (data)

        testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
        dim(testActivity) ## 2947 obervations of 1 variable (activity name)
        
        testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        dim(testSubject) ## 2947 obervations of 1 variable (subject number)
        
        ## Train Data Set
        train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        dim(train) ## 7352 observations of 561 variables (data)
        
        trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
        dim(trainActivity) ## 7352 obervations of 1 variable (activity name)
        
        trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        dim(trainSubject) ## 7352 obervations of 1 variable (subject number)

    ## Create Test and Train Dataframes
        
        testData <- cbind(test, testActivity, testSubject)
        
        ## Check Column Names for New Columns
        colnames(testData[c(562,563)])
        trainData <- cbind(train, trainActivity, trainSubject)


    ## Merge Test and Train Dataframes Together in One Dataset

        samsungData <- rbind(testData, trainData)
  
    ## Load Feature Names and Determine Columns for Mean and SD Values to Extract for Step 2
        
        features <- read.table("./UCI HAR Dataset/features.txt")
        
        ## Determine Column Names for mean and SD values
        
        meanColumns <- features[grep("-mean()", features$V2, fixed = TRUE),]
        sdColumns <- features[grep("std()", features$V2),]
        
        ## Change names to character
        meanColumns$V2 <- as.character(meanColumns$V2)
        sdColumns$V2 <- as.character(sdColumns$V2)
        
        ## Remove hyphens and parens and add appropriate descriptive naming 
        ## for mean, sd, time, and frequency variables
        
        meanColumns$V2 <- substring(meanColumns$V2, 2)
        meanColumns$V2 <- gsub("mean", "", meanColumns$V2)
        meanColumns$V2 <- gsub("-","", meanColumns$V2)
        meanColumns$V2 <- gsub("\\()", "", meanColumns$V2)
        meanColumns$V2[1:20] <- paste("meanTime", meanColumns$V2[1:20], sep = "")
        meanColumns$V2[21:33] <- paste("meanFreq", meanColumns$V2[21:33], sep = "")
        
        
        sdColumns$V2 <- substring(sdColumns$V2, 2)
        sdColumns$V2 <- gsub("std", "", sdColumns$V2)
        sdColumns$V2 <- gsub("-","", sdColumns$V2)
        sdColumns$V2 <- gsub("\\()", "", sdColumns$V2)
        sdColumns$V2[1:20] <- paste("sdTime", sdColumns$V2[1:20], sep = "")
        sdColumns$V2[21:33] <- paste("sdFreq", sdColumns$V2[21:33], sep = "")
        
        ## Create rows for activity and subject 
        activity <- c(562, "activity")
        subject <- c(563, "subject")
        
        ## Identify target columns  
        
        targetCol <-rbind(meanColumns, sdColumns)
        targetCol <- targetCol[order(targetCol$V1), ]
        targetCol <- rbind(activity, subject, targetCol)
        
        ## Fix Column Numbers that were coerced to character
        
        targetCol$V1 <- as.numeric(targetCol$V1)
   
        
    ## Subset samsungData to capture activity, subject, and mean/SD values and name columns accordingly
        
        samsungMeanSD <- samsungData[, targetCol$V1]
        head(samsungMeanSD)
        colnames(samsungMeanSD) <- targetCol$V2
        
    ## Load Activity Key to Create Descriptive Activity Names 
        
        activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
        activityLabel <- as.character(tolower(activity$V2))
        activityLabel <- gsub("ing_upstairs", "Upstairs", activityLabel)
        activityLabel <- gsub("ing_downstairs", "Downstairs", activityLabel)
        
    ## Change Activity Key to Factor using Activity Names
        
        samsungMeanSD$activity <- factor(samsungMeanSD$activity, labels = activityLabel)
        
          ## Confirm correct factor label assignment
          
          table(samsungMeanSD$activity)
          table(samsungData[562])
          
    ## Create Tidy Data Set With Summary Mean Statistic of data 
    ## by subject, and activity 
          
          ## Sort Data by Subject and Activity 
          
          tidyData <- samsungMeanSD[with(samsungMeanSD, order(subject, activity)), ]
          
          ## Create Summary Statistic for each variable by subject and activity
         
          
          tidyDataSummary <- aggregate(. ~ activity + subject, data = tidyData, mean)
          
          
    ## Export Tidied Dataset 
          
          write.csv(tidyDataSummary, "/Users/kpivert/ExData_Plotting1/Getting-Cleaning-Data/tidyData.csv", row.names = FALSE)
          
        