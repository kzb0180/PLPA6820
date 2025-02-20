#Kylie Blake Data Visualization Notes 2

#Loading in Packages Required for Visualization
library(tidyverse)
library(ggpubr)
library(ggrepel)

#Translate figure into 1 sentence, you're good to go 
##For publications, use consistent colors and designs, and use a colorblind palette

#Color Blind Palette
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#What makes a good figure?
##Has one major point to the figure
##Consistent colorsfor each variable

###Making the figure###

#Load in the data
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings="na")

#code time point as factor, not a continuous variable
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil","Cotton","Soybean")) #organize data by Crop type

##########Bacterial Evenness - Figure 2a###########
bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as even, and color by Crop
  geom_boxplot(position = position_dodge())+ 
  geom_point(position=position_jitterdodge(0.05))+
  xlab("Time")+
  ylab("Pielou's evenness")+
  scale_color_manual(values=cbbPalette)+
  theme_classic()
bac.even


####### Water Imbibition correlate with bacterial evenness; Figure 2b #####

#make a data frame from orginal data, where crop is not equal to soil (since soil is obviously not a crop)
sample.data.bac.no.soil <- subset(sample.data.bac,Crop!= "Soil")

#Summary of plot: Figure B This code creates a ggplot object water.imbibed using the na.omit(sample.data.bac) dataset. It plots Time.Point on the x-axis and Water_Imbibed (converted to mg) on the y-axis, with different colors for each Crop category. The plot includes jittered points to show individual data points, lines representing the mean value for each Crop group, and error bars representing the standard error of the mean. The x-axis is labeled “Hours post sowing,” and the y-axis is labeled “Water Imbibed (mg).” The colors for the Crop variable are manually set, and the plot uses a classic theme with the legend positioned to the right. Separate panels are created for each Crop, allowing free scales.
water.imbibed <-  ggplot(sample.data.bac.no.soil, aes(x= Time_Point, y=1000*Water_Imbibed, color=Crop)) + #Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_jitter(width=0.5,alpha=0.5) + #Add jittered points to show individual data points wit some transparency 
  stat_summary(fun=mean, geom="line", aes(group=Crop))+#Add lines representing the mean value for each Crop group
  stat_summary(fun.data = mean_se, geom="errorbar",width=0.5) + #Add error bars representing the standard error of the mean
  xlab("Hours post sowing")+ #Label the x-axis
  ylab("Water Imbibed (mg)")+ #Label the y-axis
  scale_color_manual(values=c(cbbPalette[[2]],cbbPalette[[3]]),name="",labels=c("",""))+ #Manually set colors for the Crop variable, referencing 2nd and 3rd color
  theme_classic() + #use classic them for the plot
  theme(strip.background = element_blank(), legend.position = "none")+ #Customize them: remove strip background and position legend to the right
  #strip.bakground takes border away
  facet_wrap(~Crop, scales="free") #Create separate panels for each Crop, allowing free scales 
water.imbibed

########## Figure 2c ############
#scatterplots with points corresponding to the time (shown by diff shapes)
water.imbibed.cor <-  ggplot(sample.data.bac.no.soil, aes(y=even, x=1000*Water_Imbibed, color= Crop)) + #Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_point(aes(shape=Time_Point)) + #Add points with different shapes based on Time.Point
  geom_smooth(se=FALSE, method=lm) + #Add a linear model smooth line without confidence interval shading
  xlab("Water Imbibed (mg)") + #Label x-axis 
  ylab("Pielou's evenness") + #Label the y-axis
  scale_color_manual(values=c(cbbPalette[[2]],cbbPalette[[3]]),name="",labels=c("Cotton","Soybean"))+ #Manually set colors for the Crop variable
  scale_color_manual(values=c(15,16,17,18),name="",labels=c("0hrs","6hrs","12 hrs","18 hrs"))+ #Manually set shapes for the Time_Point variable
  theme_classic()+ #use classic theme for plot
  theme(strip.background= element_blank(),legend.position = "none") + #make background blank and remove legend 
  facet_wrap(~Crop,scales="free") #Create separate panels for each Crop, with own axes
water.imbibed.cor

library(ggplot2)
#How to combine all figures together
figure2 <- ggarrange(
  water.imbibed,  # First plot: water.imbibed
  bac.even,  # Second plot: bac.even
  water.imbibed.cor,  # Third plot: water.imbibed.cor
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 3,  # Arrange the plots in 3 rows
  ncol = 1,  # Arrange the plots in 1 column
  legend = FALSE  # Do not include a legend in the combined figure
)
figure2

###Integrating statistics within plots for explanatory analysis####
#Statistics - integrating plots / figures w/ stats it is really helpful for an exploratory analysis. Do this for exploratory analysis only, but models should still be used to actually analyze your data. 

#anova type designs
bac.even +
  stat_compare_means(method = "anova") #apply an anova to the groups

#Example with pvalues as significance levels
bac.even +
  geom_pwc(aes(group=Crop),method = "t_test", label="p.adj.format")

#Example with pvalues and * as significance levels
bac.even + 
  geom_pwc(aes(group=Time_Point),method="t.test", label ="{p.adj.format}{p.adj.signif}") #draws line from each box to another and tells the p-value


water.imbibed.cor +
  #stat_cor()+ #correlation coefficient
  stat_regline_equation() #add regression line

diff.abund <- read.csv("diff_abund.csv")
str(diff.abund)

diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean)
diff.abund.label <- diff.abund[diff.abund$log10_pvalue >25,] #filtering labels to points freater than 25


volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) + 
  scale_color_manual(values = cbbPalette, name = "Significant") +
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano

volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue)) + 
  geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue), color = "cyan", shape = 17, size = 4) + #only coloring the labeled points
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, label = Label), color = "cyan") + 
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano

#Takeaway - these are powerful tools and the statistical portions help for exploratory analysis. However, keep plots simple and still run your own models, etc to draw results from the data.
