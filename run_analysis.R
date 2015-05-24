# Loading data into data frames from pre-extracted files
x_train   <- read.table("./UCI HAR Dataset//train//X_train.txt")
y_train   <- read.table("./UCI HAR Dataset//train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset//train/subject_train.txt")

x_test    <- read.table("./UCI HAR Dataset//test//X_test.txt")
y_test    <- read.table("./UCI HAR Dataset//test//y_test.txt")
sub_test  <- read.table("./UCI HAR Dataset//test//subject_test.txt")



# QUESTION 1: Merges the training and the test sets to create one data set
trainDF <- cbind(activity_name = y_train$V1, subject_name = sub_train$V1, x_train)
testDF  <- cbind(activity_name = y_test$V1, subject_name = sub_test$V1, x_test)

fullDF  <- rbind(trainDF,testDF)



# QUESTION 4 Part 1: Appropriately labels the data set with descriptive variable names
# Reading feature.txt to extract labels for datasets
featureDF <- read.table("UCI HAR Dataset//features.txt")
# Remove/replace special characters 
# featureDF$V2 <- gsub("\\(\\)","", featureDF$V2, perl = TRUE)
# featureDF$V2 <- gsub("-","_", featureDF$V2, perl = TRUE)

colnames(fullDF)[3:563] <- as.character(featureDF$V2)



# QUESTION 2: Extracts only the measurements on the mean and standard 
# deviation for each measurement. I am only picking up 'mean()' and 'std()' strings.
matches <- grepl("mean\\(\\)", colnames(fullDF), perl = T, ignore.case = TRUE) | 
    grepl("std\\(\\)", colnames(fullDF), perl = T, ignore.case = TRUE)
# Keeping activity_label and subject_name columns for identification
std_meanDF <- cbind(fullDF[, 1:2], fullDF[, matches])



# QUESTION 3: Uses descriptive activity names to name the activities in the data set
act_lab <- read.table("./UCI HAR Dataset//activity_labels.txt")
std_meanDF$activity_name <- factor(std_meanDF$activity_name, levels = act_lab$V1, 
                                   labels = act_lab$V2)



# QUESTION 4 Part 2: Remove/replace special characters 
colnames(std_meanDF) <- gsub("\\(\\)", "" , colnames(std_meanDF), perl = TRUE)
colnames(std_meanDF) <- gsub("-", "_", colnames(std_meanDF), perl = TRUE)



# QUESTION 5: From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject
library(dplyr)
grp_act_sub <- group_by_(.data = std_meanDF, .dots = list("activity_name", "subject_name"))
tidy_DF <- summarise_each(grp_act_sub, funs(mean))
write.table(tidy_DF, file = "tidy_DF.txt", row.names = FALSE)