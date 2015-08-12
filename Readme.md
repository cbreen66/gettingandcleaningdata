Getting and Cleaning Data Course Assignment

#Project aim
The aim of this project is to create a tidy dataset from Samsung Galaxy S smartphone accelerometer and gyroscope raw data. A group of 30 volunteers aged 19-48 performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) and the resultant data measures acceleration and velocity with time and frequency variables.

Further information on the raw data is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Project files
This repository contains four project files:

•	run_analysis.R : the R code run on the data set

•	UCIHAR_TIDY.txt : the clean dataset

•	CodeBook.md : the CodeBook explaining transformations made to create UCIHAR_TIDY.txt

•	README.md : an explanatory description of the project

#Raw data description

The dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. The training and test datasets are divided into subject, activity and features. 

Feature labels are provided in features.txt while the labels for each of the six activities are provided in activity_labels.txt.

#Clean data transformations
The run_analysis.R code transforms the raw data into a single text file which conforms to the principles of tidy data. The transformations are processed in five stages.

1.	Merge the training and the test sets to create one data set.
2.	Extract only the measurements on the mean and standard deviation for each measurement. 
3.	Use descriptive activity names to name the activities in the data set
4.	Appropriately label the data set with descriptive variable names
5.	Create a second, independent tidy data set with the average of each variable for each activity and each subject.

#Output
The independent and tidy dataset is contained in the UCIHAR_TIDY.txt file. This can be imported into R using the following code:

data <- read.table("UCIHAR_TIDY.txt", header = TRUE)
View(data)

