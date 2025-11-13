# CodeBook

## Data Source
Original dataset: Human Activity Recognition Using Smartphones Data set
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Data
The dataset includes variables derived from accelerometer and gyroscope readings
for 30 participants across 6 activities.

The datasets were stored in separate .txt files for x_train, y_train, x_test,
y_test, features, subject_train, subject_test and activity_labels.

- x_train contains 7352 rows and 561 variables (features).
- y_train contains 7352 and the activity variable.
- x_test contains 2947 rows and 561 variables (features).
- y_test contains 2947 rows and the activity variable.
- features contains all the available features (561 variables).
- subject_train and subject_test contains the subject ids of the participants.
- activity label contains activity id and the activity descriptions.

## Variables
- "subject_id": Identifier for the subject (1-30)
- "activity": The activity performed (e.g. walking, standing)
- The remaining columns are features that are either time or frequency domain signals.
E.g. time_body_acc_mean_x_avg: the average of mean of time-domain body acceleration 
signal in the X direction.

### Units
Accelerometer features (acc_): normalized acceleration signals proportional 
to g-forces (original unit: g).
Gyroscope features (gyro_): normalized angular velocity signals 
(original unit: radians/second).
All features have been normalized and are therefore unitless in the tidy dataset.

## Transformations that were made in the "run_analysis.R":
### Renaming columns
- Creating column names of x_train and x_test datasets to align with features.txt.
- Renaming column names of y_train and y_test from X1 to activity_id.
- Renaming column names of subject dataframes from X1 to subject_id.

### Merging training and test data to one data set
- Adding activity id column to y_train and y_test.
- Combined all of the training and test dataset together:
e.g. subject_train with x_train an y_train.

Finally merged the training and the test data sets to create one data set.

### filter for columns that only has mean and std
Using select and matches functions to filter out columns subject_id, activity name
and any feature columns that contained mean() and std().

### Uses descriptive activity names to name the activities in the data set
Dropping the activity_id column and renaming activity_name to activity which ensures
the activity column is descriptive.

### Cleaning up variable names to make it tidy
converted column names to snake_case by:
- removing parenthesis from the column names.
- replacing "-" with "_".
- replacing t with time and f with freq to make it more intuitive.
- inserting underscores between camel case style in the column names and converting
all column names to lower case. This becomes snake_case style which is what R uses.

### Creating the independent tidy data set with the average of each variable 
for each activity and each subject.

Finally, writing the dataframe output to a .txt file.


