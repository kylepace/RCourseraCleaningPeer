combineFiles <- function(features, type) {
	dt <- read.table(paste('./', type, '/', 'X_', type, '.txt', sep = ''))
	dtActivities <- read.table(paste('./', type, '/', 'y_', type, '.txt', sep = ''))
	dtSubject <- read.table(paste('./', type, '/', 'subject_', type, '.txt', sep = ''))
	
	colnames(dt) <- features[, 2]
	colnames(dtActivities) <- 'Activity'
	colnames(dtSubject) <- 'Subject'
	combined <- cbind(dtSubject, dtActivities, dt)
	combined
}

run_analysis <- function()  {
	require('reshape2')
	
	features <- read.table('features.txt')
	testData <- combineFiles(features, 'test')
	trainData <- combineFiles(features, 'train')
	combined <- rbind(trainData, testData)
	
	out <- combined[, c(1, 2, grep('^.*(-mean\\(\\))|(-std\\(\\)).*', colnames(combined)))]
	
	# Rename
	actLabels <- read.table('activity_labels.txt')[, 2]
	out$Activity <- as.factor(out$Activity)
	levels(out$Activity) <- actLabels
	
	#Tidy it up
	melted <- melt(out, id = c("Subject", "Activity"), measures = features)
	pivoted <- dcast(melted, Subject + Activity ~ variable, mean)
	pivoted
}