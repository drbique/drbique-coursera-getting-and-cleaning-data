# Load data manipulation package:
library(dplyr)

# Download dataset and unzip it:
filename <- "dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Define dataframes:
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 1: Merges the training and the test sets to create one data set.
S <- rbind(subject_train, subject_test)
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
merged_dataset <- cbind(S, Y, X)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
mean_and_sd_data <- merged_dataset %>% select(subject, code, contains("mean"), contains("std"))

# Step 3: Uses descriptive activity names to name the activities in the data set
mean_and_sd_data$code <- activity_labels[mean_and_sd_data$code, 2]

# Step 4:Appropriately labels the data set with descriptive variable names. 
names(mean_and_sd_data)[2] = "activity"
names(mean_and_sd_data)<-gsub("^t", "TimeDomain_", names(mean_and_sd_data))
names(mean_and_sd_data)<-gsub("^f", "FrequencyDomain_", names(mean_and_sd_data))
names(mean_and_sd_data)<-gsub("Gyro", "Gyroscope", names(mean_and_sd_data))
names(mean_and_sd_data)<-gsub("Acc", "Accelerometer", names(mean_and_sd_data))
names(mean_and_sd_data)<-gsub("Mag", "Magnitude", names(mean_and_sd_data))
names(mean_and_sd_data)<-gsub("BodyBody", "Body", names(mean_and_sd_data))


# Step 5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_dataset <- aggregate(mean_and_sd_data[,3:81], by = list(activity = mean_and_sd_data$activity, subject = mean_and_sd_data$subject),FUN = mean)

write.table(tidy_dataset, "Tidy_Dataset.txt", row.name=FALSE)
