## Merging training set with training labels and subject Id..

TRD_subject_train <- read.table("./train/subject_train.txt")
TRD_subject_train <- as.matrix(TRD_subject_train)
TRD_X_train <- read.table("./train/X_train.txt")
TRD_X_train <- as.matrix(TRD_X_train)
TRD_y_train <- read.table("./train/y_train.txt")
TRD_y_train <- as.matrix(TRD_y_train)


TRD_activity_train = character(0)
for (i in TRD_y_train){
  if(i==1)
    TRD_activity_train = c(TRD_activity_train, "Walking")
  else if(i==2)
    TRD_activity_train = c(TRD_activity_train, "Walking_Upstairs")
  else if(i==3)
    TRD_activity_train = c(TRD_activity_train, "Walking_Downstairs")
  else if(i==4)
    TRD_activity_train = c(TRD_activity_train, "Standing")
  else
    TRD_activity_train = c(TRD_activity_train, "Laying")
}

## Merging test set with test labels and subject Id..

TTD_subject_test <- read.table("./test/subject_test.txt")
TTD_subject_test <- as.matrix(TTD_subject_test)
TTD_X_test <- read.table("./test/X_test.txt")
TTD_X_test <- as.matrix(TTD_X_test)
TTD_y_test <- read.table("./test/y_test.txt")
TTD_y_test <- as.matrix(TTD_y_test)

TTD_activity_test = character(0)
for (i in TTD_y_test){
  if(i==1)
    TTD_activity_test = c(TTD_activity_test, "Walking")
  else if(i==2)
    TTD_activity_test = c(TTD_activity_test, "Walking_Upstairs")
  else if(i==3)
    TTD_activity_test = c(TTD_activity_test, "Walking_Downstairs")
  else if(i==4)
    TTD_activity_test = c(TTD_activity_test, "Standing")
  else
    TTD_activity_test = c(TTD_activity_test, "Laying")
}

data_final <- rbind(cbind(TRD_X_train, TRD_subject_train, TRD_y_train, TRD_activity_train), cbind(TTD_X_test, TTD_subject_test, TTD_y_test, TTD_activity_test))
data <- rbind(cbind(TRD_X_train, TRD_subject_train, TRD_y_train), cbind(TTD_X_test, TTD_subject_test, TTD_y_test))
features <- read.table("features.txt")
features <- data.frame(features)
features <- as.vector(features[[2]])

row <- grep("mean\\()|std\\()",features)
row_final <- c(row, 562, 563, 564)
row1 <- c(row, 562, 563)

data_final <- data_final[,row_final]

data <- data[,row1]
colnames(data_final) <- c(features[row] , "Subject_Id","Activity_Id","Activity_Names")
colnames(data) <- c(features[row] , "Subject_Id","Activity_Id")
tidy <- aggregate(data[,1:66], by=list(activity = data[,67], subject = data[,68]), mean,na.rm=TRUE)

write.table(tidy,file="tidy.txt")
tidy
