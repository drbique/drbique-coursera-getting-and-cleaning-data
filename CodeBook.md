    The run_analysis.R script performs the steps described in README.md ad loading data 
	    manipulation package library(dplyr)


    Download the dataset 
        Dataset downloaded as described in README.md to create folder and subfolders
           with text (.txt) files:
		   		   UCI HAR Dataset
				      test
					  train
	
    Dataframes created from text files in unzipped dataset:
     activity_labels: 6 rows, 2 columns
        list of activities performed when the corresponding measurements were taken and their  
		  codes (labels)
     features: 561 rows, 2 columns
        contains functions (features) selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
     subject_test: 2947 rows, 1 column
        contains test data of 9/30 volunteer test subjects being observed
     subject_train: 7352 rows, 1 column
        contains train data of 21/30 volunteer subjects being observed    
	 x_test: 2947 rows, 561 columns
        contains recorded features test data
     x_train: 7352 rows, 561 columns
        contains recorded features train data     
	 y_test: 2947 rows, 1 columns
        contains test data of activity code labels
     y_train: 7352 rows, 1 columns
        contains train data of activity code labels

    Merged train and the test sets:
        S: 10299 rows, 1 column
		   created by merging subject_train and subject_test using rbind() function
        X: 10299 rows, 561 columns
		   created by merging x_train and x_test using rbind() function
        Y: 10299 rows, 1 column
		   created by merging y_train and y_test using rbind() function
        merged_dataset: 10299 rows, 563 column
		   created by merging S, X and Y using cbind() function

    Extracted only the measurements on the mean and standard deviation for each measurement:
	    mean_and_sd_data: 10299 rows, 88 columns
		   created by subsetting merged_dataset, selecting only columns with subject and code containing mean and standard deviation for each measurement

    Appropriately labels the data set with descriptive variable names.:
        data in code column of the mean_and_sd_data replaced with corresponding   
		   activity taken from second column of the activity_labels variable
        variables in mean_and_sd_data renamed:
          strings starting with character t replaced by TimeDomain_
          strings starting with character f replaced by FrequencyDomain_
          Gyro replaced by Gyroscope
          Acc replaced by Accelerometer
          Mag replaced by Magnitude
          BodyBody replaced by Body
        
    Created independent tidy data set with the average of each variable for each activity and each subject:
        tidy_dataset: 180 rows, 81 columns
		  average of each variable for each activity and each subject
		  
    Saved dataframe tidy_dataset in Tidy_Dataset.txt file.

