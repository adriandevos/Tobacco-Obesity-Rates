year2005.plot <- ggplot(year2005, aes(year2005$Former, year2005$Obesity_Rate)) +
  geom_point(color = "darkblue", size = 1)  + labs(x="Former Smokers (%)", y="Obesity Rate")+
  ggtitle("2005") + xlim(20, 35) +ylim(20,35) +theme(plot.title = element_text(lineheight=.8, face="bold"))

year2006.plot <- ggplot(year2006, aes(year2006$Former, year2006$Obesity_Rate)) +
  geom_point(color = "darkblue", size = 1) + labs(x="Former Smokers (%)", y="Obesity Rate")+
  ggtitle("2006") + xlim(20, 35) +ylim(20,35)+theme(plot.title = element_text(lineheight=.8, face="bold"))

year2007.plot <- ggplot(year2007, aes(year2007$Former, year2007$Obesity_Rate)) +
  geom_point(color = "darkblue", size = 1) + labs(x="Former Smokers (%)", y="Obesity Rate")+
  ggtitle("2007") + xlim(20, 35) +ylim(20,35)+theme(plot.title = element_text(lineheight=.8, face="bold"))

year2008.plot <- ggplot(year2008, aes(year2008$Former, year2008$Obesity_Rate)) +
  geom_point(color = "darkblue", size = 1) + labs(x="Former Smokers (%)", y="Obesity Rate")+
  ggtitle("2008") + xlim(20, 35) +ylim(20,35)+theme(plot.title = element_text(lineheight=.8, face="bold"))

year2009.plot <- ggplot(year2009, aes(year2009$Former, year2009$Obesity_Rate)) +
  geom_point(color = "dark blue", size = 1) + labs(x="Former Smokers (%)", y="Obesity Rate")+
  ggtitle("2009") + xlim(20, 35) +ylim(20,35)+theme(plot.title = element_text(lineheight=.8, face="bold"))

year2010.plot <- ggplot(year2010, aes(year2010$Former, year2010$Obesity_Rate)) +
  geom_point(color = "dark blue", size = 1) + labs(x="Former Smokers (%)", y="Obesity Rate")+
  ggtitle("2010") + xlim(20, 35) +ylim(20,35) +theme(plot.title = element_text(lineheight=.8, face="bold"))

grid.arrange(year2005.plot,year2006.plot,year2007.plot,year2008.plot,year2009.plot,year2010.plot)
######################################################################################
west.plot <- ggplot(Western, aes(Western$Year, Western$Everyday)) + 
  labs(x="Year", y="Everyday Smokers (%)")+geom_smooth(method=lm)+
  geom_point(color = "sienna", size = 1) +
ggtitle("Western Smokers")

east.plot <- ggplot(Eastern, aes(Eastern$Year, Eastern$Everyday)) +
  labs(x="Year", y="Everyday Smokers (%)")+geom_smooth(method=lm)+
  geom_point(color = "darkblue", size = 1) +
  ggtitle("Eastern Smokers")

south.plot <- ggplot(Southern, aes(Southern$Year, Southern$Everyday)) +
  labs(x="Year", y="Everyday Smokers (%)")+geom_smooth(method=lm)+
  geom_point(color = "springgreen4", size = 1) +
  ggtitle("Southern Smokers")

midwest.plot <- ggplot(Midwestern, aes(Midwestern$Year, Midwestern$Everyday)) +
  labs(x="Year", y="Everyday Smokers (%)")+geom_smooth(method=lm)+
  geom_point(color = "gold2", size = 1) +
  ggtitle("Midwestern Smokers")

territories.plot <- ggplot(Territory, aes(Territory$Everyday, Territory$Never)) +
  labs(x="Year", y="Everyday Smokers (%)")+geom_smooth(method=lm)+
  geom_point(color = "purple3", size = 1) +
  ggtitle("U.S Territory Smokers")

national.plot <- ggplot(Nationwide, aes(Nationwide$Everyday, Nationwide$Never)) +
  labs(x="Year", y="Everyday Smokers (%)")+geom_smooth(method=lm)+
  geom_point(color = "red4", size = 1) +
  ggtitle("National Smokers")

grid.arrange(east.plot, midwest.plot, south.plot, west.plot, territories.plot, national.plot)
######################################################################################
west.plot2 <- ggplot(Western, aes(Western$Year, Western$Obesity_Rate)) + 
  labs(y="Obesity Rate (%)", x="Smoke Everyday (%)") +  geom_smooth(method=lm)+
  geom_point(color = "sienna", size = 1) +
  ggtitle("Western Obesity Rates")

east.plot2 <- ggplot(Eastern, aes(Eastern$Year, Eastern$Obesity_Rate)) + 
  labs(y="Obesity Rate (%)", x="Smoke Everyday (%)") +  geom_smooth(method=lm)+
  geom_point(color = "darkblue", size = 1) +
  ggtitle("Eastern Obesity Rates")

