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
#combine x_train and x_test
combine1<- rbind(xtrain, xtest)

combine2<- rbind(ytrain, ytest)


#step2

features <- read.table("./UCI HAR Dataset/features.txt")

msd <- grep("-(mean|std)\\(\\)", features[, 2])

combine1 <- combine1[, msd]

names(combine1) <- features[msd, 2]

# Step 3

activities_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

combine2[, 1] <- activities_labels[combine2[, 1], 2]

names(combine2) <- "activity"

# Step 4
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
combine3<- rbind(subjecttrain, subjecttest)

names(combine3) <- "subject"

combine<- cbind(combine1, combine2, combine3)

# Step 5
averagedata <- ddply(combine, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averagedata, "averagedata.txt", row.names=FALSE)
View(averagedata)

