getwd()
setwd('/home/alpha/Documents/Study/Data analytics with R')
df <-read.csv('pf.tsv',sep='\t')
df
str(df)
View(df)
summary(df)
names(df)
library(ggplot2)

ggplot(data = subset(df,!is.na(gender)), aes(x = friend_count)) +
  geom_histogram(binwidth = 30)+
  scale_x_continuous(limits=c(1,1000),breaks = seq(1,1000,50))
table(df$friend_count)
by(df$friend_count,df$gender,summary)
summary(df)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
ggplot(data=df,aes(x=tenure/365))+
  geom_histogram(binwidth=1,color = 'black', fill = 'green')
ggplot(data=df,aes(x=age))+
  geom_histogram(binwidth=1,color='black',fill='blue')+
  scale_x_continuous(breaks=seq(0,120,1))
 
                 
p1=ggplot(data=df,aes(x=friend_count))+
  geom_histogram(binwidth=30,color = 'black', fill = 'red')+
  scale_x_continuous(limits=c(0,1000),breaks=seq(0,1000,50))+
  xlab('no. of friends')+
  ylab('count')

p2=ggplot(data=df,aes(x=friend_count))+ 
  geom_histogram(color='black',fill='yellow')+
  scale_x_log10(limits=c(1,1000))


p3=
  ggplot(data=df,aes(x=friend_count))+
  geom_histogram(color='black',fill='green' )+
  scale_x_sqrt(limits=c(1,1000),breaks=seq(,1000,50))

library(gridExtra)
grid.arrange(p1,p2,p3,ncol=1)

ggplot(data=df,aes(x=www_likes))+
  geom_freqpoly(aes(color=gender))+
  scale_x_log10()
by(df$www_likes,df$gender,summary)

p<-subset(df,gender=='male')
sum(p$www_likes)
by(df$friendships_initiated,df$gender,summary)
mc<-0
df$mc<-ifelse(df$mobile_likes > 0,1,0)
df$mc<factor(df$mc)
summary(df$mc)
summary(df)
