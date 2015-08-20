********************
# Course Project "Code Book"
### Course:     Getting and Cleaning Data (August 2015)
### Author:     Hendrik L.

********************
&nbsp;  

### Introduction & Assignment

The original assignment was issued [here](https://class.coursera.org/getdata-031/human_grading/view/courses/975115/assessments/3/submissions) 
&nbsp;  

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: [Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The assignment is about creating one R script called run_analysis.R that does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

&nbsp;  

### Process Steps

The run_analysis.R script runs through the following process steps in order to create a tidy data set with mean and standard dev. values, summarized by subjects and activities:

1. read in activity labels from **activity_labels.txt** and assign column names

2. define the function getLabelName which returns label names for given label numbers (source: **activity_labels.txt**)

3. define the function getDataset which returns either the training or test data set

    + prepare the paths and file names according to isTraining    

    + read in labels, assign a row name and substitute numbers by names (source: **/train/y_train.txt** or **/test/y_test.txt**)

    + read in subject numbers and assign a column name (source: **/train/subject_train.txt** or **/test/subject_test.txt**)

    + read in values (source: **/train/X_train.txt** or **/test/X_test.txt**) and assign adapted row names (source: **features.txt**)

    + remove the "()" from / substitute "-" by "_" in column names

    + create a data set by binding subject, activity, and value columns  

10. create a complete data set from the test and training data sets

11. select only the columns that carry mean or standard dev. values, beginning with column 3

12. sort and group the data set by subject and activity, then summarize all mean and standard dev. values (per subject and activity)

13. write the tidy, summarized data set as blank-separated txt file (result: <span style="color:red">**averageHumanActivityDS.txt**</span>)

14. finish and clean the environment

&nbsp;  

### Code Book for "averageHumanActivityDS.txt"
   
The following variables contain the no. of the study participants and their activities:  

Variable Name  | Data type              | Description  
---------------|------------------------|----------------------------------
subject        | string of var. length  | the name of the study participant
activity       | string of var. length  | the measured physical activity      

&nbsp;  

For the following variables, the average values were calculated and summarized for each subject and activity:  

Variable Name  | Data type              | Description  
---------------|------------------------|----------------------------------
mean(tBodyAcc_mean_X)        | numeric  | summarized, time-based average mean value for body acceleration (X-axis)  
mean(tBodyAcc_mean_Y)        | numeric  | summarized, time-based average mean value for body acceleration (Y-axis)  
mean(tBodyAcc_mean_Z)        | numeric  | summarized, time-based average mean value for body acceleration (Z-axis)  
mean(tBodyAcc_std_X)         | numeric  | summarized, time-based average standard deviation value for body acceleration (X-axis)  
mean(tBodyAcc_std_Y)         | numeric  | summarized, time-based average standard deviation value for body acceleration (Y-axis)  
mean(tBodyAcc_std_Z)         | numeric  | summarized, time-based average standard deviation value for body acceleration (X-axis)  
mean(tGravityAcc_mean_X)     | numeric  | summarized, time-based average mean value for gravity acceleration (X-axis)  
mean(tGravityAcc_mean_Y)     | numeric  | summarized, time-based average mean value for gravity acceleration (Y-axis)  
mean(tGravityAcc_mean_Z)     | numeric  | summarized, time-based average mean value for gravity acceleration (Z-axis)  
mean(tGravityAcc_std_X)     | numeric   | summarized, time-based average standard deviation value for gravity acceleration (X-axis)  
mean(tGravityAcc_std_Y)     | numeric   | summarized, time-based average standard deviation value for gravity acceleration (X-axis)  
mean(tGravityAcc_std_Z)     | numeric   | summarized, time-based average standard deviation value for gravity acceleration (X-axis)  
mean(tBodyAccJerk_mean_X)     | numeric  | summarized, time-based average mean value for body acceleration jerk signal (X-axis)  
mean(tBodyAccJerk_mean_Y)     | numeric  | summarized, time-based average mean value for body acceleration jerk signal (Y-axis)  
mean(tBodyAccJerk_mean_Z)     | numeric  | summarized, time-based average mean value for body acceleration jerk signal (Z-axis)  
mean(tBodyAccJerk_std_X)     | numeric  | summarized, time-based average standard deviation value for body acceleration jerk signal (X-axis)  
mean(tBodyAccJerk_std_Y)     | numeric  | summarized, time-based average standard deviation value for body acceleration jerk signal (Y-axis)  
mean(tBodyAccJerk_std_Z)     | numeric  | summarized, time-based average standard deviation value for body acceleration jerk signal (Z-axis)  
mean(tBodyGyro_mean_X)     | numeric  | summarized, time-based average mean value for body gyroscope signal (X-axis)  
mean(tBodyGyro_mean_Y)     | numeric  | summarized, time-based average mean value for body gyroscope signal (Y-axis)  
mean(tBodyGyro_mean_Z)     | numeric  | summarized, time-based average mean value for body gyroscope signal (Z-axis)  
mean(tBodyGyro_std_X)     | numeric  | summarized, time-based average standard deviation value for body gyroscope signal (X-axis)  
mean(tBodyGyro_std_Y)     | numeric  | summarized, time-based average standard deviation value for body gyroscope signal (Y-axis)  
mean(tBodyGyro_std_Z)     | numeric  | summarized, time-based average standard deviation value for body gyroscope signal (Z-axis)  
mean(tBodyGyroJerk_mean_X)     | numeric  | summarized, time-based average mean value for body gyroscope jerk signal (X-axis)  
mean(tBodyGyroJerk_mean_Y)     | numeric  | summarized, time-based average mean value for body gyroscope jerk signal (Y-axis)  
mean(tBodyGyroJerk_mean_Z)     | numeric  | summarized, time-based average mean value for body gyroscope jerk signal (Z-axis)  
mean(tBodyGyroJerk_std_X)     | numeric  | summarized, time-based average standard deviation value for body gyroscope jerk signal (X-axis)  
mean(tBodyGyroJerk_std_Y)     | numeric  | summarized, time-based average standard deviation value for body gyroscope jerk signal (Y-axis)  
mean(tBodyGyroJerk_std_Z)     | numeric  | summarized, time-based average standard deviation value for body gyroscope jerk signal (Z-axis)  
mean(tBodyAccMag_mean)     | numeric  | summarized, time-based average mean value for body acceleration magnitude
mean(tBodyAccMag_std)     | numeric  | summarized, time-based average standard deviation value for body acceleration magnitude
mean(tGravityAccMag_mean)     | numeric  | summarized, time-based average mean value for gravity acceleration magnitude
mean(tGravityAccMag_std)     | numeric  | summarized, time-based average standard deviation value for gravity acceleration magnitude
mean(tBodyAccJerkMag_mean)     | numeric  | summarized, time-based average mean value for body acceleration jerk signal magnitude
mean(tBodyAccJerkMag_std)     | numeric  | summarized, time-based average standard deviation value for body acceleration jerk signal magnitude
mean(tBodyGyroMag_mean)     | numeric  | summarized, time-based average mean value for body gyroscope signal magnitude  
mean(tBodyGyroMag_std)     | numeric  | summarized, time-based average standard deviation value for body gyroscope signal magnitude  
mean(tBodyGyroJerkMag_mean)     | numeric  | summarized, time-based average mean value for body gyroscope jerk signal magnitude  
mean(tBodyGyroJerkMag_std)     | numeric  | summarized, time-based average standard deviation value for body gyroscope jerk signal magnitude  
mean(fBodyAcc_mean_X)     | numeric  | summarized, frequency-based average mean value for body acceleration (X-axis)  
mean(fBodyAcc_mean_Y)     | numeric  | summarized, frequency-based average mean value for body acceleration (Y-axis)  
mean(fBodyAcc_mean_Z)     | numeric  | summarized, frequency-based average mean value for body acceleration (Z-axis)  
mean(fBodyAcc_std_X)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration (X-axis)  
mean(fBodyAcc_std_Y)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration (Y-axis)  
mean(fBodyAcc_std_Z)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration (Z-axis)  
mean(fBodyAcc_meanFreq_X)     | numeric  | summarized, frequency-based average mean value for body acceleration frequency (X-axis)  
mean(fBodyAcc_meanFreq_Y)     | numeric  | summarized, frequency-based average mean value for body acceleration frequency (Y-axis)  
mean(fBodyAcc_meanFreq_Z)     | numeric  | summarized, frequency-based average mean value for body acceleration frequency (Z-axis)  
mean(fBodyAccJerk_mean_X)     | numeric  | summarized, frequency-based average mean value for body acceleration jerk signal (X-axis)  
mean(fBodyAccJerk_mean_Y)     | numeric  | summarized, frequency-based average mean value for body acceleration jerk signal (Y-axis)  
mean(fBodyAccJerk_mean_Z)     | numeric  | summarized, frequency-based average mean value for body acceleration jerk signal (Z-axis)  
mean(fBodyAccJerk_std_X)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration jerk signal (X-axis)  
mean(fBodyAccJerk_std_Y)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration jerk signal (Y-axis)  
mean(fBodyAccJerk_std_Z)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration jerk signal (Z-axis)  
mean(fBodyAccJerk_meanFreq_X)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration jerk signal frequency (X-axis)  
mean(fBodyAccJerk_meanFreq_Y)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration jerk signal frequency (Y-axis)  
mean(fBodyAccJerk_meanFreq_Z)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration jerk signal frequency (Z-axis)  
mean(fBodyGyro_mean_X)     | numeric  | summarized, frequency-based average mean value for body gyroscope signal (X-axis)  
mean(fBodyGyro_mean_Y)     | numeric  | summarized, frequency-based average mean value for body gyroscope signal (Y-axis)  
mean(fBodyGyro_mean_Z)     | numeric  | summarized, frequency-based average mean value for body gyroscope signal (Z-axis)  
mean(fBodyGyro_std_X)     | numeric  | summarized, frequency-based average standard deviation value for body gyroscope signal (X-axis)  
mean(fBodyGyro_std_Y)     | numeric  | summarized, frequency-based average standard deviation value for body gyroscope signal (Y-axis)  
mean(fBodyGyro_std_Z)     | numeric  | summarized, frequency-based average standard deviation value for body gyroscope signal (Z-axis)  
mean(fBodyGyro_meanFreq_X)     | numeric  | summarized, frequency-based average mean value for body gyroscope signal frequency (X-axis)  
mean(fBodyGyro_meanFreq_Y)     | numeric  | summarized, frequency-based average mean value for body gyroscope signal frequency (Y-axis)  
mean(fBodyGyro_meanFreq_Z)     | numeric  | summarized, frequency-based average mean value for body gyroscope signal frequency (Z-axis)  
mean(fBodyAccMag_mean)     | numeric  | summarized, frequency-based average mean value for body acceleration magnitude
mean(fBodyAccMag_std)     | numeric  | summarized, frequency-based average standard deviation value for body acceleration magnitude
mean(fBodyAccMag_meanFreq)     | numeric  | summarized, frequency-based average mean value for body acceleration magnitude frequency
mean(fBodyBodyAccJerkMag_mean)     | numeric  | summarized, frequency-based average mean value for body-body acceleration jerk signal magnitude
mean(fBodyBodyAccJerkMag_std)     | numeric  | summarized, frequency-based average standard deviation value for body-body acceleration jerk signal magnitude
mean(fBodyBodyAccJerkMag_meanFreq)     | numeric  | summarized, frequency-based average mean value for body-body acceleration jerk signal magnitude frequency
mean(fBodyBodyGyroMag_mean)     | numeric  | summarized, frequency-based average mean value for body-body gyroscope signal magnitude
mean(fBodyBodyGyroMag_std)     | numeric  | summarized, frequency-based average standard deviation value for body-body gyroscope signal magnitude
mean(fBodyBodyGyroMag_meanFreq)     | numeric  | summarized, frequency-based average mean value for body-body gyroscope signal magnitude frequency
mean(fBodyBodyGyroJerkMag_mean)     | numeric  | summarized, frequency-based average mean value for body-body gyroscope jerk signal magnitude
mean(fBodyBodyGyroJerkMag_std)     | numeric  | summarized, frequency-based average standard deviation value for body-body gyroscope jerk signal magnitude  
mean(fBodyBodyGyroJerkMag_meanFreq)     | numeric  | summarized, frequency-based average standard deviation value for body-body gyroscope jerk signal magnitude frequency