##Coursera Getting and Cleaning Data project submission

#step1
##import x_train data from the UCI HAR zip
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
##import y_train data from the UCI HAR zip
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
##import x_test data from the UCI HAR zip
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
##import y_train data from the UCI HAR zip
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
#combine training set and test set
combine1<- rbind(xtrain, xtest)
#combine training labels and test labels
combine2<- rbind(ytrain, ytest)


#step2
#import features file
features <- read.table("./UCI HAR Dataset/features.txt")
#finding the match pattern of mean and standard deviation from the second column of features
msd <- grep("-(mean|std)\\(\\)", features[, 2])
#add mean and std as extra column of combine1
combine1 <- combine1[, msd]
#add the names to combine1
names(combine1) <- features[msd, 2]

# Step 3
#import activity_labels file
activities_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
#add one more column to combine1
combine2[, 1] <- activities_labels[combine2[, 1], 2]
#add the names to combine2
names(combine2) <- "activity"

# Step 4
#import subject_train and subject_test file
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#combine subject train and subject test file
combine3<- rbind(subjecttrain, subjecttest)
#add names to combine 3
names(combine3) <- "subject"
#combine all three data sets
combine<- cbind(combine1, combine2, combine3)

# Step 5
#combine result of combine, subject, activity into average data frame
averagedata <- ddply(combine, .(subject, activity), function(x) colMeans(x[, 1:66]))
#create averagedata.txt by using write.table command
write.table(averagedata, "averagedata.txt", row.names=FALSE)
View(averagedata)

