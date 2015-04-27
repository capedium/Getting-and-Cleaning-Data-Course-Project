# Getting and Cleaning Data Course Project
This repo contains the work I have done for the course project in the Getting and Cleaning Data course.

Course URL: https://class.coursera.org/getdata-013

## Data set acquisition
The data set used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

You can download the data using the following link: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## File description
There are four files inside the repo:

* run_analysis.R

This is my script for performing the following analysis:
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	
* CodeBook.md

This is a code book that describes the variables, the data, and any transformations or work that I have performed to clean up the data.

* tidydata.txt

This is the tidy dataset produced by my R script. It is included just for reference. You can generate the same dataset using the "run_analysis.R" file and the accelerometers data set.

To view this file in a more friendly way, you can run the following code in R:

```R
newdata2 <- read.table("tidydata.txt", header=TRUE)
View(newdata2)
```

* README.md

It is the file you are looking at describing how the files are and how they works.

## Additional packages required
Besides a basic environment for R, you may need to download and install the following R packages:

* plyr package: http://cran.r-project.org/web/packages/plyr/index.html
* reshape2 package: http://cran.r-project.org/web/packages/reshape2/index.html

## How to run the analysis
1. First, fork the repository into your computer using Git, or download it through the "Download ZIP" button on the right panel of GitHub and unzip it.

2. Download the dataset from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and unzip it under the same folder with the "run_analysis.R" file.

3. Start R. Install any packages if necessary, i.e., run the following code if you need:

	```R
	install.packages("plyr")
	install.packages("reshape2")
	```

4. Change the working directory to the foler containing the "run_analysis.R" file using code:

	```R
	setwd("path/to/your/folder")
	```

5. Run the "run_analysis.R" script in R.

That's all, thanks for your attention. Hope it helps.
