#------------------------------------------------------------------------------
# Programe Name: run_analysis
# Description  : 
#     This programe will download the required file if not already downloaded
#     and creates "Tidy_DataSet.txt" file.
#
# Created By  : Subrat
#------------------------------------------------------------------------------

	# Create the data folder, download the data file & Unzip it
	if(!file.exists("./data")){dir.create("./data")}
  
	if(!file.exists("./data/MyData.zip")) {
		fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
		download.file(fileUrl,destfile="./data/MyData.zip")
		unzip(zipfile="./data/MyData.zip",exdir="./data")
	} else {
		unzip(zipfile="./data/MyData.zip",exdir="./data")
	}
	#--------------------------------------------------------------------------
	#Step1 : Merges the training and the test sets to create one data set.
	#--------------------------------------------------------------------------
	# Load Train Data
	x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
	y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
	subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)	
	# Load Test Data
	X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
	y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
	subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
	# Load Dim Data
	features <- read.table("./data/UCI HAR Dataset/features.txt")
	activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
	
	# Merge Train and Test data by rows
	x <- rbind(x_train,X_test)
	y <- rbind(y_train, y_test)
	s <- rbind(subject_train, subject_test)
	
	# Merge activity_name by activity_id on y data set	
	y_activity <- merge(y,activities,by="V1", sort=F)
	
	tidyDataSet <- cbind(x, s, y_activity)	
	
	# Friendly names to Merged Dataset
	featureNames <- as.character(features[,2])
	New_labels <- c(featureNames,"FeatureId","Activity_Id","Activity")	
	colnames(tidyDataSet) <- New_labels
	
	#----------------------------------------------------------------------------------------------
	#Step2 : Extracts only the measurements on the mean and standard deviation for each measurement
	#----------------------------------------------------------------------------------------------
	Mean_colls <- grep("mean()", colnames(tidyDataSet), fixed=TRUE)
	SD_colls <- grep("std()", colnames(tidyDataSet), fixed=TRUE)
	TotalColumns <- sort(c(Mean_colls, SD_colls))
	NewDataSet <- tidyDataSet[, c(562,563,564,TotalColumns)]
	#NewDataSet <- tidyDataSet[,grepl("mean()|std()|FeatureId|Activity_Id|Activity", names(tidyDataSet))]	
	NewtidyDS <- NewDataSet[, !grepl("Freq", colnames(NewDataSet))] #remove meanFreq columns
	
	# Remove unwanted variables from the memory
	rm(x_train, y_train,subject_train,X_test, y_test,subject_test,tidyDataSet)
		
	#------------------------------------------------------------------------------
	#Step3 : Uses descriptive activity names to name the activities in the data set
	#------------------------------------------------------------------------------
	names(features) <- c('feature_id', 'feature_name')
	names(activities) <- c('Activity_ID', 'Activity')
	
	#------------------------------------------------------------------------------
	#Step4 : Appropriately labels the data set with descriptive variable names
	#------------------------------------------------------------------------------
	# Remove parentheses & Make syntactically valid names
	names(NewtidyDS) <- gsub('\\(|\\)',"",names(NewtidyDS), perl = TRUE)
	names(NewtidyDS) <- make.names(names(NewtidyDS))

	#------------------------------------------------------------------------------
	#Step5 : Creates an independent tidy data set with the average of each variable 
	#        for each activity and each subject.
	#------------------------------------------------------------------------------
	# let's melt the data 
	require(reshape2) 
	melted_tidyDS <- melt(NewtidyDS, id=c("FeatureId","Activity_Id","Activity")) 
	# cast the data back to the tidy_data format 
	tidy_data <- dcast(melted_tidyDS, formula = FeatureId + Activity_Id + Activity ~ variable, mean) 
	
	# Write the tidy data set to a file 
	write.table(tidy_data, file="./data/UCI HAR Dataset/tidy_dataset.txt", sep="\t", row.name=FALSE) 
	# Remove all variables from the memory 
	rm(list=ls())
	cat(paste("Tidy_DataSet.txt is saved at ",getwd(),"/data/UCI HAR Dataset"))
	
	