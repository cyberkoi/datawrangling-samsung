### Data Wrangling: Human Activity Recognition

The goal of this project is to get you some practice in processing real world datasets using basic tools and techniques. 

##### Dataset:

- [Samsung Galaxy S Smartphone dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), available via UCI.

##### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##### Project details:

Use several data transformation techniques to put it into a usable, tidy state

Create one R script called run_analysis.R that does the following:
- Merges the training and the test sets to create one data set.
- Extracts columns containing mean and standard deviation for each measurement (Hint: Since some feature/column names are repeated, you may need to use the make.names() function in R)
- Creates variables called ActivityLabel and ActivityName that label all observations with the corresponding activity labels and names respectively
- From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Output Files:
- The tidy data set as described above
- A link to a Github repository with your script for performing the analysis, and
- A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
- A README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 
