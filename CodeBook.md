## Getting and Cleaning Data Project
### We used following process to prepared meregd data in file merged_data.text
* Read traing X data storaed in X_train.txt
* Read Activity data stored in y_train.txt
* Read Subject data stored in subject_train.txt 
* merge main training data with subject & Activity data
* Read test main data, activity and subject data from X,y,subject_test.text files 
* merge main test data with activity & subject  data
* merge complete test and training data
* read activity lebel data
* join Activity Labels with merged data
* Write tidy data set to merged_data.txt file

### In order to take mean and std variable from tidy data set, read feature.txt file
and found column position for mean and std variables. Subsetted the data based on
column position and written to a file meanStdData.txt.
