
#Load all the required Libraries
library(dplyr)

#set all the path and file names
activityLabelFile<-"UCI HAR Dataset//activity_labels.txt"
featureFile<-"UCI HAR Dataset//features.txt"
trainX<-"UCI HAR Dataset//train//X_train.txt"
trainY<-"UCI HAR Dataset/train/y_train.txt"
trainSub<-"UCI HAR Dataset/train/subject_train.txt"
testX<-"UCI HAR Dataset//test//X_test.txt"
testY<-"UCI HAR Dataset/test/y_test.txt"
testSub<-"UCI HAR Dataset/test/subject_test.txt"

#Load activity labels and feature list (measures)
activiyLabel<-read.csv(activityLabelFile, sep=" ", header=FALSE,col.names=c("act","desc"))
featureList<-read.csv(featureFile, header=FALSE, sep=" ", col.names=c("id","measure"))
featureList[,2]<-gsub( "[[:punct:]]", "_",featureList[,2])

#Load training data
trainSubList<-scan(trainSub, what=numeric(), sep=" ")
trainXList<-read.table(trainX)
trainYList<-read.table(trainY)

#update the col names with feature names
colnames(trainXList)<-featureList[[2]]

#Include the subject Id & Activity
trainXList["id"]<-trainSubList
trainXList["act"]<-trainYList

#Load test data
testSubList<-scan(testSub, what=numeric(), sep=" ")
testXList<-read.table(testX)
testYList<-read.table(testY)

#update the col names with feature names
colnames(testXList)<-featureList[[2]]

#Include the subject Id & Activity
testXList["id"]<-testSubList
testXList["act"]<-testYList

#combine training & test data
allData<-rbind(trainXList,testXList)
#get only columns that are either mean or std
reqCol<-as.character(featureList[grep("mean|std|Mean|Std",featureList[[2]]),2])
allReqCol<-c("id","act",reqCol)
tidyData<-subset(allData, select=allReqCol)
#get the description of the activities
tidyData<-merge(activiyLabel,tidyData, by="act")
#remove the activity id
tidyData<-subset(tidyData, select=-act)

#group data by activity description & subject id
tidyDataGroup<-group_by(tidyData, desc,id)
#calculate mean for each of the variables
tidyDataSummary<-summarise_each(tidyDataGroup, funs(mean))

#return the final variable
tidyDataSummary