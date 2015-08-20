# Course:     Getting and Cleaning Data (August 2015)
# Assignment: Course Project
# Author:     Hendrik L.

library(dplyr)

# read in activity labels and assign column names
actLabels <- read.csv("activity_labels.txt", header = FALSE, sep = " ", stringsAsFactors = FALSE)
names(actLabels) <- c("lNo", "lName")

# function getLabelName: 
# return label names for given label numbers
getLabelName <- function(labelNo) { return(actLabels$lName[labelNo]); }

# function getDataset: 
# return either the training or test data set
getDataSet <- function(isTraining = FALSE) {

    # prepare the paths and file names according to isTraining    
    tempPath1 <- NULL
    tempPath2 <- NULL    
    tempPath3 <- NULL
    tempPath4 <- "./features.txt"    
    
    if (isTraining) {
        tempPath1 <- "./train/y_train.txt"
        tempPath2 <- "./train/subject_train.txt"
        tempPath3 <- "./train/X_train.txt"
    } else {
        tempPath1 <- "./test/y_test.txt"
        tempPath2 <- "./test/subject_test.txt"
        tempPath3 <- "./test/X_test.txt"
    }

    # read in labels, assign a row name and substitute numbers by names
    tempDS_act <- read.csv(tempPath1, header = FALSE)
    names(tempDS_act) <- c("activity")
    tempDS_act <- lapply(tempDS_act, getLabelName)
    
    # read in subject numbers and assign a column name
    tempDS_sub <- read.csv(tempPath2, header = FALSE)
    names(tempDS_sub) <- c("subject")
    
    # read in values and assign adapted row names from "features.txt"
    tempDS_val <- read.table(tempPath3, quote = "", comment.char = "", 
        stringsAsFactors = FALSE, colClasses = c("numeric"))
    tempDS_valName <- read.table(tempPath4, quote = "\"", comment.char = "", 
        stringsAsFactors = FALSE)
    tempDS_valName <- tempDS_valName[, 2]

    # remove the "()" from / substitute "-" by "_" in column names
    for (i in 1:length(tempDS_valName)) {
        temp <- unlist(strsplit(tempDS_valName[i], split = c("()"), fixed = TRUE))
        tempDS_valName[i] <- temp[1]
        if (!is.na(temp[2])) { 
            tempDS_valName[i] <- paste0(tempDS_valName[i], temp[2]) 
        }
        temp <- unlist(strsplit(tempDS_valName[i], split = c("-"), fixed = TRUE))
        tempDS_valName[i] <- paste0(temp[1], "_", temp[2]) 
        if (length(temp) > 2 && !is.na(temp[3])) { 
            tempDS_valName[i] <- paste0(tempDS_valName[i], "_", temp[3]) 
        }
    }
    names(tempDS_val) <- as.vector(tempDS_valName)
    
    # create a data set by binding subject, activity, and value columns
    return(cbind(tempDS_sub, tempDS_act, tempDS_val))
}

# create a complete data set from the test and training data sets
humanActivityDS <- rbind(getDataSet(TRUE), getDataSet(FALSE))

# select only the columns that carry mean or standard deviation values,
# beginning with column 3
tempDS1 <- humanActivityDS[, 1:2]
tempDS2 <- humanActivityDS[, 3:ncol(humanActivityDS)]
humanActivityDS <- tempDS1
for (i in 1:ncol(tempDS2)) {
    if (regexpr("mean", colnames(tempDS2[i])) > 0 || 
        regexpr("std", colnames(tempDS2[i])) > 0) {
            humanActivityDS <- cbind(humanActivityDS, tempDS2[i], deparse.level = 2)
    }
}

