# R code for getting the tidy data with averages
table1 <- read.table("UCI HAR Dataset/train/X_train.txt")
table2 <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(table1, table2)
table1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
table2 <- read.table("UCI HAR Dataset/test/subject_test.txt")
S <- rbind(table1, table2)
table1 <- read.table("UCI HAR Dataset/train/y_train.txt")
table2 <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- rbind(table1, table2)

features <- read.table("UCI HAR Dataset/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "merged_clean_data.txt")

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result,"tidyData_set_with_average.txt")