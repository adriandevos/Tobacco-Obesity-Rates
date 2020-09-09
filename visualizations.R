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
