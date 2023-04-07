rm(list=ls())

library(swirl)
swirl()
bye()
info()
play()
nxt()

install_from_swirl("Exploratory Data Analysis")
Kevbo

1

head(airquality)

xyplot(Ozone ~ Wind, data = airquality)
xyplot(Ozone ~ Wind, data = airquality,col="red",pch=8,main="Big Apple Data")
xyplot(Ozone ~ Wind, data = airquality, pch=8, col="red", main="Big Apple Data")

xyplot(Ozone ~ Wind | as.factor(Month), data = airquality,layout=c(5,1))
xyplot(Ozone ~ Wind | Month, data = airquality,layout=c(5,1))

p<-xyplot(Ozone~Wind,data=airquality)
p
names(p)
mynames[myfull]
p[["formula"]]
p[["x.limits"]]

table(f)

xyplot(y~x|f,layout=c(2,1))

source(pathtofile("plot1.R"),local=TRUE)
myedit("plot2.R")

source(pathtofile("plot2.R"),local=TRUE)

table(diamonds$color)
table(diamonds$color,diamonds$cut)
myedit("mylabels.R")
source(pathtofile("myLabels.R"),local=TRUE)
xyplot(price~carat|color*cut, data=diamonds,strip=FALSE,pch=20,xlab=myxlab,ylab=myylab,main=mymain)
