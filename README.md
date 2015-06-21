---
title: "README.md"
author: "Ravi Ramkissoon"
date: "6/21/2015"
output: html_document
---

### Course Project for Ravi Ramkissoon 
### Getting & Cleaning Data. June 2015
### Summary of Human Activity Recognition Data

This course project submission consists of the following files :

* *README.md* - this file describing the contents of the project directory
* *CodeBook.md* - a code book that describes the variables, the data, and transformations performed to clean up the data
* *run_analysis.R* - an R script that performs all steps from downloading the data, through processing and transforming it to storing the new data sets
* *har_new_data_set.txt* - the new, tidy data set generated in step 4 of the instructions
* *har_summary.txt* - the new, tidy data set generated in step 5 of the instructions
* *hardataset.zip* - this is the file that the original dataset is expected in or will be downloaded to
* *date-downloaded.txt* - this is the date when the original data was downloaded to *hardataset.zip*

*run_analysis.R* can be run standalone in any directory and will download *hardataset.zip* if it does not exist in the current directory. It will then perform several transformations of the original dataset as described in *CookBook.md* and will write the 2 new, tidy data sets to files : *har_summary.txt* and *har_summary.txt*.


