Kaggle Titanic Training Dataset Description and Munging 
========================================================
### Intial dataset called "data"


******


## Description of whole training dataset "data"
*****
#### Dimensions of dataset in rows and columns

```
## [1] 891  11
```

#### Names and classes of data

```
## $survived
## [1] "factor"
## 
## $pclass
## [1] "factor"
## 
## $name
## [1] "character"
## 
## $sex
## [1] "factor"
## 
## $age
## [1] "numeric"
## 
## $sibsp
## [1] "factor"
## 
## $parch
## [1] "factor"
## 
## $ticket
## [1] "character"
## 
## $fare
## [1] "numeric"
## 
## $cabin
## [1] "character"
## 
## $embarked
## [1] "character"
```

#### Number of NA's in each column

```
## survived   pclass     name      sex      age    sibsp    parch   ticket 
##        0        0        0        0      177        0        0        0 
##     fare    cabin embarked 
##        0        0        0
```

#### Number of blank's in each column

```
## survived   pclass     name      sex      age    sibsp    parch   ticket 
##        0        0        0        0        0        0        0        0 
##     fare    cabin embarked 
##        0      687        2
```

#### Summary of whole training set 

```
##  survived pclass      name               sex           age        sibsp  
##  0:549    1:216   Length:891         female:314   Min.   : 0.42   0:608  
##  1:342    2:184   Class :character   male  :577   1st Qu.:20.12   1:209  
##           3:491   Mode  :character                Median :28.00   2: 28  
##                                                   Mean   :29.70   3: 16  
##                                                   3rd Qu.:38.00   4: 18  
##                                                   Max.   :80.00   5:  5  
##                                                   NA's   :177     8:  7  
##  parch      ticket               fare          cabin          
##  0:678   Length:891         Min.   :  0.0   Length:891        
##  1:118   Class :character   1st Qu.:  7.9   Class :character  
##  2: 80   Mode  :character   Median : 14.5   Mode  :character  
##  3:  5                      Mean   : 32.2                     
##  4:  4                      3rd Qu.: 31.0                     
##  5:  5                      Max.   :512.3                     
##  6:  1                                                        
##    embarked        
##  Length:891        
##  Class :character  
##  Mode  :character  
##                    
##                    
##                    
## 
```

### Summary of full data set passenger types by class, sex, and survival
* Full dataset with all NA's and Blanks (none in columns used for calculations).



```
##   pclass    sex number survived perc.survive perished perc.perish
## 1      1 female     94       91        96.81        3        3.19
## 2      1   male    122       45        36.89       77       63.11
## 3      2 female     76       70        92.11        6        7.89
## 4      2   male    108       17        15.74       91       84.26
## 5      3 female    144       72        50.00       72       50.00
## 6      3   male    347       47        13.54      300       86.46
```


### Summary of data containing just NA values (those that will be removed)
>__!!! Idea !!!__, may be able to estimate ages from internet



```
##   pclass    sex total survived perc.survive perished perc.perished
## 1      1   male    21        5        23.81       16         76.19
## 2      2   male     9        2        22.22        7         77.78
## 3      3 female    42       25        59.52       17         40.48
## 4      3   male    94        9         9.57       85         90.43
```

### Summary of data after removal of NA's 
****



```
##   pclass    sex total survived perc.survive perished perc.perished
## 1      1 female    85       82        96.47        3          3.53
## 2      1   male   101       40        39.60       61         60.40
## 3      2 female    74       68        91.89        6          8.11
## 4      2   male    99       15        15.15       84         84.85
## 5      3 female   102       47        46.08       55         53.92
## 6      3   male   253       38        15.02      215         84.98
```



