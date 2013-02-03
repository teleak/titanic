setwd('/Users/Teleak/Desktop/Kaggle/RawData') ### set working directory and read in training file
data<-read.csv("train.csv", colClasses=c("factor", "factor", "character", "factor", "numeric", "factor", "factor", "character", "numeric", "character", "character"), strip.white=TRUE, sep=",")
### libraries
require(plyr)

#### Dimensions of dataset in rows and columns

dim(data)

#### Names and classes of data

as.list(sapply(data, class))

#### Number of NA's in each column

apply(data, 2, function(col) length(which(is.na(col)))) ### shows count of NA values by column

#### Number of blank's in each column

apply(data, 2, function(col) length(which(col == ""))) ### shows count of blank values by column

#### Summary of whole training set 

summary(data)

#### Breakdown on passenger types by class, sex, and survival

(data.passengers<-ddply(data, .(pclass, sex), summarise, 
			 number = length(sex)
 			))
(data.survived.sum<-ddply(subset(data, data$survived == 1), .(pclass, sex), summarise, 
			 survived = length(sex)
 			))
(data.perished.sum<-ddply(subset(data, data$survived == 0), .(pclass, sex), summarise, 
			 perished = length(sex)
 			))

merged.s <- merge(data.passengers, data.survived.sum, by=c('pclass', 'sex' ))
merged <- merge(merged.s, data.perished.sum, by=c('pclass', 'sex'))
ddply(merged, .(pclass, sex, number, survived, perished), summarise, #### combined summary here
			 pclass = pclass,
			 sex = sex, 
			 number = number, 
			 survived = survived, 
			 perc.survive = round(survived/number * 100, digits=2),
	 		 perished = perished, 
	 		 perc.perish = round(perished/number * 100, digits=2)
	 )
#################################################################################
#### Adding in age data have to deal with NAs
nrow(data)
has.na<-data[!(complete.cases(data)),] ### subsets data to rows with NA values all of which are in age column (previously determined)
nrow(has.na) ### 177 rows with NA values in age
(na.passengers<-ddply(has.na, .(pclass, sex), summarise, 
			 total = length(sex)
 			))
na.surv <- ddply(subset(has.na, survived == 1), .(pclass, sex), summarise, 
			 survived = length(sex)
 			)
na.perish <- ddply(subset(has.na, survived == 0), .(pclass, sex), summarise, 
			 perished = length(sex)
 			)
merged.na.s <- merge(na.passengers, na.surv, by=c('pclass', 'sex' ))
merge.na <- merge(merged.na.s, na.perish, by=c('pclass', 'sex'))
ddply(merge.na, .(pclass, sex, total, survived, perished), summarise, #### combined summary here
			 pclass = pclass,
			 sex = sex, 
			 total = total, 
			 survived = survived, 
			 perc.survive = round(survived/total * 100, digits=2),
	 		 perished = perished, 
	 		 perc.perished = round(perished/total * 100, digits=2)
	 )





