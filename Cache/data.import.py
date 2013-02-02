### python code based on getting started with python from kaggle site https://www.kaggle.com/c/titanic-gettingStarted/details/getting-started-with-python

### import relevant packages
import csv as csv ## setup packages needed
import numpy as np
import os as os 
### set working directory
os.chdir('/Users/Teleak/Desktop/Kaggle/RawData')
### open up csv file to python object
csv_file_object = csv.reader(open('./train.csv', 'rb'))
header = csv_file_object.next() ## next command skips first line which is header
data=[] ## create a variable called data
for row in csv_file_object:  ### run through ea. row in csv file
	data.append(row)  ## add each row to data variable
data = np.array(data) ## convert from list to array being aware that each item is a string in this format


## size function counts how many elements in the array and sum sums the elements
number_passengers = np.size(data[0::,0].astype(np.float)) ## 0:: means all, 0 means column 1
number_survived = np.sum(data[0::,0].astype(np.float))
print number_passengers
print number_survived
proportion_survivors = number_survived / number_passengers
print proportion_survivors * 100 ### percentage of survivors
