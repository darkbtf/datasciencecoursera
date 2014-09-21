train_data <- read.table("train//X_train.txt")

test_data <- read.table("test//X_test.txt")

merged_data <- merge(train_data, test_data, all=TRUE)

features <- read.table("features.txt")
features <- as.vector(features[ ,2])

names(merged_data) <- features

filtered_data <- merged_data[ , grepl("mean\\(\\)|std\\(\\)", colnames(merged_data))]

output <- apply(filtered_data, 2, mean)

write.table(output, "output.txt", row.name = FALSE)
