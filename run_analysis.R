run_analysis=function(){
    library(plyr)
    
    #load files:
    features=read.table("UCI HAR Dataset/features.txt")
    activitylabels=read.table("UCI HAR Dataset/activity_labels.txt")
    
    xtest=read.table("UCI HAR Dataset/test/X_test.txt")
    ytest=read.table("UCI HAR Dataset/test/y_test.txt")
    subjecttest=read.table("UCI HAR Dataset/test/subject_test.txt")
    
    xtrain=read.table("UCI HAR Dataset/train/X_train.txt")
    ytrain=read.table("UCI HAR Dataset/train/y_train.txt")
    subjecttrain=read.table("UCI HAR Dataset/train/subject_train.txt")
    
    #KEY:
    #features:          561x2,      an indexed list of 'features' - V1 is numeric feature id and V2 is characteristic feature id
    #activitylabels:    6x2,        V1 is code for activity type and V2 is text name for activity type
    #xtest:             2947x561,   1 column for each feature, 1 row for each case
    #ytest:             2947x1,     this vector holds the activity code for each row in xtest
    #subjecttest:       2947x1,     this vector holds the subject code for each row in xtest
    #xtrain:            7352x561,   1 column for each feature, 1 row for each case
    #ytrain:            7352x1,     this vector holds the activity code for each row in xtrain
    #subjecttrain:      7352x1,     this vector holds the subject code for each row in xtrain
    
    #1 - consolidate training/test data into single data set
    temp1 = cbind(rep("Test",2947),subjecttest,ytest,xtest)
    names(temp1)[1:3]=c("TestTrain","Subject","Activity")
    temp2 = cbind(rep("Train",7352),subjecttrain,ytrain,xtrain)
    names(temp2)[1:3]=c("TestTrain","Subject","Activity")
    cset1 = rbind(temp1,temp2)
    
    #3 - assign descriptive names to activities listed in data set
    cset1$Activity = mapvalues(cset1$Activity,1:6,as.character(activitylabels$V2))
    
    #4 - assign descriptive labels to variables
    names(cset1)[4:564] = as.character(features$V2)
    
    #2 -  discard all columns which do not include 'mean()' or 'std()'
    colnames = names(cset1)[4:564]
    temp3=cset1[,1:3]
    temp4=cset1[,grepl("mean()|std()",names(cset1))]
    cset1=cbind(temp3,temp4)
    
    cset1
}