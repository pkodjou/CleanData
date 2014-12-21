Tidy data set project for tracking physical activity from multiple sensors
==========================================================================

Step 1 - download the "run_analysis.R" file  
Step 2 - set your working directory to where the location where the data files will be located  
Step 3 - run the above file   
Step 4 - Review the file produced at the end using read.table("MyTidy_activitydata.txt")  

### About this project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Information about the Raw data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

- subject_test.txt: contains the participant number (1-30) for the test data  
- y_test.txt: contains the activity number (1-6) for the test data  
- x_test.txt: contains the vector information (1-531) for the test data  
- subject_training.txt: contains the participant number (1-30) for the training data  
- y_training.txt: contains the activity number (1-6) for the training data  
- x_trainingt.txt: contains the vector information (1-531) for the training data  
- features.txt: contains the descriptive names of activities
 
### Step by steps transformations

- Load data and labels into R. 
- Give proper column names ("activity" and "participant"...)
- Cleaned up names by removed unneccessary brackets
- Create a summary data frame that displays only the mean and standard deviation data. 
- Merge training data and test data sets in a single data frame
- Filter the merged data frame by searching the column names for "std" and "mean". 
- Combined the filtered columns with the identifier columns to create a new data frame. 
- Converts the numeric labels for activities to more descriptive labels using the map values function and activity_labels text file. 
- Clean up the labels by changing the characters to lower case and replacing underscores with spaces to end up with the following labels.

1. walking  
2. walking upstairs  
3. walking downstairs  
4. sitting  
5. standing  
6. laying  

- Create a new ckean data frame using the aggretate function with the average of each variable for each activity and each subject. 
- Write the tidy data frame to a file called "MyTidy_activitydata.txt" in the directory.
