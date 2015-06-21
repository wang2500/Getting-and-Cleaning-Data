
# Course Project Submission

##This is the part for the Coursera Getting and Cleaning Data Course Project

## Code Book
###Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###According to the directions given by the instructor, I follow the project steps.

Step 1. Merge the data
Step 2. Extract parts of the data
Step 3/Step 4. Assign names to the raw data
Step 5. Establish tidy data set

Through finding out the length of each file, as well as the row numbers and column numbers to match up the relationship between each file from the zip.

combine 1: the combination of x_train and x_test given by the UCI HAR Dataset.zip
combine 2: the combination of y_train and y_test given by the UCI HAR Dataset.zip
combine 3: the combination of subject_train and subject_test by the UCI HAR Dataset.zip
combine: the combination of combine1,combine2, and combine3

some special functions used in the code:
grep: used to match the patterns of the raw data
ddply: used to automatically rematch everything to build new dataset



## run_analysis.R
This file shows how to get the tidy data set from the raw data, and it was separated into 5 parts showed 5 steps.

## average.txt
The final submission of the course project
Upload into R it will becomes a tiny clean data set combined with the files from the zip.
