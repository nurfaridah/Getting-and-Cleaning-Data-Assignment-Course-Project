##getting and cleaning data assignment

setwd("C:/Users/saya/Desktop/DS/real kuiz/Getting and Cleaning Data/week 4/assigment")

## 1.Merges the training and the test sets to create one data set.
##read data from UCI HAR Dataset
features = read.table("UCI HAR Dataset/features.txt", header=FALSE) 
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE) 

##read data from test
subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
xTest = read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
yTest = read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)

##read data from train
subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
xTrain = read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
yTrain = read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
x_data <- rbind(xTest, xTrain)
y_data <- rbind(yTest, yTrain)

##merge data train and test
subjectData <- rbind(subjectTrain, subjectTest)

## 2. extract mean and standard deviation
# get only columns with mean() or std() in their names
meanStd <- grep("-(mean|std)\\(\\)", features[, 2])

##subset the desired column
x_data <- x_data[, meanStd]

##correct the column names
names(x_data) <- features[meanStd, 2]

## 3. Use descriptive activity names to name the activities in the data set
y_data[, 1] <- activityLabels[y_data[, 1], 2]
names(y_data) <- "Activity"


## 4. label the data set with descriptive variable name
names(subjectData) <- "Subject"
##finalData <- cbind(subjectData,y_data, x_data)
finalData <- cbind(x_data, y_data, subjectData)

## 5. From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject. 
averageData <- ddply(finalData, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

write.table(averageData, "tidy.txt", row.name=FALSE)

## to read the tidy data
tidy = read.table("tidy.txt", header=FALSE)






