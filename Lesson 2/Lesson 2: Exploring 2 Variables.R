setwd('/home/alpha/Documents/Study/Data analytics with R/Lesson 2')
df<-read.csv('pf.tsv',sep = '\t')
View(df)
library(ggplot2)
#1.
ggplot(aes(x=age,y=friend_count),data=df)+
  geom_point(color='red')+
  xlim(13,90)
#2.
ggplot(aes(x=age,y=friend_count),data=df)+
  geom_point(alpha=1/20,color='red')+xlim(13.90)

ggplot(aes(x=age,y=friend_count),data=df)+
  geom_jitter(alpha=1/20,color='red')+
  xlim(13,90)
#3.
ggplot(aes(x=age,y=friend_count),data=df)+
  geom_point(color='red',position = position_jitter(h=0))+
  xlim(13,90)+
  coord_trans(y='sqrt')
#4.
library(dplyr)
# What happends if we directly apply summarise without grouping:
d<-summarise(df,
             fmeanc=mean(friend_count),
             fmedianc=median(friend_count),
             n=n())
View(d)
#Now group by age
nd<-group_by(df,age)
View(nd)
ndd<-summarise(nd,fmeanc=mean(friend_count),
               fmedianc=median(friend_count),
              n= n())
View(ndd)

#5.
ggplot(aes(x=age,y=friend_count),data=df)+
  geom_point(alpha=1/20,color='orange')+xlim(13,90)+
  geom_line(stat='summary',color='red',fun.y=mean)+
  geom_line(stat='summary',color='green',fun.y=median)+
  geom_line(stat='summary',color='blue',fun.y=quantile,fun.args=list(probs=.9),linetype=2)+
  geom_line(stat='summary',color='blue',linetype=3,fun.y=quantile,fun.args=list(probs=.1))

#6.
  cor.test(df$age,df$friend_count,method = 'pearson')
