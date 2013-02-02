Kaggle Titanic Data Description and Munging
========================================================

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

#### data entry and munging


Working data set named "train." This is the training dataset
<!-- deal with blank variables -->

```
## [1] 689
```

```
## [1] 2
```

```
## [1] 687
```


