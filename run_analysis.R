# This is the code file for getting the tidy dataset specified in the course project of 
# the Getting and Cleaning Data Course on Coursera.

# Step 1: Merges the training and the test sets to create one data set
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", colClasses="numeric")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", colClasses="numeric")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
feature_names <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

train <- cbind(subject_train, ytrain, xtrain)
test <- cbind(subject_test, ytest, xtest)
data <- rbind(train, test)

# Step 2: Appropriately labels the data set with descriptive variable names
names(data) <- c("subject","activity",as.character(feature_names[,2]))

# Step 3: Extracts only the measurements on the mean and standard deviation for each measurement
data <- data[,c(1,2,grep("mean\\(\\)|std\\(\\)", names(data)))]

# Step 4: Uses descriptive activity names to name the activities in the data set
data$activity <- activity_labels[data$activity,2]

# Step 5: From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
library(plyr)
library(reshape2)
newdata <- ddply(data, .(subject,activity), numcolwise(mean))
newdata <- melt(newdata, id.vars = c("subject","activity"), measure.vars = names(data)[-(1:2)])
names(newdata) <- c("subject","activity","feature","mean")
write.table(newdata, "tidydata.txt", row.names = FALSE) #, quote = FALSE)

