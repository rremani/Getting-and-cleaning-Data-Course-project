# Course project code book

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the project can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

R script (run_analysis.R) which is attached in the repo will performs the following to clean up the data:

* Merges the training and test sets to create one data set, namely train/X_train.txt with test/X_test.txt.

* Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement.

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set which are walking, walkingupstairs, walkingdownstairs, sitting, standing, laying.

* The script also appropriately labels the data set with descriptive names: Names of the attributes are similar to the following are:
tbodyacc-mean-x 

tbodyacc-mean-y 

tbodyacc-mean-z 

tbodyacc-std-x 

tbodyacc-std-y 

tbodyacc-std-z 

tgravityacc-mean-x 

tgravityacc-mean-y

* Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.