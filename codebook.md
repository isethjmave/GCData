##CombineData_tbldf Data

subjectid: Integer  
	Subject ID  
		subject number who perform the activity  
		
activityid: Integer  
	Activity ID  
		Activity number  
		1	.WALKING  
		2	.WALKING_UPSTAIRS  
		3	.WALKING_DOWNSTAIRS  
		4	.SITTING  
		5	.STANDING  
		6	.LAYING  
  
activityname: Characters  
	Activity Name  
		WALKING  
		WALKING_UPSTAIRS  
		WALKING_DOWNSTAIRS  
		SITTING  
		STANDING  
		LAYING  
  
With X, Y or Z denotes 3-axial signals in the X, Y and Z directions.  
with mean: denotes mean value  
with std: denotes standard deviation   
   
tBodyAccmeanX  
tBodyAccmeanY  
tBodyAccmeanZ  
tGravityAccmeanX  
tGravityAccmeanY  
tGravityAccmeanZ  
tBodyAccJerkmeanX  
tBodyAccJerkmeanY  
tBodyAccJerkmeanZ  
tBodyGyromeanX  
tBodyGyromeanY  
tBodyGyromeanZ  
tBodyGyroJerkmeanX  
tBodyGyroJerkmeanY  
tBodyGyroJerkmeanZ  
tBodyAccMagmean  
tGravityAccMagmean  
tBodyAccJerkMagmean  
tBodyGyroMagmean  
tBodyGyroJerkMagmean  
fBodyAccmeanX  
fBodyAccmeanY  
fBodyAccmeanZ  
fBodyAccmeanFreqX  
fBodyAccmeanFreqY  
fBodyAccmeanFreqZ  
fBodyAccJerkmeanX    
fBodyAccJerkmeanY  
fBodyAccJerkmeanZ  
fBodyAccJerkmeanFreqX  
fBodyAccJerkmeanFreqY  
fBodyAccJerkmeanFreqZ  
fBodyGyromeanX  
fBodyGyromeanY  
fBodyGyromeanZ  
fBodyGyromeanFreqX  
fBodyGyromeanFreqY  
fBodyGyromeanFreqZ  
fBodyAccMagmean  
fBodyAccMagmeanFreq  
fBodyBodyAccJerkMagmean  
fBodyBodyAccJerkMagmeanFreq  
fBodyBodyGyroMagmean  
fBodyBodyGyroMagmeanFreq  
fBodyBodyGyroJerkMagmean  
fBodyBodyGyroJerkMagmeanFreq  
tBodyAccstdX  
tBodyAccstdY  
tBodyAccstdZ  
tGravityAccstdX  
tGravityAccstdY  
tGravityAccstdZ  
tBodyAccJerkstdX  
tBodyAccJerkstdY  
tBodyAccJerkstdZ  
tBodyGyrostdX  
tBodyGyrostdY  
tBodyGyrostdZ  
tBodyGyroJerkstdX  
tBodyGyroJerkstdY  
tBodyGyroJerkstdZ  
tBodyAccMagstd  
tGravityAccMagstd  
tBodyAccJerkMagstd  
tBodyGyroMagstd  
tBodyGyroJerkMagstd  
fBodyAccstdX  
fBodyAccstdY  
fBodyAccstdZ  
fBodyAccJerkstdX  
fBodyAccJerkstdY  
fBodyAccJerkstdZ  
fBodyGyrostdX  
fBodyGyrostdY  
fBodyGyrostdZ  
fBodyAccMagstd  
fBodyBodyAccJerkMagstd  
fBodyBodyGyroMagstd  
fBodyBodyGyroJerkMagstd  
  
##avgByActivitySubjMelt Data  
  
subjectid: Integer  
	Subject ID  
		subject number who perform the activity  
  		
activityid: Integer  
	Activity ID  
		Activity number  
		1	.WALKING  
		2	.WALKING_UPSTAIRS  
		3	.WALKING_DOWNSTAIRS  
		4	.SITTING  
		5	.STANDING  
		6	.LAYING  
  
activityname: Characters  
	Activity Name  
		WALKING  
		WALKING_UPSTAIRS  
		WALKING_DOWNSTAIRS  
		SITTING  
		STANDING  
		LAYING  
  
features: Characters  
	Feauture name that were tested - Refer to Data Dictionary of CombineData_tbldf for variables used  
  
mean: Double  
	Mean of each feature tested grouped by activity and subject  
  
  
Note: for more specific details please refer to features_info.txt of the UCI HAR Dataset  
  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   
  
Acknowledgement to for using this dataset  
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on   Smartphones using a Multiclass   
  
Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012).   Vitoria-Gasteiz, Spain. Dec 2  
