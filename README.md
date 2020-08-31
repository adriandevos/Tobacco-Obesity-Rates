# Tobacco-Obesity-Rates

## Abstract
Many people believe smoking can help people lose weight. This perception is based off the fact that nicotine is an appetite suppressant, leading to young adults to start smoking in order to lose weight. This study is intended to explore the relationship between tobacco use and obesity.
Using multiple models in my experiment to analyze my data, primarily KNN algorithms and K-Means clustering. PCA analysis was a method I initially considered, but the dataset has low dimensions so it is not a necessary model. The primary focus was to see if obesity rates and tobacco use rates were correlated, however I additionally wanted to see if state smoking rates could be clustered by region, as well as by obesity rate ranks.
The data suggests that tobacco use can affect obesity rates, however believing that smoking protects against, or causes, obesity may be over-simplistic. Quitting smoking may be associated with temporary weight gain, but cannot be concluded to increase obesity rates.

## Introduction

The rules and regulations surrounding tobacco use in the United States are changing rapidly. Smoking increases the risk of cancer, respiratory diseases, and cardiovascular diseases. California raised the minimum age to purchase tobacco products to 21 on June 9th, 2016 as a measure to decrease tobacco use, and many states are set to follow. Most states see tobacco use as negative as it has been consistently proven to lead to major health problems.
Many smokers want to quit, but a small percentage actually attempt to. The most common reason people fail to quit is because of addiction, however there are other factors contributing to people’s inability to quit tobacco use. Weight gain concerns can be a very influential in tobacco use, as tobacco can be used as an appetite suppressant. This perception can be a reason that many people start smoking. Scientifically, tobacco use should lead to less weight gain. Nicotine activates pathways in the brain that suppress appetite, causing smokers to typically weight less than non-smokers.
The relationship between tobacco use and obesity rates is complicated, but possibly there is a strong correlation between the two. There is evidence that tobacco use can lead to weight gain, but also that quitting tobacco can lead to weight gain. Food begins to lose its taste after smoking for prolonged periods of time. The idea is that when one quits smoking, one will eat a lot more because of the heightened flavors. This is how I based my study. I wanted to see if an increase in number of former smokers increased obesity rates.
Obesity is also becoming a major public health challenge and its prevalence is increasing worldwide. The definition of obesity can vary, however the CDC defines obesity as having a BMI of 30+.
The tobacco use data I used was taken from a study done by the Center for Disease and Prevention. It consisted of 877 observations and 7 attributes. Detailing from 1995-2010, it included tobacco use percentages of U.S states and territories: former smokers, everyday smokers, non-smokers, and casual smokers. It also included a longitude/latitude coordinate for each state. I removed this column.
I merged the tobacco use data with a dataset compiled by the State of Obesity, a private organization dedicated to preventing obesity in the United States. This dataset included obesity rate percentages per state/territory from 2005-2010. I had to remove observations from the tobacco data set that were before 2005 so there were no blank values.
Additionally, I created two factor variables with the state and obesity rate variable for further exploring tobacco and obesity. My final data set consisted of 8 attributes and 335 observations.
All exploration and analysis was done with RStudio and its included libraries, and compilation of the data was done in Microsoft Excel.

## Exploration
<details><summary>Data Scrubbing Code</summary>
<p>

```{r ,include = FALSE, cache=TRUE, message=FALSE, warning=FALSE}
knitr::opts_chunk$set(echo=TRUE, cache=TRUE, 
                      fig.width=5, fig.height=5,
                      fig.align='center')

## indents are for indenting r code as formatted text
## They may need to be adjusted depending on your OS
indent1 = '    '
indent2 = '        '
indent3 = '            '
runsoln = FALSE
library(ggthemes)
library(dplyr)
library(data.table)
library(maps)
library(ISLR)
library(class)
library(data.table)
library(gridExtra)
library(xtable)
library(ggplot2)
```

```{r, echo=FALSE, indent=indent1, warning=FALSE, message=FALSE}
library(ggthemes)
library(dplyr)
library(data.table)
library(maps)
library(ISLR)
library(class)
library(data.table)
library(gridExtra)
library(xtable)
library(ggplot2)
#Read and relabel
setwd("/Users/adriandevos/Desktop/")
tobacco = read.csv("tobacco2.csv",na.strings=c("", "NA"), stringsAsFactors = FALSE)  # read csv file 

tobacco$Location.1<- NULL
Everyday <- tobacco$Smoke.everyday
Somedays <- tobacco$Smoke.some.days
Former <- tobacco$Former.smoker
Never <- tobacco$Never.smoked
Year <- tobacco$Year
State <- tobacco$State
Region<- tobacco$Region
Obesity_Rate<-tobacco$Rate
tobacco <- subset(tobacco, tobacco$Year>=2005) 

#Remove special characters
Never <- as.numeric(substr(tobacco$Never.smoked,0,nchar(tobacco$Never.smoked)-1))
Everyday <- as.numeric(substr(tobacco$Smoke.everyday,0,nchar(tobacco$Smoke.everyday)-1))
Somedays <- as.numeric(substr(tobacco$Smoke.some.days,0,nchar(tobacco$Smoke.some.days)-1))
Former <- as.numeric(substr(tobacco$Former.smoker,0,nchar(tobacco$Former.smoker)-1))
Obesity_Rate <- as.numeric(substr(tobacco$Rate,0,nchar(tobacco$Rate)-1))

tobacco <- data.frame(Year, Region, State, Obesity_Rate, Everyday, Former, Never, Somedays)



##Dividing data by region
Western <- tobacco[grep("Western", tobacco$Region),]
Eastern <- tobacco[grep("Eastern", tobacco$Region),]
Midwestern <- tobacco[grep("Midwestern", tobacco$Region),]
Territory <- tobacco[grep("Territory", tobacco$Region),]
Southern <- tobacco[grep("Southern", tobacco$Region),]
Nationwide <- tobacco[grep("National", tobacco$Region),]


##Seperate by years
year2005<- tobacco[grep("2005", tobacco$Year),]
year2006<- tobacco[grep("2006", tobacco$Year),]
year2007<- tobacco[grep("2007", tobacco$Year),]
year2008<- tobacco[grep("2008", tobacco$Year),]
year2009<- tobacco[grep("2009", tobacco$Year),]
year2010<- tobacco[grep("2010", tobacco$Year),]
tobacco <- subset(tobacco, tobacco$Year>=2005)

#Create Obesity Rank Factor Variable
index <- tobacco$Obesity_Rate
sorted <-sort(index) # First sort the Crime Rate Values
Obesity_Rank <- cut(sorted, breaks = 3,labels = FALSE) # Cut the sorted values into 5 different ranks

#Check the ranks
Obesity_Rank <- factor(Obesity_Rank, levels = 1:3,labels = c("Low","Medium","High"))

tobacco <- data.frame(Year, Region, State,  Obesity_Rate, Obesity_Rank, Everyday, Former, Never, Somedays)
</p>
</details>
``` 
