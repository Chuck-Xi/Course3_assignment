# Course 3 assignment
Getting and cleaning data assignment

## Project Overview
This project processes data collected from the accelerometers of Samsung
Galaxy S smartphones. The goal is to create a tidy data set that contains
the average of each variable for each activity and each subject.

## Files included 
- "README.md": Overview of the assignment project.
- "run_analysis.R": The R script that performs the data cleaning and transformations.
- "tidy_dataset.txt": The final tidy dataset created by the "run_analysis.R" script.
- "CodeBook.md": Describes the variables and transformations performed
   in "run_analysis.R".

## How to run the process
1. Download and unzip the dataset from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. Place the data in your working directory.
3. Run the "run_analysis.R" script, this will generate "tidy_dataset.txt"

## Steps performed in "run_analysis.R"
1. Loads training, test, subject and activity datasets.
2. Rename columns of dataframes, then merges the training and test datasets.
3. Extracts only the measurements on the mean and 
standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. Creates an independent tidy data set with the average of each variable 
for each activity and each subject.