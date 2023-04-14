#Data Exploration
#First part of the second class

#Databases to explain variable types

#Database Pima
library(MASS)
data(Pima.tr)
help(Pima.tr)

#Database birthwt 
data("birthwt")
?birthwt

#Change to factor
class(birthwt$low)
summary(birthwt$low)
class(birthwt$race)
summary(birthwt$race)

birthwt$low <- factor(birthwt$low)
birthwt$race <- factor(birthwt$race)
birthwt$smoke <- factor(birthwt$smoke)
birthwt$ht <- factor(birthwt$ht)
birthwt$ui <- factor(birthwt$ui)

class(birthwt$low)
summary(birthwt$low)
class(birthwt$race)
summary(birthwt$race)

#Exploring Categorical Variables

#Type variable in Pima database
(type.freq<-table(Pima.tr$type))
(type.rel.freq<-type.freq/sum(type.freq))
(round(type.rel.freq, 1))

#Race variable in birthwt database
(race.freq<-table(birthwt$race))
(race.rel.freq<-race.freq/sum(race.freq))
(round(race.rel.freq, 2))

#barplots

#Type variable in Pima database
barplot(type.freq, xlab="Type", ylab="Frequency", 
        main="Frequency Bar Graph of Disease Status")
#Race variable in birthwt database
barplot(race.freq, xlab="Race", ylab="Frequency", 
        main="Frequency Bar Graph of Race")

#piecharts

#Type variable in Pima database
pie(type.freq, main="Pie Chart of Disease Status")
#Race variable in birthwt database
pie(race.freq, main="Pie Chart of Race")

#Exploring numerical Variables

#Histograms

#frequency vs. density
#Type variable in Pima database
par(mfrow=c(1,3))
hist(Pima.tr$bmi, freq = TRUE, 
     main="Frequency Histogram of BMI", xlab = "BMI",
     ylab="Frequency")
hist(Pima.tr$bmi, freq = FALSE, 
     main="Density Histogram of BMI", xlab = "BMI",
     ylab="Density")

#Race variable in birthwt database
hist(Pima.tr$bmi, freq = FALSE, main="BMI", xlab = "BMI",
     ylab="Density")

#number of breaks
hist(Pima.tr$bmi, breaks = 3, freq = TRUE, main="BMI", xlab = "BMI",
     ylab="Frequency")

#Shape
#lwt variable in birthwt database
hist(birthwt$lwt, freq = FALSE, main="Mother’s Weight at Last Menstrual Period", xlab = "Weight in pounds",
     ylab="Density")

#Protein database
#Protein consumption of European countries 
library(readr)
Protein <- read_table("C:/Users/user/Documents/Educacion continua/Bioestadistica en R/Datasets/Protein.txt")
hist(Protein$WhiteMeat, freq = FALSE, main="White Meat Comsumption", xlab = "White Meat",
     ylab="Density")

#Mean, median, variance and standard deviation
(mean(Pima.tr$npreg))
(median(Pima.tr$npreg))
(var(Pima.tr$npreg))
(sd(Pima.tr$npreg))

(mean(Pima.tr$bmi))
(median(Pima.tr$bmi))
(var(Pima.tr$bmi))
(sd(Pima.tr$bmi))


#quantile
quantile(Pima.tr$bmi, probs = c(0.1, 0.25, 0.5, 0.9))
summary(Pima.tr$bmi)

summary(birthwt$bwt)

#boxplot
par(mfrow=c(1,2))
boxplot(Pima.tr$bmi, ylab = "BMI")
boxplot(Pima.tr$bmi, ylab = "BMI", horizontal = TRUE)

boxplot(birthwt$bwt, ylab = "Birth weight in grams")
boxplot(birthwt$lwt, ylab = "mother's weight in pounds")

#Interquartile
IQR(Pima.tr$bmi)

#Min and max
minMax <- range(Pima.tr$bmi)
minMax
#range
minMax[2] - minMax[1]

#variance and standard deviation 
var(Pima.tr$bmi)
sd(Pima.tr$bmi)

#Coefficient of Variation
mean.bwt <- mean(birthwt$bwt) #bwt: birth weight in grams.
mean.lwt <- mean(birthwt$lwt) #lwt: mother's weight in pounds at last menstrual period.
var.bwt <- var(birthwt$bwt) #bwt: birth weight in grams.
var.lwt <- var(birthwt$lwt) #lwt: mother's weight in pounds at last menstrual period.
sd.bwt <- sd(birthwt$bwt) #bwt: birth weight in grams.
sd.lwt <- sd(birthwt$lwt) #lwt: mother's weight in pounds at last menstrual period.

comp.bwt.lwt <- data.frame(bwt=c(mean.bwt, var.bwt, sd.bwt), 
           lwt=c(mean.lwt, var.lwt, sd.lwt), 
           row.names = c("Mean", "Variance", "Stand.Dev."))
comp.bwt.lwt

CV.bwt <- sd.bwt/mean.bwt
CV.bwt
CV.lwt <- sd.lwt/mean.lwt
CV.lwt


