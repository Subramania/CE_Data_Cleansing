
##Overview
This CodeBook contains the important variables, data & transformation done to clean the data

###Intitial variables
Below variables are used to store the file path details 
	*activityLabelFile
	*featureFile
	*trainX
	*trainY
	*etc..etc

Below variables are used to store the data
	*trainSubList
	*trainXList
	*trainYList
	*etc..etc
###Transformation
Below steps were completed to get and tidy the data
	* 1. Load all the data
	* 2. Update the col names with feature names
	* 3. Include the subject id & activity type
	* 4. Combine the data for both train & test
	* 5. Take only the required col
	* 6. Get the description for the activities
	* 7. Group the data by Id & Activity
	* 8. Calculate the mean for all the measures
	* 9. Return the result

###Results
Below contains the list of important output variables
	*allData - all the data from both train & test
	*tidyData - final cleansed data
	*tidyDataSummary - Final data grouped by Id & Activity
