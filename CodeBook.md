# Cleaning and Getting Data assignment code book

### Analysis process

The analysis script, `run_analysis.R` performs a number of steps to prepare the `tidy_dataset.txt` by reading from the given dataset [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
 
 - Download the Dataset and unzip it. 
 - Read both test and train datasets and merge them into one dataset.
 - Read the data columns names from `features.txt` file.
 - Read the activity names from `activity_labels.txt` file.
 - The activity names are  merged based on Activity identifiers of `activity_labels.txt` file.
 - Merge Features as column header and give friendly names to rest of merged columns
 - Columns that hold mean or standard deviation measurements are selected from the dataset, while the other measurement columns are excluded from the rest of the analysis.
 - Create a new data set `NewtidyDS` by extracting only the measurements holds the mean and standard deviation from the main dataset.
 - Appropriately labels the data set with descriptive variable names by removing parentheses & making syntactically valid names
 - Creates an independent tidy data set with the average of each variable grouped by activity and subject.
 - Finally, the tidy dataset is written to a file `tidy_dataset.txt`.

Refer in line comments of `run_analysis.R` script for detailed steps.

### Columns of Tidy Dataset File

Following columns are available in the output file:

  - FeatureId : Feature Identifier
  - Activity_Id : Activity Identifier
  - Activity : The name of the activity that the measurements correspond to, like `LAYING` or `WALKING`.

The detailed description of the below measurement types can be found in the `features_info.txt` file included in the given data.

  - tBodyAcc.mean.X
  - tBodyAcc.mean.Y
  - tBodyAcc.mean.Z
  - tBodyAcc.std.X
  - tBodyAcc.std.Y
  - tBodyAcc.std.Z
  - tGravityAcc.mean.X
  - tGravityAcc.mean.Y
  - tGravityAcc.mean.Z
  - tGravityAcc.std.X
  - tGravityAcc.std.Y
  - tGravityAcc.std.Z
  - tBodyAccJerk.mean.X
  - tBodyAccJerk.mean.Y
  - tBodyAccJerk.mean.Z
  - tBodyAccJerk.std.X
  - tBodyAccJerk.std.Y
  - tBodyAccJerk.std.Z
  - tBodyGyro.mean.X
  - tBodyGyro.mean.Y
  - tBodyGyro.mean.Z
  - tBodyGyro.std.X
  - tBodyGyro.std.Y
  - tBodyGyro.std.Z
  - tBodyGyroJerk.mean.X
  - tBodyGyroJerk.mean.Y
  - tBodyGyroJerk.mean.Z
  - tBodyGyroJerk.std.X
  - tBodyGyroJerk.std.Y
  - tBodyGyroJerk.std.Z
  - tBodyAccMag.mean
  - tBodyAccMag.std
  - tGravityAccMag.mean
  - tGravityAccMag.std
  - tBodyAccJerkMag.mean
  - tBodyAccJerkMag.std
  - tBodyGyroMag.mean
  - tBodyGyroMag.std
  - tBodyGyroJerkMag.mean
  - tBodyGyroJerkMag.std
  - fBodyAcc.mean.X
  - fBodyAcc.mean.Y
  - fBodyAcc.mean.Z
  - fBodyAcc.std.X
  - fBodyAcc.std.Y
  - fBodyAcc.std.Z
  - fBodyAccJerk.mean.X
  - fBodyAccJerk.mean.Y
  - fBodyAccJerk.mean.Z
  - fBodyAccJerk.std.X
  - fBodyAccJerk.std.Y
  - fBodyAccJerk.std.Z
  - fBodyGyro.mean.X
  - fBodyGyro.mean.Y
  - fBodyGyro.mean.Z
  - fBodyGyro.std.X
  - fBodyGyro.std.Y
  - fBodyGyro.std.Z
  - fBodyAccMag.mean
  - fBodyAccMag.std
  - fBodyBodyAccJerkMag.mean
  - fBodyBodyAccJerkMag.std
  - fBodyBodyGyroMag.mean
  - fBodyBodyGyroMag.std
  - fBodyBodyGyroJerkMag.mean
  - fBodyBodyGyroJerkMag.std

