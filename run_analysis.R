# run_analysis.R
# Course Project for Ravi Ramkissoon 
# Course: Getting & Cleaning Data. June 2015
# Summary of Human Activity Recognition Data
 
data_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
data_description<-'http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones'
data_zip<-'hardataset.zip'
setwd('~/datasciencecoursera/tidy-project')
activities<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

# Download the data
if (!file.exists(data_zip)) {
  download.file(data_url, destfile = data_zip, method = "curl")
  dateDownloaded <- date(); dateDownloaded
  fileConn<-file("date-downloaded.txt")
  writeLines(c(dateDownloaded), fileConn)
  close(fileConn)
}

# load the training set, labels and subjects
train_set <- read.table(unz(data_zip, "UCI HAR Dataset/train/X_train.txt"))
train_labels <- read.table(unz(data_zip, "UCI HAR Dataset/train/y_train.txt"))
train_subjects <- read.table(unz(data_zip, "UCI HAR Dataset/train/subject_train.txt"))

# load the test training set, labels and subjects
test_set <- read.table(unz(data_zip, "UCI HAR Dataset/test/X_test.txt"))
test_labels <- read.table(unz(data_zip, "UCI HAR Dataset/test/y_test.txt"))
test_subjects <- read.table(unz(data_zip, "UCI HAR Dataset/test/subject_test.txt"))

# merge test and training sets and labels
all_set <-rbind(train_set,test_set)
all_labels<-rbind(train_labels, test_labels)
names(all_labels)[1]<-'label'
all_subjects<-rbind(train_subjects, test_subjects)
names(all_subjects)[1]<-'subject'
    
# extract mean, std dev for each measurement and merge with subjects and activities
# columns 1 and 2 will be the subjects and activities
# additional cols will correspond to the following feature cols
mean_std_cols<-c(1, 2, 3, 4, 5, 6, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)
mean_std_col_names<-c("tBodyAcc-mean-X", "tBodyAcc-mean-Y", "tBodyAcc-mean-Z", "tBodyAcc-std-X", "tBodyAcc-std-Y", "tBodyAcc-std-Z", "tGravityAcc-mean-X", "tGravityAcc-mean-Y", "tGravityAcc-mean-Z", "tGravityAcc-std-X", "tGravityAcc-std-Y", "tGravityAcc-std-Z", "tBodyAccJerk-mean-X", "tBodyAccJerk-mean-Y", "tBodyAccJerk-mean-Z", "tBodyAccJerk-std-X", "tBodyAccJerk-std-Y", "tBodyAccJerk-std-Z", "tBodyGyro-mean-X", "tBodyGyro-mean-Y", "tBodyGyro-mean-Z", "tBodyGyro-std-X", "tBodyGyro-std-Y", "tBodyGyro-std-Z", "tBodyGyroJerk-mean-X", "tBodyGyroJerk-mean-Y", "tBodyGyroJerk-mean-Z", "tBodyGyroJerk-std-X", "tBodyGyroJerk-std-Y", "tBodyGyroJerk-std-Z", "tBodyAccMag-mean", "tBodyAccMag-std", "tGravityAccMag-mean", "tGravityAccMag-std", "tBodyAccJerkMag-mean", "tBodyAccJerkMag-std", "tBodyGyroMag-mean", "tBodyGyroMag-std", "tBodyGyroJerkMag-mean", "tBodyGyroJerkMag-std", "fBodyAcc-mean-X", "fBodyAcc-mean-Y", "fBodyAcc-mean-Z", "fBodyAcc-std-X", "fBodyAcc-std-Y", "fBodyAcc-std-Z", "fBodyAccJerk-mean-X", "fBodyAccJerk-mean-Y", "fBodyAccJerk-mean-Z", "fBodyAccJerk-std-X", "fBodyAccJerk-std-Y", "fBodyAccJerk-std-Z", "fBodyGyro-mean-X", "fBodyGyro-mean-Y", "fBodyGyro-mean-Z", "fBodyGyro-std-X", "fBodyGyro-std-Y", "fBodyGyro-std-Z", "fBodyAccMag-mean", "fBodyAccMag-std", "fBodyBodyAccJerkMag-mean", "fBodyBodyAccJerkMag-std", "fBodyBodyGyroMag-mean", "fBodyBodyGyroMag-std", "fBodyBodyGyroJerkMag-mean", "fBodyBodyGyroJerkMag-std")

new_set<-all_subjects
new_set["activity"]<-all_labels["label"]
for (col in seq_len(length(mean_std_cols))) {
  new_set[mean_std_col_names[col]]<-all_set[mean_std_cols[col]]
}

# set activity names and convert labels and subjects to factors
activity_name <-function(n) { activities[n] }
new_set["activity"]<-lapply(new_set["activity"],activity_name)
new_set["activity"]<-as.factor(new_set[["activity"]])
new_set["subject"]<-as.factor(new_set[["subject"]])

# write tidy dataset (from step 4) to file
write.table(new_set, file="./har_new_data_set.txt",row.name=FALSE)

# get variable averages by splitting on a combined factor of subject and activity
summary_set <- aggregate(new_set[c(3:68)], by=list(new_set$subject, new_set$activity), FUN=mean)
names(summary_set)[1]='subject'
names(summary_set)[2]='activity'

# write summary (from step 5) to text file
write.table(summary_set, file="./har_summary.txt",row.name=FALSE)
