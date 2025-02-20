########Kylie Blake Coding Challenge 3############

MycotoxinData <- read.csv("MycotoxinData.csv",na.strings="na")
library(ggplot2)
library(ggpubr)
library(ggrepel)

#Question 1: 5pts. Using ggplot, create a boxplot of DON by Treatment so that the plot looks like the image below.

#Saving a vector with colorblind colors 
cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7","#000000")

Question1 <- ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) + 
  geom_boxplot(outlier.shape=NA) + 
  geom_point(position = position_jitterdodge(dodge.width=0.9), shape=21,alpha=0.6)+ #jitter dodge points and make them transparent
  scale_fill_manual(values = c(cbbPalette[[2]],cbbPalette[[3]]))+ #manually insert two colors from CbbPalette
  xlab("")+ #label x-axis
  ylab("DON (ppm)")+ #label y-axis
  theme_classic() + #classic theme
  facet_wrap(~Cultivar) #facet by Cultivar
Question1

#Question 2: Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70. 

MycotoxinData$Treatment <- factor(MycotoxinData$Treatment, levels = c("NTC","Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

Question2 <- ggplot(MycotoxinData, aes(x=Treatment, y=DON, fill=Cultivar)) + 
  geom_boxplot(outlier.shape=NA) + 
  geom_point(position = position_jitterdodge(dodge.width=0.9), shape=21,alpha=0.6)+ #jitter dodge points and make them transparent
  scale_fill_manual(values = c(cbbPalette[[2]],cbbPalette[[3]]))+ #manually insert two colors from CbbPalette
  xlab("")+ #label x-axis
  ylab("DON (ppm)")+ #label y-axis
  theme_classic() + #classic theme
  facet_wrap(~Cultivar) #facet by Cultivar
Question2

#Question 3: Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects.

Question3 <- ggplot(MycotoxinData, aes(x=Treatment, y=X15ADON, fill=Cultivar)) + 
  geom_boxplot(outlier.shape=NA) + 
  geom_point(position = position_jitterdodge(dodge.width=0.9), shape=21,alpha=0.6)+ #jitter dodge points and make them transparent
  scale_fill_manual(values = c(cbbPalette[[2]],cbbPalette[[3]]))+ #manually insert two colors from CbbPalette
  xlab("")+ #label x-axis
  ylab("15ADON")+ #label y-axis
  theme_classic() + #classic theme
  facet_wrap(~Cultivar) #facet by Cultivar
Question3

Question3.1 <- ggplot(MycotoxinData, aes(x=Treatment, y=MassperSeed_mg, fill=Cultivar)) + 
  geom_boxplot(outlier.shape=NA) + 
  geom_point(position = position_jitterdodge(dodge.width=0.9), shape=21,alpha=0.6)+ #jitter dodge points and make them transparent
  scale_fill_manual(values = c(cbbPalette[[2]],cbbPalette[[3]]))+ #manually insert two colors from CbbPalette
  xlab("")+ #label x-axis
  ylab("Seed Mass (mg)")+ #label y-axis
  theme_classic() + #classic theme
  facet_wrap(~Cultivar) #facet by Cultivar
Question3.1

#Question4
#Use ggarrange function to combine all three figures into one with three columns and one row. Set the labels for the subplots as A, B and C. Set the option common.legend = T within ggarage function. What did the common.legend option do?
  #a.	HINT: I didn’t specifically cover this in the tutorial, but you can go to the help page for the ggarange function to figure out what the common.legend option does and how to control it. 

#Plotting figures from Question 1 and 3
library(ggpubr)
figure1 <- ggarrange(
  Question1,  # First plot
  Question3,  # Second plot
  Question3.1,  # Third plot
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 1,  # Arrange the plots in 1 rows
  ncol = 3,  # Arrange the plots in 3 column
  common.legend = TRUE  # Do not include a legend in the combined figure
)
figure1

#Question5: Use geom_pwc() to add t.test pairwise comparisons to the three plots made above. Save each plot as a new R object, and combine them again with ggarange as you did in question 4. 

Stat1 <-  Question1 +
  geom_pwc(aes(group=Treatment), method = "t_test",label = "p.adj.format") #Adding t-test to Question 1 figure

Stat2 <- Question3 +
  geom_pwc(aes(group=Treatment),method = "t_test",label = "p.adj.format")  #Adding t-test to Question 2 figure

Stat3 <- Question3.1 +
  geom_pwc(aes(group=Treatment),method = "t_test",label = "p.adj.format")  #Adding t-test to Question 3 figure

#Plotting figures from Question 1 and 3 with the added statistical tests
figure2 <- ggarrange(
  Stat1,  # First plot: water.imbibed
  Stat2,  # Second plot: bac.even
  Stat3,  # Third plot: water.imbibed.cor
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 1,  # Arrange the plots in 3 rows
  ncol = 3,  # Arrange the plots in 1 column
  common.legend = TRUE  # Do not include a legend in the combined figure
)
figure2

