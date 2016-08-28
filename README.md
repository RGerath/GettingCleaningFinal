# GettingCleaningFinal
Final project for Getting/Cleaning Data

The major files of this repository are run_analysis.R and codebook.pdf.

run_analysis.R defines a function run_analysis() which consolidates the most important information from the text files provided in the original data package into a single data frame.

The first data frame created by this function, cset1, consists of 82 columns and 10299 observations. The first three columns represent variables related to the identity of the observation (whether the observation is from test or train, the id of the subject being observed, and the type of activity being observed). The other 79 columns represent variables related to the properties of the observation (specifically the means and standard deviations of each). The first three columns were manually entitled "TestTrain", "Subject", and "Activity". The remaining columns take their names from the table of features provided with the original data set.
