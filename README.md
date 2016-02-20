Dataset: [Samsung Galaxy S Smartphone dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), available via UCI.

Several data transformation techniques to put it into a usable, tidy state

Steps:
- Create one R script called run_analysis.R that does the following:
- Merges the training and the test sets to create one data set.
- Extracts columns containing mean and standard deviation for each measurement (Hint: Since some feature/column names are repeated, you may need to use the make.names() function in R)
- Creates variables called ActivityLabel and ActivityName that label all observations with the corresponding activity labels and names respectively
- From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Files:
- The tidy data set as described above
- A link to a Github repository with your script for performing the analysis, and
- A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
- A README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 
