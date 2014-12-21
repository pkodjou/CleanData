install.packages("plyr")
library(plyr)

# check if a data folder exists; if not then create one
if (!file.exists("data")) {dir.create("data")}

# file URL & destination file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "./data2/activity.zip"

# download the file & note the time
download.file(fileUrl, destfile)
dateDownloaded <- date()

##### I unzipped the files manually at this point ####
##### read the data for test and training sets, & labels ####

testdata <- read.table("./data/activity/UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./data/activity/UCI HAR Dataset/test/Y_test.txt")
testSubject <- read.table("./data/activity/UCI HAR Dataset/test/subject_test.txt")

trainingdata <- read.table("./data/activity/UCI HAR Dataset/train/X_train.txt")
trainingLabel <- read.table("./data/activity/UCI HAR Dataset/train/Y_train.txt")
trainingSubject <- read.table("./data/activity/UCI HAR Dataset/train/subject_train.txt")

activityLabel <- read.table("./data/activity/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/activity/UCI HAR Dataset/features.txt")

##### clean up the the labels by removing excessive brackets and underscores

features <- gsub("\\()", "", features$V2)

activityLabel <- activityLabel$V2
activityLabel <- tolower(activityLabel)
activityLabel <- sub("_", " ", activityLabel)

##### renames of columns 

names(testdata) <- features; names(trainingdata) <- features
names(testLabel) <- "activity"; names(trainingLabel) <- "activity"
names(testSubject) <- "participant"; names(trainingSubject) <- "participant"

#### create a Data Frame & bind the training data to the bottom of the test data

DF <- rbind(testdata, trainingdata)

#### extract only the columns containing standard deviation or mean

critere <- grep("mean|std", names(DF))

#### create a new, separate Data Frame for identifiers only

DF_test <- data.frame(testLabel, testSubject)
DF_training <- data.frame(trainingLabel, trainingSubject)
DF_new <- rbind(DF_test, DF_training)

#### for each in criteria: add the Data Frame critere column to a new DF

for (each in critere){
  DF_new <- cbind(DF_new, DF[each])
}

#### replace the activity numbers with their respective labels

DF_new$activity <- mapvalues(DF_new$activity, 
                             from = levels(factor(DF_new$activity)), 
                             to = activityLabel)

#### create a new tidy Data Frame with the average of each variable for each activity and subject

DF_tidy <- aggregate(DF_new, list(DF_new$participant, DF_new$activity), mean)

#### clean up the columns and column names

DF_tidy$participant <- NULL; 
DF_tidy$activity <- NULL
names(DF_tidy)[1] <- "participant"; 
names(DF_tidy)[2] <- "activity"

#### Write the tidy dataframe into a file

write.table(file = "MyTidy_Activitydata.txt", x = DF_tidy, row.names = FALSE)
