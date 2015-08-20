********************
# Course Project "Code Book"
### Course:     Getting and Cleaning Data (August 2015)
### Author:     Hendrik L.

********************
&nbsp;  

### Repository Content

* files in this main folder
    + **activity_labels.txt**: the set of ordered activity label names
    + <span style="color:red">**averageHumanActivityDS.txt**: the final tidy data set, with mean and std. dev. values summarized for each subject and activity</span>  
    + **CodeBook.md**: the Code Book creation script    
    + **features.txt**: the ordered list of the names of all features that are scientifically measured
    + **features_info.txt**:  the explanation of all features that were measured during the scientific project @ University of Genova
    + **README.md**: the Read Me creation file (<span style="color:green">this file</span>)
    + **README.txt**: the Read Me text file of the scientific project @ University of Genova
    + <span style="color:red">**run_analysis.R**: the R script that creates the tidy data set (**averageHumanActivityDS.txt**)</span>
* files in subfolder "train"
    + these files contain all training data records of the measurements done during the scientific project @ University of Genova and are read by the run_analysis.R script
* files in subfolder "test"
    + these files contain all test data records of the measurements done during the scientific project @ University of Genova and are read by the run_analysis.R script

&nbsp;  

### Project Description

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
  