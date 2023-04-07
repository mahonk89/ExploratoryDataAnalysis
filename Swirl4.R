library(swirl)
swirl()
bye()
info()
play()
nxt()

qplot(displ,hwy,data=mpg,geom=c("point","smooth"),facets=.~drv)

g<-ggplot(mpg,aes(displ,hwy))
summary(g)
# calling g via g or print(g) will do nothing since we didn't actually tell
# ggplot what to do with the data. 
g+geom_point()
# by calling g with geom_point() we've added a layer. 
g+geom_point()+geom_smooth()
# this adds another layer to the plot, a smooth line with confidence cloud. This 
# looks like it's just adding a line of averages and variance for each x input.

g+geom_point()+geom_smooth(method="lm")
# Adding an argument inside geom_smooth() we can get something better
# This adds the smooth line by creating a linear model based on the data within g

g+geom_point()+geom_smooth(method="lm")+facet_grid(.~drv)
# by adding the last function we split the plot into 3 sections - recall the facet 
# argument from qplot. The contents of the argument again mean "." as 1 row on left of ~
# and drv (factor w/3 levels) columns on right of ~

# add your own annotation using functions such as xlab(), ylab(), and ggtitle()
# the function labs() is more general and can be used to label either or both axes
# as well as provide a title.

g+geom_point()+geom_smooth(method="lm")+facet_grid(.~drv)+ggtitle("Swirl Rules!")
# the function theme() can be used to modify aspects of the entire plot, e.g. 
# the position of the legend. 
# theme_gray() which is the default theme
# theme_bw() which is a plainer (black and white)

g+geom_point(color="pink",size=4,alpha=1/2)
# alpha changes transparency - darker circles indicate values hit by multiple points

g+geom_point(size=4,alpha=1/2,aes(color=drv))
# Note that you MUST use the function aes since the color of the points is data dependent
# and not a constant as it was in the previous example

g+geom_point(aes(color=drv))+labs(title="Swirl Rules!")+labs(x="Displacement",y="Hwy Mileage")

g+geom_point(size=2,alpha=1/2,aes(color=drv))+geom_smooth(size=4,linetype=3,method="lm",se=FALSE)
# This makes for a really thick dotted line, kinda ugly. method="lm" gives linear model
# the se argument turns OFF the grey shadow (confidence intervals) which is nice.

g+geom_point(aes(color=drv))+theme_bw(base_family = "Times")


plot(myx,myy,type="l",ylim=c(-3,3))
# Testing with base plotting system where data contains 1 outlier in the middle of data
# we manually set ylim to -3,3

g<-ggplot(testdat,aes(myx,myy))
# creates the base data for use in ggplot creation

g+geom_line()
# creates a nice plotline which DOES include the outlier point. We don't like that.

g+geom_line()+ylim(-3,3)
# by adding the ylim function, ggplot2 removes the outlier point from the data instead of
# displaying it 

g+geom_line()+coord_cartesian(ylim=c(-3,3)) #ylim(-3,3)
# using the coord_cartesian(ylim=c(-3,3)) creates a much better graph than just
# adding the ylim function - the outlier is still included.

g<-ggplot(mpg,aes(x=displ,y=hwy,color=factor(year)))

g+geom_point()
g+geom_point()+facet_grid(drv~cyl,margins=TRUE)
# creates a split plot with 4 rows and 5 columns - displ by hwy split by 
# drv rows and cyl columns, year colors are in the original ggplot function
# within g. The margins argument adds the ALL(total) block to each row and column

g+geom_point()+facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",se=FALSE,size=2,color="black")
# This adds a massive linear regression line to each plot which is kinda of ugly. 

g+geom_point()+facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",se=FALSE,size=2,color="black")+
  labs(x="Displacement",y="Highway Mileage",title="Swirl Rules!")


mahonk5692@gmail.com
BfpB6htidSHSnomr
3
1












