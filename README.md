# Getting-and-Cleaning-Data---Course-Project
This repository contains the files for the course project of Getting and Cleaning Data course on Coursera

An R script called run_analysis.R that does the following:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive activity names.
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The approach is as follows:

1) Download the dataset if not present.
2) Merge the training data set with the training labels and subject_Id. Do the same for the test set.
3) Merge the above two data sets that are obtained. The size of the final data set would be 10299 X 564
4) Extract out the features that the required in the question. That is, they are mean() and std().
5) Create a final data set which contains the above measurements and the subject_id, activity_id, activity_names. The    dimension of the final data set would be 10299 X 69
6) To create the tidy data use aggregate function. The data set containing the tidy data should be of the dimensions    180 X 68
