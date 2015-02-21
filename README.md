# Getting Cleaning Data Course Project

####Ervin-Dawson Warner

###The goal of the project was to take the original cellphone data and provide new "tidy and clean" data.

A full description of the original data can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

In addition the data for this project can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###This project contains the following files

1. README.md - This file - a description of how this project was completed.
2. run_analysis.R - the R code that loads the original data, cleans it, then outputs the tidy data
3. CodeBook.md - a description of the features in the "tidy and clean" mean_activity_subject.txt file
4. mean_activity_subject.txt - the "tidy and clean" data

###The R Script (run_analysis.R) completes the analysis of the data.  It performs the following steps:

1. Loads all the data from the original train and test sets (
2. Combines the train and test sets into single tables
3. Gives the data appropriate labels for each feature/column
4. Extracts the mean and standard deviation for each measurement
5. Combines the three individual tables into one table containing all the data
6. Updates the activities with descriptive names
7. Calculates the mean of each of the feature columns grouped by activity and subject
8. Writes the tidy and clean data to a file
9. Loads the tidy data from the file to verify it was written correctly and is reproducible.

####Note - In order to run the analysis, the original data must be in the same folder as the run_analysis.R file.