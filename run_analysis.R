########  Packages to be used

library(readr)
library(dplyr) 
library(data.table)
library(stringr)

########  Directories

directory <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train"
directory2 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test"

########  Reading the data

file_names <- list.files(directory, full.names = TRUE) 
file_names2 <- list.files(directory2, full.names = TRUE) 
# Reading the 3 files subject_train.txt, X_train.txt, and y_train.txt
DT <- lapply(file_names, function(x) read.table(x, header = FALSE))
DT2 <- lapply(file_names2, function(x) read.table(x, header = FALSE))

###############################################################################
###########  1. Merges the training and the test sets to create one data set ##
###############################################################################

########  Merging the 3 files in train and test folders, respectively

# Merging them into a single data frame (subject_train and y_train are bound
# to the first and last column of X_train, respectively)
DT_merged <- do.call(cbind,DT) 
DT2_merged <- do.call(cbind,DT2) 

########  Binding DT_merged and DT2_merged into a single data frame
data <- rbind(DT_merged, DT2_merged)

############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement#
############################################################################################


########  Reading the variable/column names from features.txt
directory3 <- "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt"
f_names <- read.table(directory3, header = FALSE)

# Finding the indexes of the variables that correspond to the mean and standard 
# deviation columns for each measurement in the data frame "data"
mean_std <- str_which(f_names[ ,2], "mean\\(\\)|std()")

# First, we have to match the indexes from mean_std to the number of columns in "data".
# The indexes were obtained from f_names whose number of columns is 561, but in "data"
# we added two extra columns when merging the three .txt files

# Shifting the columns one column to the right and adding the index for the "subject" 
# and "training labels" columns
mean_std <- as.integer(c(1, mean_std+1, 563)) 

# Selecting only the columns that correspond to the mean and std
data_mean_std <- data[ ,mean_std]


###################################################################################
#### 3. Uses descriptive activity names to name the activities in the data set ####
###################################################################################

# Changing the values of the activity column "V1.2" to descriptive names
act_labels <- c("Walking", "Walking upstairs", "Walking downstairs",
                "Sitting", "Standing", "Laying")

for(i in 1:6){
  data_mean_std["V1.2"][data_mean_std["V1.2"] == i] <- act_labels[i]
}

################################################################################
### 4. Appropriately labels the data set with descriptive variable names ####### 
################################################################################

# To set the variable names, we are going to use the names from feature.txt.
# However, we already have this data in "f_names", so, we are going to select 
# the needed column names
col_name <- str_subset(f_names[ ,2], "mean\\(\\)|std()")

# Now, we have to add the variable name for the first and last column
col_name <- c("Subject", col_name, "Activity")

# Finding the old names
old_name <- names(data_mean_std)

# Changing to the new names
setnames(data_mean_std, old = old_name, new = col_name)

# Saving the Tidy data set
write.table(data_mean_std, "tidy_dataset.txt", sep = "\t", row.names = FALSE)

###################################################################################
## From the data set in step 4, creates a second, independent tidy data set with ## 
##          the average of each variable for each activity and each subject.     ##
###################################################################################

# To be independent, we read the tidy.dataset.txt
tidy_data <- read.table("./tidy_dataset.txt", header = TRUE)

# Splitting the data by Subject and Activity, and computing the mean of each column
tidy_mean <- tidy_data %>% group_by(Subject, Activity) %>%
  summarise_if(is.numeric, mean)

write.table(tidy_mean, "tidy_mean.txt", sep = "\t", row.names = FALSE)

