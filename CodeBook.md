# Codebook

This codebook describes `run_analysis.R` and `tidy-data-set.txt` files in more detail.

### run_analysis.R

The `run_analysis.R` script does the following:

 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### tidy-data-set.txt

The `tidy-data-set.txt` table contains the following parameters (based in the README.md file in the [originial data set]((http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))).

 - `subject`: subject who performed the activity; its range is from 1 to 30.
 - `activity_label`: one of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
 - `tBodyAccMeanX`, `tBodyAccMeanY`, `tBodyAccMeanZ`, etc.: means and standard deviations of the corresponding features.
