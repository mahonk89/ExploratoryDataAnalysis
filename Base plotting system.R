# process of making a plot
# plot(x,y) and hist(x) are 2 examples and will create a new plot graphic
# if one does not already exist. 
?par
# settings are kept within par (parameters) and is highly useful
library(datasets)
hist(airquality$Ozone)
with(airquality,plot(Wind,Ozone))
with(airquality,plot(Month,Ozone,pch=1))


airquality2<-transform(airquality,Month=factor(Month))
boxplot(Ozone ~ Month, airquality2,xlab = "Month",ylab = "Ozone (ppb)")

# important graphing parameters:
#pch: the plotting symbol (default is open circle) (number, which refers
# to a table of built in symbols OR character which will just plot that)
#lty: the line type (default is solid line), can be dashed, dotted, etc.
#lwd: the line width, specified as an integer multiple
#col: the plotting color, specified as a number, string, or hex code;
  #the colors() function gives you a vector of colors by name
#xlab: character string for the x-axis label
#ylab: character string for the y-axis label

colors() # can also subset - length 657

# Within the par() function, certain parameters can be set. Once set/changed
  # from default, these will be the same for every plot that is made.
  #These can be changed when specified as arguments to specific plotting 
    #functions
#las: the orientation of the axis labels on the plot
#bg: the background color
#mar: the margin size 
#oma: the outer margin size 
#mfrow: number of plots per row, column (plots are filled ROW-wise)
#mfcol: number of plots per row, column (plots are filled COLUMN-wise)

## You can find out the default parameters of each simply by calling par()
# with the argument alone
par(pch=1) #changes default plot point from open circle (1) to open triangle(2)

?plot #generic x-y plotting
plot(x,y,...) # creates a scatterplot 

?lines
lines(x,...) # does not create a plot, but adds lines to an existing plot
  # needs an x and y vector, or a 2 column matrix

?points
points(x,...) # adds points to a plot

text(x,...) # adds text labels to a plot using x,y coordinates

?title
title(main,sub,xlab,ylab,line,outer) 
# adds annotations to axis, title, sub, outer margin

?mtext
mtext(text,side=3,line=0,outer=FALSE,at=NA,adj=NA,padj=NA,cex=NA,col=NA,font=NA)

?axis
axis() # adds axis ticks/labels

with(airquality,plot(Wind,Ozone,main="Ozone and Wind in NYC"))
#creates this plot and adds title within the plot function, not afterwards
#using the title function (which can also be done, but not both)
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
#this now adds a set of new (existing, but overridden) points() with a 
#different color to be easily identifiable
title(sub="Blue dots represent the month of May")
# can add a subtitle to clarify what the blue points are now. 

legend("topright",pch=1,col=c("black","blue"),legend=c("Not May","May"))
?legend
# adds a legend to the plot. Specifies location with recognized character 
#strings - bottom, top, left, right, center and combinations are recognized.
# specifies which symbol (pch=1) and the colors of each (black,blue) - since
# length(colorvector)=2, then the legend must equal 2 as well. 

?lm
lm(formula,data,subset,weights,na.action,...) 
#is a function to fit linear models
model<-lm(Ozone ~ Wind, airquality)
model
abline(model)
# create a linear regression model using lm() on Ozone with respect to Wind
# within the airquality data set. Then the abline() function can be used
# to add that linear model to the plot. 

# you can make multiple plots together
# start by setting the parameters of how the plots should be set up - par()

par(mfrow=c(1,2)) # will have 1 row with 2 columns

with(airquality,{
  plot(Wind,Ozone,main="Wind and Ozone")
  plot(Solar.R,Ozone,main="Solar Radiation and Ozone")
  })

# BE SURE TO RUN PAR(MFROW=C(1,2)) PRIOR TO RUNNING THE DOUBLE WITH
# EXPRESSION, OTHERWISE ONLY 1 PLOT WILL BE MADE.
