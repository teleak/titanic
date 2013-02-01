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

