setwd("/Users/virsingh/datasciencecoursera/Getting_and_Cleaning_Data/UCI HAR Dataset")
#url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,"dataset.zip",method="curl")
#mergering total_acc_z data 
# Read & join training data
library(plyr)
library(reshape)
  trainXData<-read.table(paste("./train/","X_train.txt",sep=""))
  trainYData<-read.table(paste("./train/","y_train.txt",sep=""))
  names(trainYData)[names(trainYData)=="V1"] <- "Activity"
  trainSubjectData<-read.table(paste("./train/","subject_train.txt",sep=""))
  names(trainSubjectData)[names(trainSubjectData)=="V1"] <- "Subject"
# merge main training data with activity data
  merged_train_data<-cbind(trainXData,trainYData)
# merge main training data with subject data
  merged_train_data<-cbind(merged_train_data,trainSubjectData)

# Read & join test data
  testXData<-read.table(paste("./test/","X_test.txt",sep=""))
  testYData<-read.table(paste("./test/","y_test.txt",sep=""))
  names(testYData)[names(testYData)=="V1"] <- "Activity"
  testSubjectData<-read.table(paste("./test/","subject_test.txt",sep=""))
  names(testSubjectData)[names(testSubjectData)=="V1"] <- "Subject"
# merge main test data with activity data
  merged_test_data<-cbind(testXData,testYData)
# merge main test data with subject data
  merged_test_data<-cbind(merged_test_data,testSubjectData)
#merge complete test and training data
  merged_data<-rbind(merged_test_data,merged_train_data)
# read activity level data
activityLabelData<-read.table("activity_labels.txt",sep="")
#join Activity Labels with merged data
merged_data<-merge(merged_data,activityLabelData,by.x="Activity",by.y="V1")
write.table(merged_data,"merged_data.txt",sep="")

#Average and Std data sets
  meanStdData<-merged_data[,c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,
                              125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,
                              253,254,266,267,268,269,270,271,294,295,296,345,346,347,348,349,
                              350,373,374,375,424,425,426,427,428,429,452,453,454,503,504,513,
                              516,517,526,529,530,531,539,542,543,552,555,556,557,558,559,560,
                              561)]
write.table(meanStdData,paste("meanStdData.txt",sep=""))

#Average on activity and subject wise
#

molten_data<-melt(merged_data,id=c("Activity","Subject"))
AvgData<-cast(molten_data, Activity+variable ~ Subject ,mean)
write.table(AvgData,"AvgData.txt",sep="")
