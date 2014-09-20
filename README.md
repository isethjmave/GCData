GCData
======

##Getting and Cleaning Data Course Project

###run_analysis.R will extract and merge data from the UCI HAR Dataset. 

To run it, make sure the UCI HAR Dataset folder is in the working directory  
and type source("../run_analysis.R") into R.

The script uses dplyr and reshape package. The script will check if the packages have been installed before performing the 
functions needed.

Below is the process on how the script works:

1. Extract data from features, activity_labels, x_test, y_test, subject_test, x_train, y_train, subject_train
2. Store data and convert it to data frame table  using tbl_df and remove the old data frame
3. Get the position of the variable names that have mean and std on the features data
4. Assign column names in the x_test and x_train data frame based on the features data
5. Get all the mean and std data on both x_test and x_train
6. Convert the data into data frame table using tbl_df
7. Remove the old data frame
8. Combine testMean and testStd using cbind - do the same for trainMean and trainStd
9. Add column subjectid,activityid for both TestData (contains testMean and testStd) and TrainData (contains trainMean and trainStd) using mutate
10. Combine both TestData with TrainData using rbind
11. Convert the CombineData to data frame table using tbl_df and remove the old data frame
12. Add a column activityname in the CombineData. This corresponds to the name in the activity labels. Use match function to get the name and mutate to add column
13. Rearrange the columns so that subjectid, activityid and activityname will be the first 3 columns in the data frame
14. Re-name the column names such that it should drop the "-" and "()"
15. Remove unnecessary data

Final data output of the script are:
* CombineData_tbldf: Combine data of Test and Train 
* avgByActivitySubj: Get the average of each activity and subject
* avgByActivitySubjMelt: a reshape data frame (tidy data)


Last Part: 
It will output a text file with 5 columns (data is from avgByActivitySubjMelt) for the course project requirement #5:

* activityid: activity number
* activityname: The activity the subject was performing when the data was taken 
* subjectid: subject number
* features: The name of the variable that is being measured. 
* mean: The mean of the variable being measured 
