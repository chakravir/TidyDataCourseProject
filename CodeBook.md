---
title: "CodeBook.md"
author: "Ravi Ramkissoon"
date: "6/21/2015"
output: html_document
---

### Course Project for Ravi Ramkissoon 
### Getting & Cleaning Data. June 2015
### CodeBook for Summary of Human Activity Recognition Data

#### Study Design

The input data for this project was downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Descriptions of the data source and format are at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Data Transformations

All data transformations are described in the run_analysis.R script which also implements all transformations. The following steps are taken in run_analysis.R to get and transform the data :

* the data is downloaded unless itis found in its expected location (hardata.zip)
* the data set, labels and subjects are loaded for both the training and the test data
* the data set, labels and subjects are merged from the training and test data sets into single data sets for each of the 3.
* columns storing mean or standard deviations of variables are denoted as variables of interest and the names and positions of these variables are written to vectors
* a new dataset is created which includes all labels, subjects and the columns of interest listed above
* labels are converted to activity names
* activities and subjects are converted to factors
* this new data set is written to a file - *har_new_data_set.txt*
* a combined factor is created from subject and activity factors and variable averages are calculated for every distinct subject-activity pair
* this new summary data set is written to a file - *har_summary.txt*

#### Code Book

Both data sets - *har_new_data_set* and *har_summary* contain the columns listed below. But *har_new_data_set* contains a single observation per line and *har_summary* contains one line for every subject-activity pair containing the mean of all values for that pair.

* *subject* - an identifier for the human subject being observed
* *activity* - the activity being performed during the observation
* *tBodyAcc-mean-X|Y|Z* - mean of the body component of the acceleration signal
* *tBodyAcc-std-X|Y|Z* - standard deviation of the body component of the acceleration signal
* *tGravityAcc-mean-X|Y|Z* - mean of the gravity component of the acceleration signal
* *tGravityAcc-std-X|Y|Z* - standard deviation of the gravity component of the acceleration signal
* *tBodyAccJerk-mean-X|Y|Z* - mean of the body linear acceleration signal derived in time
* *tBodyAccJerk-std-X|Y|Z* - standard deviation of the body linear acceleration signal derived in time
* *tBodyGyro-mean-X|Y|Z* - mean of the body angular velocity from the gyroscope signal
* *tBodyGyro-std-X|Y|Z* - standard deviation of the body angular velocity from the gyroscope signal
* *tBodyGyroJerk-mean-X|Y|Z* - mean of the body angular velocity derived in time
* *tBodyGyroJerk-std-X|Y|Z* - standard deviation of the body angular velocity derived in time
* *tBodyAccMag-mean* - mean of the body component of the magnitude of the acceleration signal
* *tBodyAccMag-std* - standard deviation of the magnitude of the body component of the acceleration signal
* *tGravityAccMag-mean* - mean of the gravity component of the magnitude of the acceleration signal
* *tGravityAccMag-std* - standard deviation of the magnitude of the gravity component of the acceleration signal
* *tBodyAccJerkMag-mean* - mean of the magnitude of the body linear acceleration signal derived in time
* *tBodyAccJerkMag-std* - standard deviation of the magnitude of the body linear acceleration signal derived in time
* *tBodyGyroMag-mean* - mean of the magnitude of the body angular velocity from the gyroscope signal
* *tBodyGyroMag-std* - standard deviation of the magnitude of the body angular velocity from the gyroscope signal
* *tBodyGyroJerkMag-mean* - mean of the magnitude of the body angular velocity derived in time
* *tBodyGyroJerkMag-std* - standard deviation of the magnitude of the body angular velocity derived in time
* *fBodyAcc-mean-X|Y|Z* - mean of the Fast Fourier Transform (FFT) of the body component of the acceleration signal
* *fBodyAcc-std-X|Y|Z* - standard deviation of the Fast Fourier Transform (FFT) of the body component of the acceleration signal
* *fBodyAccJerk-mean-X|Y|Z* - mean of the Fast Fourier Transform (FFT) of the body linear acceleration signal derived in time
* *fBodyAccJerk-std-X|Y|Z* - standard deviation of the Fast Fourier Transform (FFT) of the body linear acceleration signal derived in time
* *fBodyGyro-mean-X|Y|Z* - mean of the Fast Fourier Transform (FFT) of the body angular velocity from the gyroscope signal
* *fBodyGyro-std-X|Y|Z* - standard deviation of the Fast Fourier Transform (FFT) of the body angular velocity from the gyroscope signal
* *fBodyAccMag-mean* - mean of the Fast Fourier Transform (FFT) of the body component of the magnitude of the acceleration signal
* *fBodyAccMag-std* - standard deviation of the Fast Fourier Transform (FFT) of the magnitude of the body component of the acceleration signal
* *fBodyBodyAccJerkMag-mean* - mean of the magnitude of the Fast Fourier Transform (FFT) of the body linear acceleration signal derived in time
* *fBodyBodyAccJerkMag-std* - standard deviation of the magnitude of the Fast Fourier Transform (FFT) of the body linear acceleration signal derived in time
* *fBodyBodyGyroMag-mean* - mean of the Fast Fourier Transform (FFT) of the magnitude of the body angular velocity from the gyroscope signal
* *fBodyBodyGyroMag-std* - standard deviation of the Fast Fourier Transform (FFT) of the magnitude of the body angular velocity from the gyroscope signal
* *fBodyBodyGyroJerkMag-mean* - mean of the magnitude of the Fast Fourier Transform (FFT) of the body angular velocity derived in time
* *fBodyBodyGyroJerkMag-std* - standard deviation of the Fast Fourier Transform (FFT) of the magnitude of the body angular velocity derived in time

