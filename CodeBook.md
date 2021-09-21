# "run_analysis.R" code book

------------------------------------------
------------------------------------------

The dataset [1] was cleaned as follows:

  1.- The files "subject_train.txt, "X_train.txt", "y_train.txt" and "subject_test.txt, "X_test.txt", "y_test.txt" are
      column-bound, respectively. The "Subject" column in "subject_train.txt" is bound at the left of the first column 
      of "X_train.txt", and the "Activity" column is bound to the right of the last column in "X_train.txt". 
      The same applies to the "\_test.txt" files. Then, the resulting two datasets are merged into a single dataframe "*data".
  
  2.- The indexes for the required mean and standard deviation columns for each measurement in the dataframe are
      identified by matching the words "mean()" and "std()" in the elements of "features.txt"
      
  3.- The resulting indexes are matched to the indixes of the merged sigle dataframe "*data"*. Then, with the corrected indexes,
      the desired data is extracted from the dataframe "*data*".
      
  4.- To the resulting "*data_mean_std"* dataframe, the values of the "Activity" column are changed to the descriptive names
      provided in the "activity_labels.txt" as folows:
      
      - 1 -> Walking,
      - 2 -> Walking upstairs,
      - 3 -> Walking downstairs,
      - 4 -> Sitting,
      - 5 -> Standing,
      - 6 -> Laying.
       
  5.- Next, the column names in the dataframe "*data_mean_std"* are changed to the names provided in "features.txt", and the first
      and last columns are renamed to "Subject" and "Activity", respectively.
      
  6.-  Once the data set is clean and tidy, a second data set is created with the average of each variable for each activity and each subject.
  
  ---------------------------------
  ---------------------------------
  
  The data set contains the following variables:
  
  These signals were used to estimate variables of the feature vector for each pattern:  
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

  The set of variables that were estimated from these signals are: 

  - mean(): Mean value
  - std(): Standard deviation
  
  Additionally, the first and last columns of the data set "*data_mean_std*" corresponds to the variables "Subject" and "Activity", respectively.
  
  NOTE: In the data set "tidy_mean" the columns correspond to the average of the mean and standard deviation of each variable. Furthermore, the "Subject" 
        and "Activity" columns are placed in the first and second columns, respectively. 
        
  ------------------------------------------------
  ------------------------------------------------
  References
  
  [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
  Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

  
  
  
  
  
