################################################################################
# Purpose: Classroom project - Getting and Cleaning Data (Coursera)
# Author: Sandeep Illuri
# Dependencies: reshape2
# Last modified: 20 Aug, 2015 13:57:30 IST
################################################################################

# Instructions
# Set working directory as UCI HAR Dataset

library(reshape2)


# Load activity labels and features data
activityLabels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
features <- read.table("features.txt", stringsAsFactors = FALSE)

# Extract only the data on mean and standard deviation
wantedFeats <- grep(".*mean.*|.*std.*", features[,2])
featNames <- features[wantedFeats,2]
featNames = gsub('-mean', 'Mean', featNames)
featNames = gsub('-std', 'Std', featNames)
featNames <- gsub('[-()]', '', featNames)


# Load train and test datasets
train <- read.table("train/X_train.txt")[wantedFeats]
trainActivities <- read.table("train/Y_train.txt")
trainSubjects <- read.table("train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("test/X_test.txt")[wantedFeats]
testActivities <- read.table("test/Y_test.txt")
testSubjects <- read.table("test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featNames)

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1],
                           labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)


