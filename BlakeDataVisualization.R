#Kylie Blake Data Visualization Notes

data("mtcars")

str(mtcars)

### plotting examples using Base R. 
plot(mtcars$wt, mtcars$mpg,
     xlab= "Car Weight",
     ylab = "Miles per gallon",
     font.lab=6,
     pch=23)

### GGPLOT2 ###
install.packages("ggplot2")
library(ggplot2)

#Notes about ggplot:
  #Order of calling into the commands matters
  #Ex. want points to be in front of line, so call in geom_point after geom_smooth
ggplot(mtcars, aes(x=wt, y=mpg)) + #call data frame, then aes()
  geom_smooth(method = lm, se= FALSE, color="gray") + #makes a line of best fit, you can change the features in the geom
  geom_point(color= "purple") + #use to call in the data points
  xlab("Weight") +
  ylab("Miles per gallon")

#1. Make our point size scaled by weight example: 
#Note: when put something in main aesthetic, it applies to ALL layers in ggplot - comes up with errors
ggplot(mtcars, aes(x=wt, y=mpg, size=wt)) +  #include size = wt
  geom_smooth(method = lm, se= FALSE, color="gray") + 
  geom_point(color= "purple") + 
  xlab("Weight") +
  ylab("Miles per gallon")

#Ex 2
ggplot(mtcars, aes(x=wt, y=mpg)) +  
  geom_smooth(method = lm, se= FALSE, color="gray") + 
  geom_point(aes(size= wt, color= wt)) + 
  xlab("Weight") +
  ylab("Miles per gallon")
#If put in aesthetics, it can vary depending on the other variables called upon vs. putting color outside of aes()

#Ex 3. Can get more complicated with the figures 
ggplot(mtcars, aes(x=wt, y=mpg)) +  
  geom_smooth(method = lm, se= FALSE, color="gray") + 
  geom_point(aes(size= wt, color= hp)) + 
  xlab("Weight") +
  ylab("Miles per gallon")

#Ex 4. mAKE A COLOR GRADIENT
ggplot(mtcars, aes(x=wt, y=mpg)) +  
  geom_smooth(method = lm, se= FALSE, color="gray") + 
  geom_point(aes(size= wt, color= hp)) + 
  xlab("Weight") +
  ylab("Miles per gallon")+
  scale_color_gradient(low="green",high= "magenta")


#Ex 4. log scale 
ggplot(mtcars, aes(x=wt, y=mpg)) +  
  geom_smooth(method = lm, se= FALSE, color="gray") + 
  geom_point(aes(size= wt, color= hp)) + 
  xlab("Weight") +
  ylab("Miles per gallon")+
  scale_color_gradient(low="green",high= "magenta")+
  scale_x_log10()

#Ex. 5 
ggplot(mtcars, aes(x=wt, y=mpg)) +  
  geom_smooth(method = lm, se= FALSE, color="gray") + 
  geom_point(aes(size= wt, color= hp)) + 
  xlab("Weight") +
  ylab("Miles per gallon")+
  scale_color_gradient(low="green",high= "magenta")+
  scale_x_log10() +
  scale_y_continuous(labels = scales::percent) #changes y values to percent 
  
# ggplot with categorical X and Numeric Y variables
library("ggplot2")

setwd("C:\\Users\\kzb0180\\OneDrive - Auburn University\\Classes\\PLPA 6820\\PLPA6820")

bull.richness <- read.csv("Bull_richness.csv")
str(bull.richness)

bull.richness.soy.no.till <- bull.richness[bull.richness$Crop == "Soy" &
                                             bull.richness$Treatment == "No-till",]

### Boxplot ###
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, color=Fungicide)) +
  geom_boxplot()+
  xlab("") +
  ylab("Fungal Richness") +
  geom_point(position= position_jitterdodge()) #dodge points away from growth state variable, jitter, overlay points in a random fashion so not right on top of each other

#without jitterdodge
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, color=Fungicide)) +
  geom_boxplot()+
  xlab("") +
  ylab("Fungal Richness") +
  geom_point(position= "dodge")


#without jitterdodge
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, color=Fungicide)) +
  geom_boxplot()+
  xlab("") +
  ylab("Fungal Richness") +
  geom_point(position = position_jitterdodge(dodge.width=0.9)) #points look better but less visually appealing

### Barplot ###
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, color=Fungicide)) +
  stat_summary(fun=mean, geom= "bar") +
  stat_summary(fun.data=mean_se, geom = "errorbar") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness") +
  geom_point(position = position_jitterdodge(dodge.width=0.9))

# Step 1: dodge the bars
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, color=Fungicide)) +
  stat_summary(fun=mean, geom= "bar", position = "dodge") +
  stat_summary(fun.data=mean_se, geom = "errorbar", position = "dodge") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness") +
  geom_point(position = position_jitterdodge(dodge.width=0.9))

#Color is the outside line of the plots, where as fill will fill in the box plots:
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, fill=Fungicide)) +
  stat_summary(fun=mean, geom= "bar", position = "dodge") +
  stat_summary(fun.data=mean_se, geom = "errorbar", position = "dodge") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness") +
  geom_point(position = position_jitterdodge(dodge.width=0.9))

#to get points and error bars  to be the same color as the boxes 
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, fill=Fungicide, color = Fungicide)) +
  geom_point(position = position_jitterdodge(dodge.width=0.9)) + #put points higher up to be more visible
  stat_summary(fun=mean, geom= "bar", position = "dodge") +
  stat_summary(fun.data=mean_se, geom = "errorbar", position = "dodge") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness") 

### Lines ###
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, fill=Fungicide, color = Fungicide)) +
  geom_point(position = position_jitterdodge(dodge.width=0.9)) + #put points higher up to be more visible
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data=mean_se, geom = "errorbar") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness") 

#Want to connect lines together, so group by Fungicide to group means together by the variable of focus 
#remove points to see grouping better 
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, group= Fungicide, fill=Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data=mean_se, geom = "errorbar") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness") 

#Remove fill b/c unnecessary here: 
ggplot(bull.richness.soy.no.till, aes(x=GrowthStage, y=richness, group= Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data=mean_se, geom = "errorbar") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness") 


### Faceting ###
ggplot(bull.richness, aes(x=GrowthStage, y=richness, group= Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data=mean_se, geom = "errorbar") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness")  +
  facet_wrap(~Treatment)
#facet_wrap multiple plots on same graph

#To include multiple facets 
ggplot(bull.richness, aes(x=GrowthStage, y=richness, group= Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data=mean_se, geom = "errorbar") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness")  +
  facet_wrap(~Treatment*Crop, scales = "free") #use * as "by" #let R use best scale for figure by scales = "free"
#facet_wrap multiple plots on same graph

#Change order of facets 
ggplot(bull.richness, aes(x=GrowthStage, y=richness, group= Fungicide, color = Fungicide)) +
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data=mean_se, geom = "errorbar") + #have to use fun.data no fun for SE
  xlab("") +
  ylab("Fungal Richness")  +
  facet_wrap(~Crop*Treatment, scales = "free") #OR Crop~Treatment


