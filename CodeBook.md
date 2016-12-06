CodeBook for the tidy dataset in Assignment Getting and Cleaning Data
======================================================================

Getting Data source
-------------------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The dataset "UCI HAR Dataset" have been downloaded to make changes based on the question given.

Introduction
-------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

Attribute Information
----------------------
The dataset provide few record which is :

* feature.txt
* activity_labels.txt
* subject_train.txt
* x_train.txt
* y_train.txt
* subject_test.txt
* x_test.txt
* y_test.txt

Question 1 : Merge the training and test sets to create one data set
---------------------------------------------------------------------
After setting the directory for the files, read all the data given in table.
Assign each of the dataset with appropriate column names.
Then merge the data using subjectData <- rbind().

Question 2 : Extract measurement of mean and standard deviation only.
----------------------------------------------------------------------
Create meanStd to get only columns with mean() or std() in their names based on the data have been merge before.

Question 3 : Use descriptive activity names to name the activities in the data set
-----------------------------------------------------------------------------------
Make sure the y_test and y_train have been merge together, assign as y_data.
Call the activity_labels.txt and y_data is given name the column as "Activity"

Question 4 : Label the data set with descriptive variable name
---------------------------------------------------------------
Name subjectData as "Subject".
Then merge all set using cbind and assign as finalData 

Ans : finalData <- cbind(x_data, y_data, subjectData)

Question 5 : From the data set in step 4, creates a second,independent tidy data set with the average of each variable for each activity and each subject. 
----------------------------------------------------------------------------------------------------------------------------------------------------------
Per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject (averageData)
Lastly, create one tidy data as tidy,txt from all the cleaning dataset that have been done.

Ans : write.table(averageData, "tidy.txt", row.name=FALSE)
