RCourseraCleaningPeer
=====================

Peer assignment for Getting and Cleaning Data - Coursera

### Main Script (run_analysis.R)

Algorithm reads training and test data sets and performs following routine.

#### Run_analysis

1.	Read Features

	`features <- read.table('features.txt')
	
2.	Run Combine Data on both file types (train and test)

	`testData <- combineFiles(features, 'test')
	
	`trainData <- combineFiles(features, 'train')

3.	Combine test and training data set
	
	`rbind(trainData, testData)
	
4.	Get rid of unneeded columns with grep

	`combined[, c(1, 2, grep('^.*(-mean\\(\\))|(-std\\(\\)).*', colnames(combined)))]
	
5.	Read Activity Labels
	
	`actLabels <- read.table('activity_labels.txt')
	
6.	Label the Activity in main data set

	`actLabels <- read.table('activity_labels.txt')[, 2]
	
	`combined$Activity <- as.factor(combined$Activity)
	
	`levels(combined$Activity) <- actLabels
	
7.  Melt dataset by Subject and Activity against the rest of the variables

	`melted <- melt(out, id = c("Subject", "Activity"), measures = features)
	
	`pivoted <- dcast(melted, Subject + Activity ~ variable, mean)
	
8.	Returns the final tidied up data.


#### Combine File Function (combineFiles(features, type))
Takes feature list and type (train or test) to add activity and subject to data recorded.

Output is data set with labelled columns, subject, activity and 561 vectors of domain variables.

1.	Read Test Data, Assign Column Names

	`testData <- read.table('./test/X_test.txt')
	
	`colnames(ts) <- features[, 2]

2.	Read Test Labels, Subjects, Rename column

	`testLabels <- read.table('./test/y_test.txt')
	
	`colnames(testLabels) <- 'Activity'
	
	`testSubjects <- read.table('./test/subject_test.txt')
	
	`colnames(testSubjects) <- 'Subject'
	
3.	Stitch data together
	
	`testCombined <- cbind(testSubjects, testLabels, testData)
	
4.  Output stitched together data set