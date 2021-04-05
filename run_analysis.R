library("tidyverse")
setwd("/Users/apanova/OneDrive/Documents/2020-2021/GettingAndCleaningData/getting-and-cleaning-data-course-project")

# Preparation of the data

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("id","feature"))


## train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

## test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


# Merging sets

x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)
df <- cbind(subject_all, x_all, y_all)


# Extracting the measurements on the mean and standard deviation

df %>%
  select(subject, label, contains("mean"), contains("std")) -> df2


# Naming the activities in the data set

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity_label"))
df2$label <- activity_labels[df2$label, 2]
names(df2)[2] <- "activity_label"


# Creating a new data set

df2 %>%
  group_by(subject, activity_label) %>%
  summarise_all(list(mean = mean)) -> df3

write.table(df3, "tidy-data-set.txt", row.name=FALSE)


