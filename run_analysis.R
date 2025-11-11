# Getting and Cleaning data assignment

# importing packages
library(tidyverse)

# Requirement 1 (Merges the training and the test sets 
#                to create one data set.)
# Reading in data from txt files
x_train <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",
    col_names = FALSE)

x_test <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",
    col_names = FALSE)

y_train <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", 
    col_names = FALSE)

y_test <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",
    col_names = FALSE)

features <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt",
    col_names = FALSE)

subject_train <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",
    col_names = FALSE)

subject_test <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",
    col_names = FALSE)

activity_labels <- read_table(
    "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",
    col_names = FALSE)

# renaming columns in the various dataframes
colnames(x_train) <- features$X2
colnames(x_test) <- features$X2

y_train <- rename(y_train, activity_id = X1)
y_test <- rename(y_test, activity_id = X1)

subject_train <- rename(subject_train, subject_id = X1)
subject_test <- rename(subject_test, subject_id = X1)

colnames(activity_labels) <- c("activity_id","activity_name")

# Combine each of the data set types together
# e.g. subject_train with x_train and y_train 
y_train <- y_train %>% 
    left_join(activity_labels, by="activity_id")

y_test <- y_test %>% 
    left_join(activity_labels, by="activity_id")

df_train <- bind_cols(subject_train, y_train, x_train)
df_test <- bind_cols(subject_test, y_test, x_test)

# merge train and test data sets together
df <- bind_rows(df_train, df_test)

# Requirement 2 (Extracts only the measurements on the mean and 
#                standard deviation for each measurement.)
# filter for columns that only has mean and std
df_filt <- df %>% 
    select(subject_id:activity_name,
           matches("mean\\(\\)", ignore.case = TRUE),
           matches("std\\(\\)", ignore.case = TRUE))

# Requirement 3 (Uses descriptive activity names to name the activities 
#                in the data set)
# Dropping the activity_id column and renaming activity_name to activity
df_filt <- df_filt %>% 
    select(-activity_id) %>% 
    rename(activity = activity_name)

# Requirement 4 (Appropriately labels the data set 
#                with descriptive variable names.)
# convert column names to snake_case
names(df_filt) <- names(df_filt) %>% 
    str_replace_all(c("\\(\\)" = "",
                      "-" = "_",
                      "^t" = "time",
                      "^f" = "freq")) %>% 
    str_replace_all("([a-z])([A-Z])", "\\1_\\2") %>% 
    tolower()

# Requirement 5 (From the data set in step 4, creates a second, 
#                independent tidy data set with the average of each variable 
#                for each activity and each subject.)
df_final <- df_filt %>% 
    group_by(subject_id, activity) %>% 
    summarise(across(everything(), mean, .names = "{.col}_avg"))

write.table(df_final, "tidy_dataset.txt", row.names = FALSE)























