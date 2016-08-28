# GettingCleaningFinal
Final project for Getting/Cleaning Data

The major files of this repository are run_analysis.R and codebook.pdf.

codebook.pdf 

run_analysis.R defines a function run_analysis() which consolidates the most important information from the text files provided in the original data package into a single data frame. The script first loads the relevant files from the original package. Then these files are bound into aggregated data frames until the resulting frame, cset1, possesses all the columns it requires. Then, using reference files such as activity_labels.txt and features.txt, the names and values of certain columns are modified to be more descriptive. Finally, the data frame is stripped of all feature columns which do not contain the key words "mean()" or "std()". cset1 is returned as output of the function.

The data frame created by this function, cset1, consists of 82 columns and 10299 observations. The first three columns represent variables related to the identity of the observation (whether the observation is from test or train, the id of the subject being observed, and the type of activity being observed). The other 79 columns represent variables related to the properties of the observation (specifically the means and standard deviations of each). The first three columns were manually entitled "TestTrain", "Subject", and "Activity". The remaining columns take their names from the table of features (features.txt) provided with the original data set. They were left as described in features.txt by the reasoning that it would be easier for a person familiar with the problems this data set describes to interpret a familiar set of variable names than to refer to additional documentation on how I might have changed those names.

"Tidy" qualities are exhibited by this data set as follows:
* Every measured variable is afforded a single colemn
* Every observation of a given variable is listed on a separate row
* No new data was at any point introduced to the set
* No data were summarized or transformed by irreversible operations
