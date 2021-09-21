# Course_project_Getting_and_Cleaning_Data

Cleaning of the dataset Human Activiy Recognition Using Smartphones Dataset [1].


The script used to perform the analysis is:

- "run_analysis.R"

With this script both tidy data sets can be obtained. The first data set is the mean and standard deviation of each measurement, where the values of
the "Activity" column were change to a more descriptive name. Furthermore, the names of the columns were changes to the corresponding names in the 
"features.txt" file. The second data set is obtained from the first one by computing the average of each variable for each activity and each subject.

A detailed explanation of how the script works, the data used, and the variables is given in the code book "CodeBook.mb".



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition 
on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of 
Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their 
institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