south.plot2 <- ggplot(Southern, aes(Southern$Year, Southern$Obesity_Rate)) + 
  labs(y="Obesity Rate (%)", x="Smoke Everyday (%)") +  geom_smooth(method=lm)+
  geom_point(color = "springgreen4", size = 1) +
  ggtitle("Southern Obesity Rates")

midwest.plot2 <- ggplot(Midwestern, aes(Midwestern$Year, Midwestern$Obesity_Rate)) + 
  labs(y="Obesity Rate (%)", x="Smoke Everyday (%)") +  geom_smooth(method=lm)+
  geom_point(color = "gold2", size = 1) +
  ggtitle("Midwestern Obesity Rates")

territories.plot2 <- ggplot(Territory, aes(Territory$Year, Territory$Obesity_Rate)) + 
  labs(y="Obesity Rate (%)", x="Year") +  geom_smooth(method=lm)+
  geom_point(color = "purple3", size = 1) +
  ggtitle("U.S Territories Obesity Rates")

national.plot2 <- ggplot(Nationwide, aes(Nationwide$Year, Nationwide$Obesity_Rate)) + 
  labs(y="Obesity Rate (%)", x="Year") +  geom_smooth(method=lm)+
  geom_point(color = "purple3", size = 1) +
  ggtitle("National Obesity Rates")
grid.arrange(east.plot2, midwest.plot2, south.plot2, west.plot2, territories.plot2, national.plot2)
######################################################################################
national.plot2 <- ggplot(Nationwide, aes(Nationwide$Year, Nationwide$Never)) +
  geom_point(color = "red4", size = 1) + geom_smooth(method=lm) +
  labs(x="Year", y="Never Smoked (%)")+
  ggtitle("Non-smoker %")

national.plot3 <- ggplot(Nationwide, aes(Nationwide$Year, Nationwide$Everyday)) +
  geom_point(color = "red4", size = 1) + geom_smooth(method=lm) +
  labs(x="Year", y="Everyday Smokers (%)")+
ggtitle("Everyday smokers %")

national.plot4 <- ggplot(Nationwide, aes(Nationwide$Year, Nationwide$Somedays)) +
  geom_point(color = "red4", size = 1) + geom_smooth(method=lm) +
  labs(x="Year", y="Casual Smokers (%)")+
  ggtitle("Casual smokers %")

national.plot5 <- ggplot(Nationwide, aes(Nationwide$Year, Nationwide$Former)) +
  geom_point(color = "red4", size = 1) + geom_smooth(method=lm) +
  labs(x="Year", y="Former-smokers (%)")+
  ggtitle("Former smoker %")
grid.arrange(national.plot2, national.plot3, national.plot4, national.plot5)
######################################################################################
lmplot1 <- ggplot(tobacco, aes(tobacco$Everyday, tobacco$Obesity_Rate, group=tobacco$Year,  colour=tobacco$Year)) + labs(x="Everyday Smokers (%)", y="Obesity Rate", colour="Years", show.legend = FALSE) +ggtitle("Everyday Smokers")+ stat_smooth(method=lm, se=FALSE) + scale_colour_economist()

lmplot2 <- ggplot(tobacco, aes(tobacco$Never, tobacco$Obesity_Rate, group=tobacco$Year,  colour=tobacco$Year)) + labs(x="Non Smokers (%)", y="Obesity Rate",colour="Years", show.legend = FALSE) +ggtitle("Non-Smokers")+ stat_smooth(method=lm, se=FALSE) + scale_colour_economist()

lmplot3 <- ggplot(tobacco, aes(tobacco$Former, tobacco$Obesity_Rate, group=tobacco$Year,  colour=tobacco$Year)) + labs(x="Former Smokers (%)", y="Obesity Rate", colour="Years", show.legend = FALSE) +ggtitle("Former Smokers")+ stat_smooth(method=lm, se=FALSE) + scale_colour_economist()

lmplot4 <- ggplot(tobacco, aes(tobacco$Somedays, tobacco$Obesity_Rate, group=tobacco$Year,  colour=tobacco$Year)) + labs(x="Casual Smokers (%)", y="Obesity Rate", colour="Years",show.legend = FALSE) +ggtitle("Casual Smokers")+ stat_smooth(method=lm, se=FALSE) + scale_colour_economist()

grid.arrange(lmplot1,lmplot2,lmplot3,lmplot4)
######################################################################################
orig1 <- ggplot(tobacco, aes(tobacco$Everyday, tobacco$Never, color = Obesity_Rank)) + labs(x="Everyday Smokers (%)", y="Non Smokers")+geom_point()
orig2 <- ggplot(tobacco, aes(tobacco$Everyday, tobacco$Never, color = Region)) + labs(x="Everyday Smokers (%)", y="Non Smokers")+geom_point()

grid.arrange(kmeans_plot1, orig1, top="Obesity Rank Clustering Comparison")
######################################################################################
plot(loocv)
plot(error2, type="l", main="Error rates LOOCV",  ylab="Error Rate", xlab="Number of Ks") #Observe minimum error rate is k=1, however error rates are all very high 






