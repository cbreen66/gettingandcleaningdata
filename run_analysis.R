#Check for "data.table" and "dplyr" packages

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("dplyr")) {
  install.packages("dplyr")
}

require("data.table")
require("dplyr")

#Load the activity labels and feature names
activityLabels <- read.table("./UCIHAR/activity_labels.txt", header = FALSE)
featureNames <- read.table("./UCIHAR/features.txt")

#Read the training data
message("Reading training data, patience please!")
subjectTrain <- read.table("UCIHAR/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("UCIHAR/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("UCIHAR/train/X_train.txt", header = FALSE)

#Read the test data
message("Reading test data, patience please!")
subjectTest <- read.table("UCIHAR/test/subject_test.txt", header = FALSE)
activityTest <- read.table("UCIHAR/test/y_test.txt", header = FALSE)
featuresTest <- read.table("UCIHAR/test/X_test.txt", header = FALSE)

#Combine the training and test data
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

#Add the variable names
colnames(features) <- t(featureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

#Merge the data
Alldata <- cbind(features,activity,subject)

#Use grep function to subset the data with only mean and standard deviation measurements
Grepsub <- grep(".*Mean.*|.*Std.*", names(Alldata), ignore.case=TRUE)

#Combine with the activity and subject columns
Grepcols <- c(Grepsub, 562, 563)

Finalset <- Alldata[,Grepcols]

#Use the descriptive activity names
Finalset$Activity <- as.character(Finalset$Activity)
for (i in 1:6){
  Finalset$Activity[Finalset$Activity == i] <- as.character(activityLabels[i,2])
}  

#Convert the activity variable to a factor
Finalset$Activity <- as.factor(Finalset$Activity)

#Use gsub function to write descriptive variable names
names(Finalset)<-gsub("Acc", "Accelerometer", names(Finalset))
names(Finalset)<-gsub("Gyro", "Gyroscope", names(Finalset))
names(Finalset)<-gsub("BodyBody", "Body", names(Finalset))
names(Finalset)<-gsub("Mag", "Magnitude", names(Finalset))
names(Finalset)<-gsub("-mean()", "Mean", names(Finalset), ignore.case = TRUE)
names(Finalset)<-gsub("-std()", "STD", names(Finalset), ignore.case = TRUE)
names(Finalset)<-gsub("-freq()", "Frequency", names(Finalset), ignore.case = TRUE)
names(Finalset)<-gsub("angle", "Angle", names(Finalset))
names(Finalset)<-gsub("gravity", "Gravity", names(Finalset))

#Convert the subject variable to a factor
Finalset$Subject <- as.factor(Finalset$Subject)
Finalset <- data.table(Finalset)

#Create the tidy dataset with average of each variable for each activity and each subject
Tidyset <- aggregate(. ~Subject + Activity, Finalset, mean)
Tidyset <- Tidyset[order(Tidyset$Subject,Tidyset$Activity),]

#Save the tidy dataset to file
write.table(Tidyset, file = "UCIHAR_TIDY.txt", row.name=FALSE)
