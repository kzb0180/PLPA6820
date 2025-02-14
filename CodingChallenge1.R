setwd("C:\\Users\\kzb0180\\OneDrive - Auburn University\\Classes\\PLPA 6820\\PLPA6820")
#main issue with setwd() is it is not reproducible
#make wd where R project is in futue
getwd()
df <-  read.csv("TipsR.csv",na.strings=".")

#Create a vector named 'z' with the values 1 to 200
z <- 1:200

#Print the mean and standard deviation of z on the console
mean(z)
sd(z)

#Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise.
zlog <- z>30

#Make a dataframe with z and zlog as columns. Name the dataframe zdf
zdf <- data.frame(z,zlog)

#Change the column names in your new dataframe to equal “zvec” and “zlogic”
colnames(zdf) = c("zvec","zlogic")

#Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared.
zdf$zsquared <- zdf$zvec^2

#Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100

#with: 
subset1 <-  subset(zdf, zdf$zsquared >10 & zdf$zsquared <100)

#without subset function
subset2 <- zdf[zdf$zsquared >10 & zdf$zsquared <100,] #use dataframe zdf where zsq>10 and <100 for all columns (need that comma)
#zdf[rows,columns]

#Subset the zdf dataframe to only include the values on row 26
subset3 <- zdf[26,]

#Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
subset4 <- data.frame(zdf[180,3])#make a data fram with the value in row 180, column 3
#other option: zdf$zsquared[180]

#Annotate your code, commit the changes and push it to your GitHub