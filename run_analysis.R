install.packages("dplyr", dependencies = TRUE)
install.packages("tidyr", dependencies = TRUE)

setwd("/Users/sni/Downloads/UCI HAR Dataset")

testXtest <- read.table("test/X_test.txt", header=F, sep="\t")
testYtest <- read.table("test/y_test.txt", header=F, sep="\t")
testsubtest <- read.table("test/subject_test.txt", header=F, sep="\t")
trainXtrain <- read.table("train/X_train.txt", header=F, sep="\t")
trainYtrain <- read.table("train/y_train.txt", header=F, sep="\t")
trainsubtrain <- read.table("train/subject_train.txt", header=F, sep="\t")

mergeX <- rbind(testXtest, trainXtrain)
mergeY <- rbind(testYtest, trainYtrain)
mergeSub <- rbind(testsubtest, trainsubtrain)

features <- read.table("features.txt")
colnames <- c(make.names(features$V2, unique = TRUE))

mean_v <- grep("mean", colnames, value=T)
std_v <- grep("std", colnames, value=T)

activity <- read.table("activity_labels.txt")
ActivityLabel = c(1:6)
ActivityName <- c(make.names(activity$V2, unique = TRUE))

Activity = data.frame(ActivityLabel,ActivityName)
