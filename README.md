Peer-graded Assignment: Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zi  

Files:
        
                        
  CodeBook.md       code book that modifies and updates the available codebooks with 
                      the data to indicate all the variables and summaries calculated,
                      along with units, and any other relevant information.
                      
  README.md         explains the analysis files

  run_analysis.R    R script that does the following.:
                      Merges the training and the test sets to create one data set.
                      Extracts only the measurements on the mean and standard  
                        deviation for each measurement. 
                      Uses descriptive activity names to name the activities in the 
                        data set
                      Appropriately labels the data set with descriptive variable 
                        names. 
                      From the data set in step 4, creates a second, independent tidy 
                        data set with the average of each variable for each activity 
                        and each subject.
                        
  Tidy_Dataset.txt    Tidy data set with the average of each variable for each 
                       activity and each subject created by running script
                