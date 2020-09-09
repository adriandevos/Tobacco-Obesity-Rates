<details><summary>Data Scrubbing Code</summary>
<p>

```{r ,include = FALSE, cache=TRUE, message=FALSE, warning=FALSE}
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
sorted <-sort(index) # First sort the Obesity Rate Values
Obesity_Rank <- cut(sorted, breaks = 3,labels = FALSE) # Cut the sorted values into 3 different ranks

#Check the ranks
Obesity_Rank <- factor(Obesity_Rank, levels = 1:3,labels = c("Low","Medium","High"))

tobacco <- data.frame(Year, Region, State,  Obesity_Rate, Obesity_Rank, Everyday, Former, Never, Somedays)
``` 
