rm()
ls()
?hist
#for hist(), breaks="Sturges" is the default value to determine the width
#of each bar, not necessarily what looks good on the axis.
?rug
?boxplot
?abline
?with #with(data,expression,...) evaluate an R expression in an environment 
  # constructed from data possibly modifying the original data.
?par # see also mfcol, mfrow about halfway down ?par (parameters)
# mfrow=c(nr, nc)
# mar=c(bottom,left,top,right) where values are numeric and adjust margins
# default mar=c(5,4,4,2)+0.1

boxplot(airquality$Wind,col="blue")
abline(h=12) #adds straight line to plot => h is y axis, v is x axis
summary(airquality$Wind)
head(airquality)
hist(airquality$Wind,col="green")
hist(airquality$Wind,col="green",breaks=20)
abline(v=12,lwd=2)
abline(v=median(airquality$Wind),col="magenta",lwd=4)
# where v= vertical line location, lwd is line width, lty will add dashes
barplot(h,col="violet",main = "Frequency of Temperatures")
abline(v=median(airquality$Temp),lwd=4,col="black")
rug(airquality$Wind)

boxplot(Wind ~ Month, data = airquality, col="red")
# data ~ group => within the boxplot, create groups based on right side ~
# showing left side ~ within the data frame data=airquality. All box plots
# will be in reference to the left side, split by right side.

with(airquality, plot(Temp,Wind,col=Month))
with(subset(airquality,Month=5),plot(Temp,Wind))
# see with() function above. With respect to airquality, plot the
  # wind (y) along the temp (x) and separate months by diff colors.

# Exploratory charts are meant to be "quick and dirty". They're useful
# for quickly checking out data and any relationships. Axis names weren't
# really changed, scale wasn't changed. 
# You're able to summariez and highlight broad features. 
# EXplore basic questions and hypothesis and rule some out as well. 
# Suggest modeling strategies for the next steps.
# google website R Graph Gallery.
# 
