### intial look at titanic training dataset
#### data entry and munging
setwd('/Users/Teleak/Desktop/Kaggle/RawData') ### set working directory and read in training file

train<-read.csv("train.csv", colClasses=c("factor", "factor", "character", "factor", "numeric", "factor", "factor", "character", "numeric", "character", "character"), strip.white=TRUE, sep=",") ### import data





### identify NA values and percent of population that 
apply(train, 2, function(col) length(which(is.na(col))))
has.na<-subset(train, !complete.cases(train)) ### create data frame where rows contain NA values
na.female<-nrow(subset(has.na, has.na$sex== "female")) ## number of NA values for females
na.male<-nrow(subset(has.na, has.na$sex== "male")) ### number of NA values for males
round(na.female/nrow(has.na) * 100) ### percentage of females with na values
round(na.male/nrow(has.na) * 100) ### percentage of males with na values
na.female.survived <- round(nrow(subset(has.na, has.na$sex == "female" & has.na$survived == "1"))/nrow(has.na)*100) ### percentage of female survivors with no age entered
na.male.survived <- round(nrow(subset(has.na, has.na$sex == "male" & has.na$survived == "1"))/nrow(has.na)*100) ### percentage of male survivors with no age entered
###

