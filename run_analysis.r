#Setting up the widths vector
widths = -3
for(i in 1:127) { widths = c(widths, 14, -2)}


#Reading test file
test <- read.fwf("test/subject_test.txt", widths = 1)
test <- rename(test, Subject = V1)
test <- cbind(test, Activity = read.fwf("test/y_test.txt", widths = 1))
test <- rename(test, Activity = V1)
l <- list.files("test/Inertial Signals")

body_acc_x <- read.fwf(paste("test/Inertial Signals/",l[1], sep = ""), widths = widths)
body_acc_x <- mutate(body_acc_x, Mean = mean(V1))
test <- cbind(test, body_acc_x = body_acc_x$Mean)

body_acc_y <- read.fwf(paste("test/Inertial Signals/",l[2], sep = ""), widths = widths)
body_acc_y <- mutate(body_acc_y, Mean = mean(V1))
test <- cbind(test, body_acc_y = body_acc_y$Mean)

body_acc_z <- read.fwf(paste("test/Inertial Signals/",l[3], sep = ""), widths = widths)
body_acc_z <- mutate(body_acc_z, Mean = mean(V1))
test <- cbind(test, body_acc_z = body_acc_z$Mean)

body_gyro_x <- read.fwf(paste("test/Inertial Signals/",l[4], sep = ""), widths = widths)
body_gyro_x <- mutate(body_gyro_x, Mean = mean(V1))
test <- cbind(test, body_gyro_x = body_gyro_x$Mean)

body_gyro_y <- read.fwf(paste("test/Inertial Signals/",l[5], sep = ""), widths = widths)
body_gyro_y <- mutate(body_gyro_y, Mean = mean(V1))
test <- cbind(test, body_gyro_y = body_gyro_y$Mean)

body_gyro_z <- read.fwf(paste("test/Inertial Signals/",l[6], sep = ""), widths = widths)
body_gyro_z <- mutate(body_gyro_z, Mean = mean(V1))
test <- cbind(test, body_gyro_z = body_gyro_z$Mean)

total_acc_x <- read.fwf(paste("test/Inertial Signals/",l[7], sep = ""), widths = widths)
total_acc_x <- mutate(total_acc_x, Mean = mean(V1))
test <- cbind(test, total_acc_x = total_acc_x$Mean)

total_acc_y <- read.fwf(paste("test/Inertial Signals/",l[8], sep = ""), widths = widths)
total_acc_y <- mutate(total_acc_y, Mean = mean(V1))
test <- cbind(test, total_acc_y = total_acc_y$Mean)

total_acc_z <- read.fwf(paste("test/Inertial Signals/",l[9], sep = ""), widths = widths)
total_acc_z <- mutate(total_acc_z, Mean = mean(V1))
test <- cbind(test, total_acc_z = total_acc_z$Mean)

#Reading train file
l <- list.files("train/Inertial Signals")

train <- read.fwf("train/subject_train.txt", widths = 1)
train <- rename(train, Subject = V1)
train <- cbind(train, Activity = read.fwf("train/y_train.txt", widths = 1))
train <- rename(train, Activity = V1)
list <- list.files("train/Inertial Signals")

body_acc_x <- read.fwf(paste("train/Inertial Signals/",l[1], sep = ""), widths = widths)
body_acc_x <- mutate(body_acc_x, Mean = mean(V1))
train <- cbind(train, body_acc_x = body_acc_x$Mean)

body_acc_y <- read.fwf(paste("train/Inertial Signals/",l[2], sep = ""), widths = widths)
body_acc_y <- mutate(body_acc_y, Mean = mean(V1))
train <- cbind(train, body_acc_y = body_acc_y$Mean)

body_acc_z <- read.fwf(paste("train/Inertial Signals/",l[3], sep = ""), widths = widths)
body_acc_z <- mutate(body_acc_z, Mean = mean(V1))
train <- cbind(train, body_acc_z = body_acc_z$Mean)

body_gyro_x <- read.fwf(paste("train/Inertial Signals/",l[4], sep = ""), widths = widths)
body_gyro_x <- mutate(body_gyro_x, Mean = mean(V1))
train <- cbind(train, body_gyro_x = body_gyro_x$Mean)

body_gyro_y <- read.fwf(paste("train/Inertial Signals/",l[5], sep = ""), widths = widths)
body_gyro_y <- mutate(body_gyro_y, Mean = mean(V1))
train <- cbind(train, body_gyro_y = body_gyro_y$Mean)

body_gyro_z <- read.fwf(paste("train/Inertial Signals/",l[6], sep = ""), widths = widths)
body_gyro_z <- mutate(body_gyro_z, Mean = mean(V1))
train <- cbind(train, body_gyro_z = body_gyro_z$Mean)

total_acc_x <- read.fwf(paste("train/Inertial Signals/",l[7], sep = ""), widths = widths)
total_acc_x <- mutate(total_acc_x, Mean = mean(V1))
train <- cbind(train, total_acc_x = total_acc_x$Mean)

total_acc_y <- read.fwf(paste("train/Inertial Signals/",l[8], sep = ""), widths = widths)
total_acc_y <- mutate(total_acc_y, Mean = mean(V1))
train <- cbind(train, total_acc_y = total_acc_y$Mean)

total_acc_z <- read.fwf(paste("train/Inertial Signals/",l[9], sep = ""), widths = widths)
total_acc_z <- mutate(total_acc_z, Mean = mean(V1))
train <- cbind(train, total_acc_z = total_acc_z$Mean)

#Merging the two datasets
merged <- full_join(test,train)
final <- group_by(merged, Subject, Activity)
final <- unique(final)
write.table(final, file = "tidy.txt", row.names = F)