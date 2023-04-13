#R as calculator
65 + 32
3 * 1.7 - 2
4 * 3 + 6/0.2
5^2
sqrt(430)
exp(-1.3)
log(25)
log(25, base = 10)

#help
?log
?round

#function combination
round(log(25, base = 10), digits = 2)

#Assignment
x <- 2
y <- 3
z <- x + y

x
print(y)
print(z)

#save and load objects
#workspace
getwd()
objects()
save(x, y, file = "myObjects.RData")
load("myObjects.RData")
#working directory
getwd()

#vectors
x <- c(1, 2, 3, 4, 5)

#Operations with vectors
2 * x + 1
exp(x)

#Sequences
x <- 1:5
x
x <- as.numeric(x)
y <- seq(from = -3, to = 14, by = 2)
y
#repetions
z <- rep(5, times = 10)
z
z <- rep(NA, times = 10)
z

length(x)
length(y)

#functions with vectors
x
sum(x)
mean(x)
?mean

#Select elements in a vector
x[1]
y[4]
y[3:6]
#select all but
y[-4]

#Character vector
sex <- c("male", "female", "female", "male", "female")
sex[3]

#Logical vector
is.healthy <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
is.healthy

sum(is.healthy)
as.integer(is.healthy)

#Derivation of logical vectors
#Relational operators
sex
is.male <- (sex == "male")
is.male

#Relational operators: ==
age <- c(60, 43, 72, 35, 47)
is.60 <- (age == 60)
is.60

#Relational operators: !=
is.female <- (sex != "male")
is.female
not.60 <- (age != 60)
not.60

#Relational operators: <, <=, >, >=
age < 43
age <= 43
age > 43
age >= 43

#Boolean operators: NOT !
is.female <- !is.male
is.female

#Boolean operators: AND &
is.male
is.healthy
is.male & is.healthy
#Boolean operators: OR |
is.male | is.healthy

is.young.male <- is.male & (age < 45)
is.young.male

#indices
ind.male <- which(is.male)
ind.male

ind.young <- which(age < 45)
ind.young

#indices to select in a vector
age[ind.male]
is.male[ind.young]

#Matrices
BMI = c(28, 32, 21, 27, 35)
bp = c(124, 145, 127, 133, 140)
data.1 = cbind(age, BMI, bp)
data.1

data.2 = rbind(age, BMI, bp)
data.2

dim(data.1)

#column and row Names
colnames(data.1)
rownames(data.1) <- c("subject1", "subject2", "subject3", "subject4", "subject5")
data.1

#Selection in a matrix
data.1[3, 1]
data.1[2, ]
data.1[, 2]

#Matrix creation
matrix(data = 1:12, nrow = 3, ncol = 4)
matrix(data = 1:12, nrow = 3, ncol = 4, byrow = TRUE)

mat <- matrix(data = 0, nrow = 3, ncol = 3)
mat

diag(mat) <- 1
mat

mat <- matrix(data = NA, nrow = 2, ncol = 3)
mat
mat[1, 3] <- 5
mat

#Class of columns inside a matrix
mat <- cbind(age, sex, is.healthy)
mode(mat)

#Dataframes
data.df <- data.frame(age, factor(sex), is.healthy, BMI, bp)
data.df <- data.frame(age, sex, is.healthy, BMI, bp)
data.df
class(data.df[,3])
class(data.df$sex)


factor(sex)

#Selection in data frames
data.df[3, 4]
data.df[, "age"]
data.df$age
data.df$BMI[4]
data.df$sex[2]

#Importing Data from Text Files
BodyTemperature <- read.table(file = "BodyTemperature.txt",header = TRUE, 
                              sep = " ")
head(BodyTemperature)
names(BodyTemperature)
BodyTemperature[1:3, 2:4]
BodyTemperature$Age[1:3]

#Lists
our.study <- list(data = BodyTemperature,
                  investigators = c("Smith", "Jackson", "Clark"), 
                  students = c("Steve", "Mary"))
length(our.study)

#Selection in a list
our.study$investigator
our.study[[2]]

our.study[[2]][3]
our.study[[1]][2:4, ]

#Packages
#Install packages
install.packages("MASS")
#Load data in packages
library(MASS)
data("birthwt")