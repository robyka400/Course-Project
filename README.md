# Course-Project
Getting and Cleaning Data Course Project
The "run_analysis.r" first reads the subject into a data frame, 
then reads the activity and the variables(only the row's mean) to a variable, and using
"cbind" function attaches it to the data frame.
After reading in the train and test files it merges the two dataframe
and groups it and using the "unique" function deletes the duplicating
elements.
