## Coursera's Datascience Specialization
## Getting and Cleaning Data Course
## Programming Assignment - 2
## @author: dsnoob
## @date: May 19, 2014


## This project gives us the ability to collect, work and clean data.
## At the end ## we prepare a tidy data set which is used for later analysis.
## The data is collected from wearable computing.

# - 'features_info.txt': Shows information about the variables used on the feature vector.
# - 'features.txt': List of all features.
# - 'activity_labels.txt': Links the class labels with their activity name.
# - 'train/X_train.txt': Training set.
# - 'train/y_train.txt': Training labels.
# - 'test/X_test.txt': Test set.
# - 'test/y_test.txt': Test labels.

## 1. Merges the training and the test sets to create one data set.
library(data.table)

train_data_x <- read.table("./data/train/X_train.txt")

test_data_x <- read.table("./data/test/X_test.txt")

train_data_y <- read.table("./data/train/y_train.txt")

test_data_y <- read.table("./data/test/y_test.txt")

train_subject <- read.table("./data/train/subject_train.txt")

test_subject <- read.table("./data/test/subject_test.txt")

feature_data <- read.table("./data/features.txt")

activity_data <- read.table("./data/activity_labels.txt")

## combine training and test set
data_set <- rbind(train_data_x, test_data_x)

## combine training and test label data
label_data <- rbind(train_data_y, test_data_y)

## combine training and test subject data
subject_data <- rbind(train_subject, test_subject)
names(subject_data) <- "subject"

mean_std_idx_data <- grep("mean\\(\\)|std\\(\\)", feature_data[,2])

data_set <- data_set[,mean_std_idx_data]

names(data_set) <- gsub("\\(\\)", "", feature_data[mean_std_idx_data,2])
names(data_set) <- gsub("mean", "Mean", names(data_set)) # capitalize M
names(data_set) <- gsub("std", "Std", names(data_set)) # capitalize S
names(data_set) <- gsub("-", "", names(data_set)) # remove "-" in column names

## Clean out the names
activity_data[, 2] <- tolower(gsub("_", "", activity_data[, 2]))
substr(activity_data[2, 2], 8, 8) <- toupper(substr(activity_data[2, 2], 8, 8))
substr(activity_data[3, 2], 8, 8) <- toupper(substr(activity_data[3, 2], 8, 8))
activities <- activity_data[label_data[, 1], 2]
label_data[, 1] <- activities
names(label_data) <- "activity"

total_filtered_data <- cbind(subject_data, label_data, data_set)

filtered_data_table <- data.table(total_filtered_data)
final_data_set <- filtered_data_table[,lapply(.SD,mean),by=list(subject, activity)]
write.table(final_data_set,file="tidydata.txt")
