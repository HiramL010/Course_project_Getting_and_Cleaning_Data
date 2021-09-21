# Course_project_Getting_and_Cleaning_Data

Cleaning of the dataset Human Activiy Recognition Using Smartphones Dataset [1].


The script used to perform the analysis is:

- "run_analysis.R"

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

A detailed explanation of the data and variables is given in the code book "CodeBook.mb".



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition 
on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of 
Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their 
institutions for its use or misuse. Any commercial use is prohibited.
