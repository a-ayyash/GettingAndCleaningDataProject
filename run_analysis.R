library(reshape2)
print("Reading General Files")
activityLabels = read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)$V2
features = read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
features = gsub(" ", "_", paste(features$V1, features$V2))

print("Reading testing data")
#testing data
YTest = read.table("./UCI HAR Dataset/test/y_test.txt")
testingData = read.table("./UCI HAR Dataset/test/X_test.txt")
activity_testing = factor(YTest[[1]], labels=activityLabels)
subjectIDs_testing = read.table("./UCI HAR Dataset/test/subject_test.txt")
body_acc_x_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_testing = read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

print("Reading training data")
#training data
YTraining = read.table("./UCI HAR Dataset/train/y_train.txt")
trainingData = read.table("./UCI HAR Dataset/train/X_train.txt")
activity_training = factor(YTraining[[1]], labels=activityLabels)
subjectIDs_training = read.table("./UCI HAR Dataset/train/subject_train.txt")
body_acc_x_training = read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_training = read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_training = read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_training = read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_training = read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_training = read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_training = read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_training = read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_training = read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

print("cleaning testing data column names")
#cleaning testing data column names
colnames(body_acc_x_testing) <- gsub("V", "estimated_body_acc_x_", colnames(body_acc_x_testing))
colnames(body_acc_y_testing) <- gsub("V", "estimated_body_acc_y_", colnames(body_acc_y_testing))
colnames(body_acc_z_testing) <- gsub("V", "estimated_body_acc_z_", colnames(body_acc_z_testing))
colnames(body_gyro_x_testing) <- gsub("V", "body_gyro_x_", colnames(body_gyro_x_testing))
colnames(body_gyro_y_testing) <- gsub("V", "body_gyro_y_", colnames(body_gyro_y_testing))
colnames(body_gyro_z_testing) <- gsub("V", "body_gyro_z_", colnames(body_gyro_z_testing))
colnames(total_acc_x_testing) <- gsub("V", "total_acc_x_", colnames(total_acc_x_testing))
colnames(total_acc_y_testing) <- gsub("V", "total_acc_y_", colnames(total_acc_y_testing))
colnames(total_acc_z_testing) <- gsub("V", "total_acc_z_", colnames(total_acc_z_testing))
#colnames(testingData) <- gsub(" ", "", paste(features, "_testing"))
colnames(testingData) <- features
colnames(trainingData) <- features
ColNames = c("subjectID", "data_type", "activity",
                        colnames(body_acc_x_testing), 
                        colnames(body_acc_y_testing), 
                        colnames(body_acc_z_testing),
                        colnames(body_gyro_x_testing),
                        colnames(body_gyro_y_testing),
                        colnames(body_gyro_z_testing),
                        colnames(total_acc_x_testing),
                        colnames(total_acc_y_testing),
                        colnames(total_acc_z_testing),
                        colnames(testingData))

print("cleaning training data column names")
#cleaning training data column names
colnames(body_acc_x_training) <- gsub("V", "estimated_body_acc_x_", colnames(body_acc_x_training))
colnames(body_acc_y_training) <- gsub("V", "estimated_body_acc_y_", colnames(body_acc_y_training))
colnames(body_acc_z_training) <- gsub("V", "estimated_body_acc_z_", colnames(body_acc_z_training))
colnames(body_gyro_x_training) <- gsub("V", "body_gyro_x_", colnames(body_gyro_x_training))
colnames(body_gyro_y_training) <- gsub("V", "body_gyro_y_", colnames(body_gyro_y_training))
colnames(body_gyro_z_training) <- gsub("V", "body_gyro_z_", colnames(body_gyro_z_training))
colnames(total_acc_x_training) <- gsub("V", "total_acc_x_", colnames(total_acc_x_training))
colnames(total_acc_y_training) <- gsub("V", "total_acc_y_", colnames(total_acc_y_training))
colnames(total_acc_z_training) <- gsub("V", "total_acc_z_", colnames(total_acc_z_training))
#colnames(trainingData) <- gsub(" ", "", paste(features, "_training"))
colnames(trainingData) <- features
trainingSetColNames = c("subjectID", "activity", 
                        colnames(body_acc_x_training), 
                        colnames(body_acc_y_training), 
                        colnames(body_acc_z_training),
                        colnames(body_gyro_x_training),
                        colnames(body_gyro_y_training),
                        colnames(body_gyro_z_training),
                        colnames(total_acc_x_training),
                        colnames(total_acc_y_training),
                        colnames(total_acc_z_training),
                        colnames(trainingData))

print("constructing tidy testing set")
#constructing tidy testing set
testingSet = cbind( subjectIDs_testing, 
                    data_type = "testing",
                    activity_testing, 
                    body_acc_x_testing,
                    body_acc_y_testing,
                    body_acc_z_testing,
                    body_gyro_x_testing,
                    body_gyro_y_testing,
                    body_gyro_z_testing,
                    total_acc_x_testing,
                    total_acc_y_testing,
                    total_acc_z_testing, 
                    testingData)
colnames(testingSet) <- ColNames

print("constructing tidy training set")
#constructing tidy training set
trainingSet = cbind(subjectIDs_training, 
                    data_type = "training",
                    activity_training, 
                    body_acc_x_training,
                    body_acc_y_training,
                    body_acc_z_training,
                    body_gyro_x_training,
                    body_gyro_y_training,
                    body_gyro_z_training,
                    total_acc_x_training,
                    total_acc_y_training,
                    total_acc_z_training, 
                    trainingData)
colnames(trainingSet) <- ColNames

print("merging datasets")
fullDataset = rbind(testingSet, trainingSet)

print("constructing the mean/std dataset")
identityColumns = fullDataset[c(1,2,3)]
meanData = fullDataset[grep("mean[(]", names(fullDataset))]
stdData  = fullDataset[grep("std[(]", names(fullDataset))]
mean_std_dataset = cbind(identityColumns, meanData, stdData)

print("reshaping data")
if (exists("finalDataFrame_5")) {
    rm(finalDataFrame_5)
}

for(sID in 1:30) {
    print(paste("calculating for user", sID))
    userData = fullDataset[(fullDataset$subjectID == 2),]
    userData_n = userData[,3:length(userData)]
    byActivity = melt(userData_n, id=c("activity"))
    userMeans = dcast(byActivity, activity ~ variable, mean)
    if (sID > 1) {
        temp = cbind(subjectID = sID, userMeans)
        finalDataFrame_5 = rbind(finalDataFrame_5, temp)
    } else {
        finalDataFrame_5 = cbind(subjectID = sID, userMeans)
    }
}

#write to file
write.csv(finalDataFrame_5, file="./calculatedAnalysis.csv")