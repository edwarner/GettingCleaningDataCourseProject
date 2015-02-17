s_test <- read.table("subject_test.txt", header = FALSE)
s_train <- read.table("subject_train.txt", header = FALSE)
x_test <- read.table("X_test.txt", header = FALSE)
x_train <- read.table("X_train.txt", header = FALSE)
y_test <- read.table("Y_test.txt", header = FALSE)
y_train <- read.table("Y_train.txt", header = FALSE)

s_combined <- rbind(s_train, s_test)
x_combined <- rbind(x_train, x_test)
y_combined <- rbind(y_train, y_test)

x_feature <- read.table("features.txt", header = FALSE, stringsAsFactors = FALSE)

x_columnnames <- x_feature[,2]

colnames(x_combined) <- x_columnnames
colnames(y_combined) <- c("Activity_Name")
colnames(s_combined) <- c("Subject")

x_combined <- x_combined[, grepl("mean()", colnames(x_combined)) | grepl("std()", colnames(x_combined))]

ysx_combined <- cbind(y_combined, s_combined, x_combined)

ysx_combined[,1] <- ifelse(ysx_combined[,1] == 1, "WALKING", ysx_combined[,1])
ysx_combined[,1] <- ifelse(ysx_combined[,1] == 2, "WALKING_UPSTAIRS", ysx_combined[,1])
ysx_combined[,1] <- ifelse(ysx_combined[,1] == 3, "WALKING_DOWNSTAIRS", ysx_combined[,1])
ysx_combined[,1] <- ifelse(ysx_combined[,1] == 4, "SITTINGS", ysx_combined[,1])
ysx_combined[,1] <- ifelse(ysx_combined[,1] == 5, "STANDING", ysx_combined[,1])
ysx_combined[,1] <- ifelse(ysx_combined[,1] == 6, "LAYING", ysx_combined[,1])

activity_subject <- group_by(ysx_combined, Activity_Name, Subject)

mean_activity_subject <- summarise_each(activity_subject, funs(mean))

write.table(mean_activity_subject, "mean_activity_subject.txt", row.names = FALSE)