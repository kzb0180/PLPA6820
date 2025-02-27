##### Section of code #####

#Learning Objectives

# Use basic mathematical operators in R
# Know some of the data types 
# Install packages 
# Load data into R from a .csv file or .txt file

#### Exercise Number 1 ####
#R is a big calculator

2+2 #returns 4
2-2 #returns 0
2/2 #returns 1
2*2 #returns 4

####Exercise Number 2####
#Objects

x <- 2 #highlighting the x and compile
y = 3 #The preferred syntax is to use the '<-' the '-' is to be used within a function 
x+y #returns 5
x-y #returns -1
x/y #returns 0.666
x*y #returns 6


#This is a character variable 
name <- "Kylie"
seven <- "7"
seven + x #retuns an error bc "seven" is a character

#function -> something that does something to an object 
class(seven) 
class(x)

# Concatinate function - used to make a string of things
vec <- c(1,2,3,4,5,6,7) #use to make a vector
vec1 <- c(1:7)
vec <- 1:7
vec2 <- c("Kylie","Blake")
vec3 <- c(TRUE,FALSE,TRUE)

#using square brackets 
vec[4] #saying find the fourth value
vec2[2]
vec+2 #adds 2 to every number 

# Basic functions in R
vec
mean(vec) #mean
sd(vec) #std.dev
sum(vec) #sum
median(vec) #median
min(vec) #minimum
max(vec) #maximum
summary(vec) #IQR - output depends on the data class
abs(vec) #abs value
sqrt(vec) #square root
sqrt(sum(vec)) 
  #if plus sign instead of carrot in console, it means that R exoects line of code is not closed 
log(vec) #natural log
log10(vec) #log base 10 
exp(vec) #power of e 

####Logical Operators####
# > greater than
# < less than
# | or
# & and
# = equals (used to assign values from left to right)
# == exactly equal to (used for showing equality between values)
# >= greater than or equal to 
# != not equals to

1>2
1<2
1<=2
1==1 
1=1 # asking is 1 equal to 1 

t <- 1:10

#Values of t such that t is greater than 8 or less than 5
t[(t>8) | (t<5)]
#Values of t such that t is greater than 8 and less than 10
t[(t>8) & (t<10)]
# elements of t that are not exactly equal to 2
t[t !=2]
#ask R if a number exists in a vector
32 %in% t

## Data types
#scalar objects
x
#vectors 
t

#matrix

#example of a numeric matrix
mat1 <- matrix(data=c(1,2,3), nrow=3, ncol = 3)
#character matrix
mat2 <-  matrix(data=c("Kylie","Wylie","Miley"), nrow=3, ncol = 3)

mat1[1]
mat1[2]
mat1[3]
mat1[9]

mat1[1,3] #mat1[row,column]... in this ex. first row, third column
mat1[1,] #row 1
mat1[,3] #third column

#Dataframes 
#datarames are basically like matrices but with multiple data classes or data types (i.e., logical AND numberic)

df <-  data.frame(mat1[,1],mat2[,1]) #all of column 1 of mat1 and mat2 matrixes 
df

colnames(df) <- c("value","name") #changes column names 
df[1,2] #first row, second column
df[1] #first column
df[,"value"] #can also call the column name to list the values in that row

df$value  #returns same as above; accessing columns
df$value[1] 
df$name[3] 

#subsetting or indexing

#the element of the column value such that names is equal to Jie
df$value[df$name == "Wylie"]

df$value[df$name %in% c("Wylie","Miley")] # use %in% instead of equal 

df$value[df$name != "Miley"]

#return the elements of the column value within the dataframe df such that name is not equal to Kylie and Miley (! is not)
df$value[!df$name %in% c("Kylie","Miley")]

#Subset function
subset(df, name == "Kylie")

#making a new column in a dataframe
df$log_value <- log(df$value)
df

#Installing packages in R 
#tidyverse 
#lme4
#purrr

install.packages("tidyverse") #installs the package from CRAN repository 

library(tidyverse) #loads the functions into Rs

#### Reading data into R ####
#Very important!!! 

#CSV or TXT
#csv <- read.csv("insert filepath here", na.strings="na") NA name is quotes is dependent on how you write it in your data

csv2 <- file.choose() #can find file this way as well 

getwd() #use this to see your working directory