# sort and group the data set by subject and activity, then summarize 
# all mean and standard deviation values (per subject and activity)
avHumanActivityDS <- humanActivityDS %>%
    arrange(subject, activity) %>%
    group_by(subject, activity) %>% 
    summarize(
        mean(tBodyAcc_mean_X),              
        mean(tBodyAcc_mean_Y),
        mean(tBodyAcc_mean_Z),
        mean(tBodyAcc_std_X),               
        mean(tBodyAcc_std_Y),
        mean(tBodyAcc_std_Z),                
        mean(tGravityAcc_mean_X),           
        mean(tGravityAcc_mean_Y),            
        mean(tGravityAcc_mean_Z),            
        mean(tGravityAcc_std_X),            
        mean(tGravityAcc_std_Y),             
        mean(tGravityAcc_std_Z),             
        mean(tBodyAccJerk_mean_X),          
        mean(tBodyAccJerk_mean_Y),           
        mean(tBodyAccJerk_mean_Z),           
        mean(tBodyAccJerk_std_X),           
        mean(tBodyAccJerk_std_Y),            
        mean(tBodyAccJerk_std_Z),            
        mean(tBodyGyro_mean_X),             
        mean(tBodyGyro_mean_Y),              
        mean(tBodyGyro_mean_Z),              
        mean(tBodyGyro_std_X),              
        mean(tBodyGyro_std_Y),               
        mean(tBodyGyro_std_Z),               
        mean(tBodyGyroJerk_mean_X),         
        mean(tBodyGyroJerk_mean_Y),          
        mean(tBodyGyroJerk_mean_Z),          
        mean(tBodyGyroJerk_std_X),          
        mean(tBodyGyroJerk_std_Y),           
        mean(tBodyGyroJerk_std_Z),           
        mean(tBodyAccMag_mean),             
        mean(tBodyAccMag_std),               
        mean(tGravityAccMag_mean),           
        mean(tGravityAccMag_std),           
        mean(tBodyAccJerkMag_mean),          
        mean(tBodyAccJerkMag_std),           
        mean(tBodyGyroMag_mean),            
        mean(tBodyGyroMag_std),              
        mean(tBodyGyroJerkMag_mean),         
        mean(tBodyGyroJerkMag_std),         
        mean(fBodyAcc_mean_X),               
        mean(fBodyAcc_mean_Y),               
        mean(fBodyAcc_mean_Z),              
        mean(fBodyAcc_std_X),                
        mean(fBodyAcc_std_Y),                
        mean(fBodyAcc_std_Z),               
        mean(fBodyAcc_meanFreq_X),           
        mean(fBodyAcc_meanFreq_Y),           
        mean(fBodyAcc_meanFreq_Z),          
        mean(fBodyAccJerk_mean_X),           
        mean(fBodyAccJerk_mean_Y),           
        mean(fBodyAccJerk_mean_Z),          
        mean(fBodyAccJerk_std_X),            
        mean(fBodyAccJerk_std_Y),            
        mean(fBodyAccJerk_std_Z),           
        mean(fBodyAccJerk_meanFreq_X),       
        mean(fBodyAccJerk_meanFreq_Y),       
        mean(fBodyAccJerk_meanFreq_Z),      
        mean(fBodyGyro_mean_X),              
        mean(fBodyGyro_mean_Y),              
        mean(fBodyGyro_mean_Z),             
        mean(fBodyGyro_std_X),               
        mean(fBodyGyro_std_Y),               
        mean(fBodyGyro_std_Z),              
        mean(fBodyGyro_meanFreq_X),          
        mean(fBodyGyro_meanFreq_Y),          
        mean(fBodyGyro_meanFreq_Z),         
        mean(fBodyAccMag_mean),              
        mean(fBodyAccMag_std),               
        mean(fBodyAccMag_meanFreq),         
        mean(fBodyBodyAccJerkMag_mean),      
        mean(fBodyBodyAccJerkMag_std),       
        mean(fBodyBodyAccJerkMag_meanFreq), 
        mean(fBodyBodyGyroMag_mean),         
        mean(fBodyBodyGyroMag_std),          
        mean(fBodyBodyGyroMag_meanFreq),    
        mean(fBodyBodyGyroJerkMag_mean),     
        mean(fBodyBodyGyroJerkMag_std),      
        mean(fBodyBodyGyroJerkMag_meanFreq)        
    )

# write the tidy, summarized data set as blank-separated txt file
write.table(avHumanActivityDS, "averageHumanActivityDS.txt", 
    append = FALSE, sep = " ", row.names = FALSE, col.names = TRUE)

# finish and clean the environment
remove(tempDS1, tempDS2, humanActivityDS)
closeAllConnections()