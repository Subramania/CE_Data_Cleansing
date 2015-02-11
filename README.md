
##Coursera Getting &  Cleansing Data - Course Project

This repo contains the code to cleanse and tidy the required for Samsung data.
First and foremost, the data should be downloaded & extracted to the same directory as where the source file is.

R file expects the data in following folders & subfolders

* UCI HAR Dataset
	*    test
		*      subject_test.txt
		*      X_test.txt
		*      y_test.txt
    *	train
		*      subject_test.txt
		*      X_test.txt
		*      y_test.txt
    *	activity_labels.txt
    *	features.txt

The code finds and extract data from all the above files, merges the data to include subject & activity.
Then, the training & test data is merged to store all the data.
Next, pick only the mean & std columns for calculation, group data by id & activity, calculate the mean and store the data in a table.

File List - 
* [CodeBook.md](https://github.com/Subramania/CE_Data_Cleansing/blob/master/CodeBook.md) for cookbook markdown
* [run_analysis.R](https://github.com/Subramania/CE_Data_Cleansing/blob/master/run_analysis.r) R file to cleanse & tidy data
* [result.txt] (https://github.com/Subramania/CE_Data_Cleansing/blob/master/result.txt) Result text file
