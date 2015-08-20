# getting-and-cleaning-data
Getting and Cleaning Data course work from course era


# Instructions to run the analysis
step 1: Download and extract the UCI HAR Dataset
step 2: Set UCI HAR Dataset as working directory in R
step 3: Run run_analysis.R file


# How the analysis works

1) Loads the activity and feature txt files
2) Loads train and test data and keep columns which reflect mean or standard deviation
3) Loads the activity and subject data for each dataset, and merges those columns with the datasets
4) Merges train and test data
5) Converts activity and subject columns into factors
6) Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
