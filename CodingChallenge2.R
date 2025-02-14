#do not need to call wd bc it exists in same directory as  Rproject 

MycotoxinData <- read.csv("MycotoxinData.csv",na.strings="na")

##ggplot Example###
ggplot(mtcars, aes(x=wt, y=mpg)) +  
  geom_smooth(method = lm, se= FALSE, color="gray") + 
  geom_point(aes(size= wt, color= hp)) + 
  xlab("Weight") +
  ylab("Miles per gallon")+
  scale_color_gradient(low="green",high= "magenta")+
  scale_x_log10() +
  scale_y_continuous(labels = scales::percent) #changes y values to percent 

###Assignment 2###

#Making a a boxplot with Treatment and DON variables 
#Make a boxplot using ggplot with DON as the y variable, 
#treatment as the x variable, and color mapped to the wheat cultivar. Show the code you use to load the libraries you need to read in the data and make the plot. Change the y label to “DON (ppm)” and make the x label blank.
libary(ggplot2)

#Question 2

#making a box plot figure 
ggplot(MycotoxinData, aes(x=Treatment, y=DON, color=Cultivar)) +
  geom_boxplot() +
  xlab("")+
  ylab("DON (ppm)")

#Question 3 

#bar chart with standard-error error bars using the stat_summary() command.
libary(ggplot2)
ggplot(MycotoxinData, aes(x=Treatment, y=DON, color= Cultivar)) +
  stat_summary(fun = mean, geom = "bar")+
  stat_summary(fun.data=mean_se, geom = "errorbar") +
  xlab("")+
  ylab("DON (ppm)")



#Question 4 
#Set the shape = 21 and the outline color black (hint: use jitter_dodge). 

#Adding points to the boxplot 
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar),color="black") +
  geom_boxplot() + #if want to remove outliers there is a function for that
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+
  xlab("")+
  ylab("DON (ppm)")

#Adding point to the barchart
libary(ggplot2)
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill= Cultivar),color="black") +
  stat_summary(fun = mean, geom = "bar", position="dodge")+
  stat_summary(fun.data=mean_se, geom = "errorbar",position = "dodge") +
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+
  xlab("")+
  ylab("DON (ppm)")

#Question 5 
cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#000000")
#Changing fill color of points and boxplots to match some colors in the following colorblind pallet. 

ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_boxplot() + #if want to remove outliers there is a function for that
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)")

#Question 6
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_boxplot() + #if want to remove outliers there is a function for that
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)")+
  facet_wrap(~Cultivar)

#Question 7
#Add transparency to the points so you can still see the boxplot or bar in the background. 

ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_boxplot() + #if want to remove outliers there is a function for that
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.2)+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)")+
  facet_wrap(~Cultivar)

#Question 8 
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_violin(width=10) + #if want to remove outliers there is a function for that
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)")+
  facet_wrap(~Cultivar)
geom_violin() + geom_jitter(height = 0, width = 0.1)

#Question 9 
#sad0046@auburn.edu