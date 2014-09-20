#check if dplyr package is installed - if not install dplyr package
if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("dplyr")
}

#load dlpyr package
library(dplyr)

#get features data, convert it to data frame table and remove the old data frame
featuresData <- read.table("UCI HAR Dataset/features.txt") 
features_tbldf <- tbl_df(featuresData)
rm(featuresData)

#get activity_labels data, convert it to data frame table and remove the old data frame
activityLabelData <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabelData_tbldf <- tbl_df(activityLabelData)
rm(activityLabelData)

#get x_test data, convert it to data frame table and remove the old data frame
xTestData <- read.table("UCI HAR Dataset/test/X_test.txt")
xTestData_tbldf <- tbl_df(xTestData)
rm(xTestData)

#get y_test and subject_test data
yTestData <- read.table("UCI HAR Dataset/test/y_test.txt")
subjTestData <- read.table("UCI HAR Dataset/test/subject_test.txt")

#get x_train data, convert it to data frame table and remove the old data frame
xTrainData <- read.table("UCI HAR Dataset/train/X_train.txt")
xTrainData_tbldf <- tbl_df(xTrainData)
rm(xTrainData)

#get y_train and subject_train data
yTrainData <- read.table("UCI HAR Dataset/train/y_train.txt")
subjTrainData <- read.table("UCI HAR Dataset/train/subject_train.txt")

#get the position of the column name that have mean and std
MeanLabels_pos <- grep("*mean*",features_tbldf[,2])
StDevLabels_pos <- grep("*std*",features_tbldf[,2])

#assign column names to x_test and x_train data frame
colnames(xTestData_tbldf) <- features_tbldf[,2]
colnames(xTrainData_tbldf) <- features_tbldf[,2]

#get all the mean and std test data and remove previous data
xTestDataMean_tbldf <- xTestData_tbldf[MeanLabels_pos]
xTestDataStDev_tbldf <- xTestData_tbldf[StDevLabels_pos]
rm(xTestData_tbldf)

#combine x_test mean data and x_test std data, convert to data frame table and remove previous data
xTestData <- cbind(xTestDataMean_tbldf,xTestDataStDev_tbldf)
xTestData_tbldf <- tbl_df(xTestData)
rm(xTestData)
rm(xTestDataMean_tbldf)
rm(xTestDataStDev_tbldf)

#add activity id and subject it on the combine test data, remove previous data
TestData <- mutate(xTestData_tbldf,activityid=yTestData[[1]],subjectid=subjTestData[[1]])
rm(yTestData)
rm(subjTestData)
rm(xTestData_tbldf)

#get all the mean and std train data and remove previous data
xTrainDataMean_tbldf <- xTrainData_tbldf[MeanLabels_pos]
xTrainDataStDev_tbldf <- xTrainData_tbldf[StDevLabels_pos]
rm(xTrainData_tbldf)

#combine x_train mean data and x_train std data, convert to data frame table and remove previous data
xTrainData <- cbind(xTrainDataMean_tbldf,xTrainDataStDev_tbldf)
xTrainData_tbldf <- tbl_df(xTrainData)
rm(xTrainData)
rm(xTrainDataMean_tbldf)
rm(xTrainDataStDev_tbldf)

#add activity id and subject it on the combine train data, remove previous data
TrainData <- mutate(xTrainData_tbldf,activityid=yTrainData[[1]],subjectid=subjTrainData[[1]])
rm(yTrainData)
rm(subjTrainData)
rm(xTrainData_tbldf)

#combine all the test and train data, convert to data frame table and remove previous data
CombineData <- rbind(TestData,TrainData)
CombineData_tbldf <- tbl_df(CombineData)

rm(TestData)
rm(TrainData)
rm(CombineData)
rm(MeanLabels_pos)
rm(StDevLabels_pos)
rm(features_tbldf)

#add activity name that corresponds to the activity id
activity = as.data.frame(as.character(activityLabelData_tbldf[match(CombineData_tbldf[,ncol(CombineData_tbldf)-1],activityLabelData_tbldf[[1]]),2]))
CombineData_tbldf <- mutate(CombineData_tbldf,activityname=activity[,1])

#rearrange the columns so that it will subject id, activity id and activity name will be the first 3 columns
columnID <- grep("activityname", names(CombineData_tbldf))
CombineData_tbldf <- CombineData_tbldf[, c(columnID, (1:ncol(CombineData_tbldf))[-columnID])]
names(CombineData_tbldf)


columnID <- grep("activityid", names(CombineData_tbldf))
CombineData_tbldf <- CombineData_tbldf[, c(columnID, (1:ncol(CombineData_tbldf))[-columnID])]
names(CombineData_tbldf)

columnID <- grep("subjectid", names(CombineData_tbldf))
CombineData_tbldf <- CombineData_tbldf[, c(columnID, (1:ncol(CombineData_tbldf))[-columnID])]
names(CombineData_tbldf)

#remove previous data
rm(columnID)
rm(activity)
rm(activityLabelData_tbldf)


#remove - and () in the column name
colnames(CombineData_tbldf) <- gsub("-","",colnames(CombineData_tbldf))
colnames(CombineData_tbldf) <- gsub("\\(","",colnames(CombineData_tbldf))
colnames(CombineData_tbldf) <- gsub("\\)","",colnames(CombineData_tbldf))

#check if reshape package is installed - if not install reshape package
if("reshape" %in% rownames(installed.packages()) == FALSE) {
  install.packages("reshape")
}

#load reshape package
library(reshape)

#create a tidy data and generate a txt file that contains the tidy data: for requirement 5
avgByActivitySubj <- summarise_each(group_by(CombineData_tbldf,activityid,activityname,subjectid),funs(mean))
avgByActivitySubjMelt <- melt.data.frame(avgByActivitySubj,id=1:3,variable_name="features")
colnames(avgByActivitySubjMelt) <- gsub("value","mean",colnames(avgByActivitySubjMelt))
write.table(avgByActivitySubjMelt,file="Average by Activity and Subject.txt",row.name=FALSE)
