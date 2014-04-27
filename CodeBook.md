### Getting and Cleaning Data Peer Assessment Code Book

#### Final Output Variable Definitions

1.	Subject -> Range 1 - 30, each participant in the study has a unique ID ranging from 1 - 30.

2.	Activity -> This is the observed active body position for each of the variables measured.

	Range: Numeric values correspond to the original files codex.
	
		1.	WALKING
		2.	WALKING_UPSTAIRS
		3.	WALKING_DOWNSTAIRS
		4.	SITTING
		5.	STANDING
		6.	LAYING
		
	

3.	Mean of observed value for mean and std variables for time and frequency in the domain of the observation (for all names see below...)


#### Transformation Process

1.	For each data set (train and type) merge the column sets for activity (y_type.txt) and subject (subject_type.txt) with the observed data set (X_type.txt).  Label the columns for each measurement with the features.txt codex.  Label the first column as Subject and the second column as activity

2.	After merging the data sets together, I used a regular expression (\^.*(-mean\\(\\))|(-std\\(\\)).*) to filter out any columns that did not contain the desired measurements, standard deviation and mean.

3.  Convert the Activity and Subject column to Factors for ease of cross-cutting measurements and re-label the Activity factor with the values specified above.

4.	Then use the melt function (from library(reshape2)) to pivot the data from columns to rows using Subject and Activity as the pivot points.

5.  Once molten, use dcast to aggregate the observations by mean.

#### Script location

[Script for all work is location here.](https://github.com/kylepace/RCourseraCleaningPeer/blob/master/run_analysis.R)

Observed Values:

tBodyAcc.mean...X  
tBodyAcc.mean...Y  
tBodyAcc.mean...Z   
tBodyAcc.std...X  
tBodyAcc.std...Y  
tBodyAcc.std...Z  
tGravityAcc.mean...X  
tGravityAcc.mean...Y  
tGravityAcc.mean...Z  
tGravityAcc.std...X  
tGravityAcc.std...Y  
tGravityAcc.std...Z  
tBodyAccJerk.mean...X  
tBodyAccJerk.mean...Y  
tBodyAccJerk.mean...Z  
tBodyAccJerk.std...X  
tBodyAccJerk.std...Y  
tBodyAccJerk.std...Z  	
tBodyGyro.mean...X  
tBodyGyro.mean...Y  
tBodyGyro.mean...Z  
tBodyGyro.std...X  
tBodyGyro.std...Y  
tBodyGyro.std...Z  
tBodyGyroJerk.mean...X  
tBodyGyroJerk.mean...Y  
tBodyGyroJerk.mean...Z  
tBodyGyroJerk.std...X  
tBodyGyroJerk.std...Y  
tBodyGyroJerk.std...Z  
tBodyAccMag.mean..  
tBodyAccMag.std..  
tGravityAccMag.mean..  
tGravityAccMag.std..  
tBodyAccJerkMag.mean..  
tBodyAccJerkMag.std..  
tBodyGyroMag.mean..  
tBodyGyroMag.std..  
tBodyGyroJerkMag.mean..  
tBodyGyroJerkMag.std..  
fBodyAcc.mean...X  
fBodyAcc.mean...Y  
fBodyAcc.mean...Z  
fBodyAcc.std...X  
fBodyAcc.std...Y  
fBodyAcc.std...Z  
fBodyAccJerk.mean...X  
fBodyAccJerk.mean...Y  
fBodyAccJerk.mean...Z  
fBodyAccJerk.std...X  
fBodyAccJerk.std...Y  
fBodyAccJerk.std...Z  
fBodyGyro.mean...X  
fBodyGyro.mean...Y	  
fBodyGyro.mean...Z	  
fBodyGyro.std...X  
fBodyGyro.std...Y  	
fBodyGyro.std...Z  
fBodyAccMag.mean..  
fBodyAccMag.std..  
fBodyBodyAccJerkMag.mean..  
fBodyBodyAccJerkMag.std..  
fBodyBodyGyroMag.mean..  
fBodyBodyGyroMag.std..  
fBodyBodyGyroJerkMag.mean..  
fBodyBodyGyroJerkMag.std..  