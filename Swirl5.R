library(swirl)
swirl()
bye()
info()
play()
nxt()
main()

mahonk5692@gmail.com
yq1CHBcZ8ynVvHW8

rm(list=ls())

str(diamonds)

# plotting a histogram of the price 
qplot(price,data=diamonds)
# this will show the quantity of diamonds in each price point

range(diamonds$price)

qplot(price,data=diamonds,binwidth=18497/30)
brk

counts

#there is a lot of data in here, so plots might take a while
qplot(price,data=diamonds,binwidth=18497/30,fill=cut)
qplot(price,data=diamonds,geom="density")
qplot(price,data=diamonds,geom="density",color=cut)
# above creates a series of density line plots with different color lines
# color makes the line change, fill makes the line filled underneath - nice
# for histograms but maybe not lines
qplot(price,data=diamonds,geom="density",fill=cut)

qplot(carat,price,data=diamonds)

qplot(carat,price,data=diamonds,shape=cut)
#changes the points to different shapes based on cut

qplot(carat,price,data=diamonds,color=cut)
qplot(carat,price,data=diamonds,color=cut)+geom_smooth(method="lm")

qplot(carat,price,data=diamonds,color=cut,facets=.~cut)+geom_smooth(method="lm")


g<-ggplot(diamonds,aes(depth,price))

summary(g)
g+geom_point(alpha=1/3)
cutpoints<-quantile(diamonds$carat,seq(0,1,length=4),na.rm=TRUE)
cutpoints
diamonds$car2<-cut(diamonds$carat,cutpoints)

g<-ggplot(diamonds,aes(depth,price))

g+geom_point(alpha=1/3)+facet_grid(cut~car2)
diamonds[myd,]

g+geom_point(alpha=1/3)+facet_grid(cut~car2)+geom_smooth(method="lm",size=3,color="pink")


ggplot(diamonds,aes(carat,price))+geom_boxplot()+facet_grid(.~cut)










