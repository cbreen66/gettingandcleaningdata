CodeBook

This code book describes the study design for the Human Activity Recognition Using Smartphones Data Set available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A description of the raw data obtained is also included.

It then describes the transformations made to the raw data using the code contained in run_analysis.R.

Finally, the document describes the variables and units used in the final tidy dataset which is found in the “UCIHAR_TIDY.txt” space-delimited file.

#Study design

A group of 30 volunteers aged 19-48 years performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) while wearing a Samsung Galaxy S II smartphone on the waist. Using the embedded accelerometer and gyroscope, the experiment captured triaxial linear acceleration and triaxial angular velocity measurements at a constant rate of 50Hz. The experiments were also video-recorded to facilitate manual labelling of activities.

The dataset obtained was randomly partitioned into two sets, where 70% of the volunteers were selected for the training data and 30% for the test data.

Each record in the raw data contains:
-	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-	Triaxial angular velocity from the gyroscope. 
-	A 561-feature vector with time and frequency domain variables. 
-	An activity label. 
-	An identifier of the subject who carried out the experiment.

#Raw data

The raw data includes the following files:

‘README.txt’: an explanatory file for the Human Activity Recognition Using Smartphones Dataset

‘features_info.txt’: Information about the variables used on the feature vector.

'features.txt': A list of all features.

'activity_labels.txt': Six labels for each of the activities

'train/X_train.txt': The training dataset comprising 70% of study participants

'train/y_train.txt': Labels for the training dataset.

'test/X_test.txt': The test dataset comprising 30% of study participants.

'test/y_test.txt': Labels for the test dataset.

'train/subject_train.txt': An identifier for the subject who performed the activity for each window sample (range 1:30). 

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians per second.

#Summary choices

The following transformations were performed on the raw data:

1.	The training and test datasets were merged to form a single dataset. Feature names were added from ‘features.txt’.
2.	Measurements of mean and standard deviation were extracted using the grep() function on the unified dataset.
3.	Activities in the unified dataset were named using ‘activity_labels.txt’.
4.	Activities was reclassified as a factor variable
5.	Variables in the unified dataset were renamed using descriptive and easily understood terms. The full list of renames is as follows:
a.	Acc = Accelerometer
b.	Gyro = Gyroscope
c.	Mag = Magnitude
6.	Subject was reclassified as a factor variable.

#Codebook

The output data UCIHAR_TIDY.txt is a a space-delimited value file. The header line contains the names of the variables. 

It contains the mean and standard deviation values for each of the variables in the raw data. The X,Y and Z measurements represent the three-axis measurements. The variable list is as follows:

Subject: Numerical identifier of each subject, range 1:30
Activity: Categorical variable of each of the six activities
TBodyAccelerometer: Triaxial (X,Y,Z) measurements from the body motion accelerometer including Mean, STD, JerkMean,JerkSTD, Magnitude Mean, MagnitudeSTD, JerkMagnitudeMean and JerkMagnitudeSTD

TGravityAccelerometer: Tri-axial measurements from the gravity motion accelerometer including Mean, STD, Magnitude Mean and Magnitude STD

TBodyGyroscope: Triaxial measurements from the body motion gyroscop including mean, STD, JerkMean, JerkSTD, MagnitudeMean, MagnitudeSTD, JerkMagnitudeMean and JerkMagnitudeSTD.

FBodyAccelerometer: Fast Fourier Transformation measurement from the body motion accelerometer including meanXYZ, meanFreqXYZ,JerkMeanXYZ,JerkSTDXYZ, JerkMeanFreqXYZ, Magnitude Mean, Magnitude STD, MagnitudeMeanFreq, JerkMagnitudeMean, JerkMagnitudeSTD and JerkMagnitudeMeanFreq.


FBodyGyroscope: Fast Fourier Transformation measurement from the body motion gyroscope including MeanXYZ, STDXYZ, MeanFreqXYZ, MagnitudeMean, MagnitudeSTD, JerkMagnitudeMean,JerkMagnitudeSTD,JerkMagnitudeMeanFreq.

Angle(TimeBodyAccelerometerMean,Gravity): measured in radians per second
Angle(TimeBodyAccelerometerJerkMean),GravityMean): measured in radians per second
Angle(TimeBodyGyroscopeMean,GravityMean): measured in radians per second
Angle(TimeBodyGyroscopeJerkMean,GravityMean): measured in radians per second
Angle(X/Y/Z,GravityMean): measured in radians per second
 
