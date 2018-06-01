setwd('/home/alpha/Documents/Study/Data analytics with R')
list.files()
df<-read.csv('pf.tsv',sep='\t')
View(df)
library(ggplot2)

#1.
ggplot(aes(x=df$dob_day),data=df)+
  geom_histogram(color='black',fill='red',binwidth = 1)+
  scale_x_continuous(breaks=seq(1,31,1))
#2.
ggplot(aes(x=df$dob_day),data=df)+
  geom_histogram(color='black',fill='red',binwidth = 1)+
  scale_x_continuous(breaks=seq(1,31,1))+
  facet_wrap(~df$dob_month,ncol = 3)
# Also see facet_grid()
#3.
ggplot(aes(x=df$friend_count),data=df)+
  geom_histogram(color='black',fill='red')+
  scale_x_continuous(limits = c(1,1000))
#4.
ggplot(aes(x=friend_count),data=subset(df, !is.na(gender)))+
  geom_histogram(color='black',fill='red',binwidth = 25)+
  scale_x_continuous(limits=c(1,1000),breaks = c(1,1000,50))+
  facet_wrap(~gender)
#5.
by(df$friend_count,df$gender,summary)

#6.
install.packages("gridExtra")

p1=ggplot(aes(x=df$friend_count),data=df)+
  geom_histogram(color='black',fill='red')+
  scale_x_continuous(limits = c(1,1000))
p2=ggplot(aes(x=log(df$friend_count)),data=df)+
  geom_histogram(color='black',fill='orange')
p3=ggplot(aes(x=sqrt(df$friend_count)),data=df)+
  geom_histogram(color='black',fill='green')
library(gridExtra)
grid.arrange(p1,p2,p3,ncol=1)

#7.
# This does not work :
ggplot(aes(x = df$friend_count), data = subset(df, !is.na(gender))) +
  geom_freqpoly(aes(color = gender)) +
  scale_x_log10()
# This workd
ggplot(aes(x=friend_count),data=subset(df,!is.na(gender)))+
  geom_freqpoly(aes(color=gender),binwidth=10)+
  scale_x_continuous(limits = c(1,1000),breaks = seq(0,1000,50))
#8.
ggplot(aes(x=gender,y=friend_count),data=subset(df,!is.na(gender)))+
  geom_boxplot()
