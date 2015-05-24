#Variables
Filtered and transformed signals were used to estimate variables for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ [3 variables]
- tGravityAcc-XYZ [3 variables]
- tBodyAccJerk-XYZ [3 variables]
- tBodyGyro-XYZ [3 variables]
- tBodyGyroJerk-XYZ [3 variables]
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ [3 variables]
- fBodyAccJerk-XYZ [3 variables]
- fBodyGyro-XYZ [3 variables]
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Total number of variable patterns: 33

The set of variables that were estimated from these signals are: 

- mean: Mean value
- std: Standard deviation

Total number of variables reported from signals: 33 x 2 = 66

In addition to the 66 variables above, we have 2 marking variables
- activity_name: Links the class labels with their activity name.
- subject_name: Links the class labels with their subject ID [values between 1-30].


#Data
The tidy data set produced by the script is an a summarized tabulation of the combined data from the 'train' and 'test' raw-datasets. The summarization is done by computing the arithmetic mean of the 66 varibales mentioned above. The mean is calculated and reported for each of the unique group of 'activity_name' and 'subject_name'


#Transformations applied to raw-data
1. Combined the X, Y and Subject components of both the ‘train’ and ‘test’ data sets.
2. Merged the combined training and test sets from Step 1 to create one data set.
3. Appropriately labelled the data set with descriptive variable names from the ‘features.txt’ file.
4. Extracted only the measurements on the mean and standard deviation for each measurement. 
5. Described activity names using the detailes provided in ‘activity_labels.txt’
6. From the data set in step 4, created a final, independent tidy data set with the average of each variable for each activity_name and each subject_name.
