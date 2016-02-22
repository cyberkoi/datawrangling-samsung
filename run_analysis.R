install.packages("dplyr", dependencies = TRUE)
install.packages("tidyr", dependencies = TRUE)

require(dplyr)
require(tidyr)

setwd("/Users/sni/Downloads/UCI HAR Dataset")

testXtest <- read.table("test/X_test.txt")
testYtest <- read.table("test/y_test.txt")
testsubtest <- read.table("test/subject_test.txt")
trainXtrain <- read.table("train/X_train.txt")
trainYtrain <- read.table("train/y_train.txt")
trainsubtrain <- read.table("train/subject_train.txt")

mergeX <- rbind(testXtest, trainXtrain)
mergeY <- rbind(testYtest, trainYtrain)
mergeSub <- rbind(testsubtest, trainsubtrain)

features <- read.table("features.txt")
colnames(mergeX) <- c(make.names(features$V2, unique = TRUE, allow_ = TRUE))

meanstd <- mergeX %>% select(contains("mean"), contains("std"))

activity <- read.table("activity_labels.txt")
ActivityLabel = c(1:6)
ActivityName <- c(make.names(activity$V2, unique = TRUE))

Activity = data.frame(ActivityLabel,ActivityName)

xy <- bind_cols(mergeX,mergeY)
colnames(xy)[562] <- "ActivityLabel"
join_xy <- left_join(xy, Activity)
subj_xy <- bind_cols(mergeSub, join_xy)

xy_tidy <- gather(subj_xy, "features", "value", 2:562)

xy_tidy <-
  xy_tidy %>%
  group_by(ActivityName, V1, features) %>%
  summarise(mean = mean(value))

write.table(meanstd, "mean_std.txt", sep = "\t")
write.table(xy_tidy, "tidy_data.txt", sep = "\t")
