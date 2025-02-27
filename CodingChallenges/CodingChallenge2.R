#do not need to call wd bc it exists in same directory as  Rproject 

MycotoxinData <- read.csv("MycotoxinData.csv",na.strings="na")


###Assignment 2###

libary(ggplot2)

#Question 2

#Make Box Plot of Treatment (x) and mycotoxins Deoxynivalenol (DON;y)
ggplot(MycotoxinData, aes(x=Treatment, y=DON, color=Cultivar)) +
  geom_boxplot() +
  xlab("")+
  ylab("DON (ppm)")

#Question 3 

#Make Bar Chart with standard-error error bars using the stat_summary() command.
libary(ggplot2)
ggplot(MycotoxinData, aes(x=Treatment, y=DON, color= Cultivar)) +
  stat_summary(fun = mean, geom = "bar",position="dodge")+
  stat_summary(fun.data=mean_se, geom = "errorbar",position="dodge") +
  xlab("")+
  ylab("DON (ppm)")+
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)
#go back and fix this so error bars do not overlap 

#Question 4 

#Adding points to the boxplot 
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar),color="black") + #filling in points by Cultivar, but outlining them in black
  geom_boxplot(outlier.shape=NA) + 
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+ #using jitterdoge to add random variation to point layout, using shape to change the circle shape
  xlab("")+
  ylab("DON (ppm)")

#Adding point to the barchart
#Use dodge in stat_summary features so points dodhge the bars and error bars
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill= Cultivar),color="black") +  #filling in points by Cultivar, but outlining them in black
  stat_summary(fun = mean, geom = "bar", position="dodge")+
  stat_summary(fun.data=mean_se, geom = "errorbar",position = "dodge") + 
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+ #using jitterdoge to add random variation to point layout, using shape to change the circle shape
  xlab("")+
  ylab("DON (ppm)")

#Question 5 

#Saving a vector with colorblind colors 
cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#000000")

#Manually including colorblind colors for my cultivars using scale_fill_manual
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_boxplot(outlier.shape=NA) + #if want to remove outliers there is a function for that
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)")
#scale_fill_manual vs. scale_color_manual, color and fill both mapped to same variable, fill is inside, color is the outline
#color that is not within an aes it will color everything

#Question 6

#Separating out figures by cultivar 
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_boxplot(outlier.shape=NA) + #if want to remove outliers there is a function for that
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21)+
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)")+
  facet_wrap(~Cultivar) #making separate panels by Cultivar

#Question 7

#Add transparency to the points so you can still see the boxplot or bar in the background. 
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_boxplot(outlier.shape=NA) + #if want to remove outliers there is a function for that
  geom_point(position = position_jitterdodge(dodge.width=0.9),shape=21,alpha=0.25)+ #use alpha to crate transparency of points
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm)")+
  facet_wrap(~Cultivar)

#Question 8 

#Violin plot with the y-values shown as a log scale
ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) +
  geom_violin() + #violin plot
  geom_jitter(position = position_jitterdodge(dodge.width=1))+
  scale_y_log10()+ #makes log(10) scale on the y -axis
  scale_fill_manual(values = cbbPalette)+
  xlab("")+
  ylab("DON (ppm) in log10")+
  facet_wrap(~Cultivar)

#Question 9 
#sad0046@auburn.edu