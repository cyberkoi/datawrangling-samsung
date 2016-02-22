### CodeBook

Install dplyr and tidyr packages if required
```
install.packages("dplyr", dependencies = TRUE)
install.packages("tidyr", dependencies = TRUE)
```

Load dplyr and tidyr into R Studio
```
require(dplyr)
require(tidyr)
```

Set working directory (change accordingly)
```
setwd("/Users/sni/Downloads/UCI HAR Dataset")
```

Load test and train files (x, y and subject_test for each)
```
testXtest <- read.table("test/X_test.txt")
testYtest <- read.table("test/y_test.txt")
testsubtest <- read.table("test/subject_test.txt")
trainXtrain <- read.table("train/X_train.txt")
trainYtrain <- read.table("train/y_train.txt")
trainsubtrain <- read.table("train/subject_train.txt")
```

Merge test and train files
```
mergeX <- rbind(testXtest, trainXtrain)
mergeY <- rbind(testYtest, trainYtrain)
mergeSub <- rbind(testsubtest, trainsubtrain)
```

```
features <- read.table("features.txt")
colnames(mergeX) <- c(make.names(features$V2, unique = TRUE, allow_ = TRUE))
```

Extracts columns containing mean and standard deviation
```
meanstd <- mergeX %>% select(contains("mean"), contains("std"))
```

Creates variables called ActivityLabel and ActivityName
```
activity <- read.table("activity_labels.txt")
ActivityLabel = c(1:6)
ActivityName <- c(make.names(activity$V2, unique = TRUE))

Activity = data.frame(ActivityLabel,ActivityName)
```

Merge train+test files with Activity 
```
xy <- bind_cols(mergeX,mergeY)
colnames(xy)[562] <- "ActivityLabel"
join_xy <- left_join(xy, Activity)
subj_xy <- bind_cols(mergeSub, join_xy)
```

Create a second, independent tidy data set with the average
```
xy_tidy <- gather(subj_xy, "features", "value", 2:562)

xy_tidy <-
  xy_tidy %>%
  group_by(ActivityName, V1, features) %>%
  summarise(mean = mean(value))
```

Write to new .txt files
```
write.table(meanstd, "mean_std.txt", sep = "\t")
write.table(xy_tidy, "tidy_data.txt", sep = "\t")
```
