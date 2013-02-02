### Kaggle Titanic Question

#### Titanic Overview: 
* Sank April 15, 1912
* 1,502 of 2,224 passengers and crew perished

#### Evaluation: 
* Data set split into training and test sets
* For training set, outcome provided ('ground truth')
* Use training set model to generate predictions for test set 

#### Goals
* For each passenger in the test set, one must predict whether or not they survived the sinking
	* 0 == deceased, 1 == survived in data set
	
#### Available Elements (11)
1. survived (1,0)
2. pclass (1, 2, 3)
3. name
4. sex (male or female)
5. age
6. sibsp (number of siblings or spouses aboard -- 0, 1:5, 8)
7. Parch (number of parents/children aboard -- 0:6)
8. fare (passenger fare)
9. cabin 
10. embarked (Port of embarkation)
	* C = Cherbourg; Q = Queenstown; S = Southampton 
	
#### Hypothesis: intuitive assumptions
* Young females with family members aboard (esp. parents/siblings) of higher social status (better accommodation class) were more likely to get a limited lifeboat slot. 
* Survival may have depended upon cabin

#### Hypothesis
* H0 all passengers had an equal chance of survival
* H1 younger female 1st class passengers with family aboard had a higher survival rate. 

#### Exploratory Analysis 
1. % male and female survivors adjusted for % of each in total
2. Relationship to: 
	1. Class of berth
	2. Number of siblings
	3. Survivors Age
	4. Fare paid
	5. Cabin location (look for obvious patterns and then research ship berthing if needed)
	6. Relation to port of embarkation
	
#### Likely Analytical Paths
1. Random Forest Analysis
2. Principal Component Analysis
3. Bayesian Multivariate Prediction 

### Data Description and Munging
********
<!--- Start Analysis JW --->
<!--- set working directory and read in dataset -->


#### Initial data structure

```
## 'data.frame':	891 obs. of  11 variables:
##  $ survived: Factor w/ 2 levels "0","1": 1 2 2 2 1 1 1 1 2 2 ...
##  $ pclass  : Factor w/ 3 levels "1","2","3": 3 1 3 1 3 3 1 3 3 2 ...
##  $ name    : chr  "Braund, Mr. Owen Harris" "Cumings, Mrs. John Bradley (Florence Briggs Thayer)" "Heikkinen, Miss. Laina" "Futrelle, Mrs. Jacques Heath (Lily May Peel)" ...
##  $ sex     : Factor w/ 2 levels "female","male": 2 1 1 1 2 2 2 2 1 1 ...
##  $ age     : num  22 38 26 35 35 NA 54 2 27 14 ...
##  $ sibsp   : Factor w/ 7 levels "0","1","2","3",..: 2 2 1 2 1 1 1 4 1 2 ...
##  $ parch   : Factor w/ 7 levels "0","1","2","3",..: 1 1 1 1 1 1 1 2 3 1 ...
##  $ ticket  : chr  "A/5 21171" "PC 17599" "STON/O2. 3101282" "113803" ...
##  $ fare    : num  7.25 71.28 7.92 53.1 8.05 ...
##  $ cabin   : chr  "" "C85" "" "C123" ...
##  $ embarked: Factor w/ 4 levels "","C","Q","S": 4 2 4 4 4 3 4 4 4 2 ...
```

```
##    survived pclass                                                name
## 1         0      3                             Braund, Mr. Owen Harris
## 2         1      1 Cumings, Mrs. John Bradley (Florence Briggs Thayer)
## 3         1      3                              Heikkinen, Miss. Laina
## 4         1      1        Futrelle, Mrs. Jacques Heath (Lily May Peel)
## 5         0      3                            Allen, Mr. William Henry
## 6         0      3                                    Moran, Mr. James
## 7         0      1                             McCarthy, Mr. Timothy J
## 8         0      3                      Palsson, Master. Gosta Leonard
## 9         1      3   Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)
## 10        1      2                 Nasser, Mrs. Nicholas (Adele Achem)
##       sex age sibsp parch           ticket   fare cabin embarked
## 1    male  22     1     0        A/5 21171  7.250              S
## 2  female  38     1     0         PC 17599 71.283   C85        C
## 3  female  26     0     0 STON/O2. 3101282  7.925              S
## 4  female  35     1     0           113803 53.100  C123        S
## 5    male  35     0     0           373450  8.050              S
## 6    male  NA     0     0           330877  8.458              Q
## 7    male  54     0     0            17463 51.862   E46        S
## 8    male   2     3     1           349909 21.075              S
## 9  female  27     0     2           347742 11.133              S
## 10 female  14     1     0           237736 30.071              C
```

#### Columns with NA values
<!-- Figure out NA values -->

```
## survived   pclass     name      sex      age    sibsp    parch   ticket 
##        0        0        0        0      177        0        0        0 
##     fare    cabin embarked 
##        0        0        0
```




#### Columns with no entry

```r
length(which(train$embarked == ""))
```

```
## [1] 2
```

```r
length(which(train$cabin == ""))
```

```
## [1] 687
```

```r
train[train == ""] = "unk"  ## convert NA values to blanks
```

```
## Warning: invalid factor level, NAs generated
```

```r
head(train, n = 10)
```

```
##    survived pclass                                                name
## 1         0      3                             Braund, Mr. Owen Harris
## 2         1      1 Cumings, Mrs. John Bradley (Florence Briggs Thayer)
## 3         1      3                              Heikkinen, Miss. Laina
## 4         1      1        Futrelle, Mrs. Jacques Heath (Lily May Peel)
## 5         0      3                            Allen, Mr. William Henry
## 6         0      3                                    Moran, Mr. James
## 7         0      1                             McCarthy, Mr. Timothy J
## 8         0      3                      Palsson, Master. Gosta Leonard
## 9         1      3   Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)
## 10        1      2                 Nasser, Mrs. Nicholas (Adele Achem)
##       sex age sibsp parch           ticket   fare cabin embarked
## 1    male  22     1     0        A/5 21171  7.250   unk        S
## 2  female  38     1     0         PC 17599 71.283   C85        C
## 3  female  26     0     0 STON/O2. 3101282  7.925   unk        S
## 4  female  35     1     0           113803 53.100  C123        S
## 5    male  35     0     0           373450  8.050   unk        S
## 6    male  NA     0     0           330877  8.458   unk        Q
## 7    male  54     0     0            17463 51.862   E46        S
## 8    male   2     3     1           349909 21.075   unk        S
## 9  female  27     0     2           347742 11.133   unk        S
## 10 female  14     1     0           237736 30.071   unk        C
```


#### Summary of missing entities in full training dataset
* 177 missing entities in data frame
* All missing entities in age column
* $\approx$ 30% of NA values are females
* $\approx$ 70% of NA values are male

#### Breakdown of males to females prior to sinking


* $\approx$ 35% of crew and passengers were female prior to sinking
* $\approx$ 65% of crew and passengers were male prior to sinking


#### Breakdown of males to females after sinking


* $\approx$ 68% of the survivors were female
* $\approx$ 32% of the survivors were male
