### plotting systems in R
## base plotting system
# the artists palette model 
# Start with a blank canvas and move up from there
# Start with a plot function
# Use annotations to add/modify (text,lines,points,axis)
# plot() function will generate the plot and annotation functions do that
# Can't go back - if added can't take something away
# Difficult to translate, no specific language to plotting
# plot is just a series of R commands.

library(datasets)
data(cars)
with(cars,plot(speed,dist))

## The lattice system
# plots are created with a single function call (xyplot,bwplot,etc)
# Most useful for conditioning types of plots - how y changes with x
  # across levels of z
# Things like margins and spacing are set automatically because the 
  # plot data is specified at once. 
# Good for putting multiple plots on one screen
# Downside: can be difficult to specify an entire plot in a single 
  # functino call.
# annotation in plot is not especially intuitive
# cannot add to a plot once it has been created
# Use of panel functions and subscripts is difficult to wield and 
  # requires intense preparation

library(lattice)
state.x77
state.region
state<-data.frame(state.x77,region=state.region)

xyplot(Life.Exp ~ Income | region, data=state, layout=c(4,1))
# this plots the life expectancy as the y with respect to income (x)
# and groups/splits by region, data used is the state DF. Layout simply
# sets how the 4 groups are laid out and should be some factor of
# the levels of | region

## ggplot2 system
# splits the difference between the base and lattice systems
# Automatically deals with spacing, text, titles but also allows you
  # to add annotations 
# similar to lattice system but more intuitive and easier to use
# default mode makes many choices for you, but you can change whatever
  # you want however you want. 

library(ggplot2)
data(mpg)
head(mpg)
str(mpg)
qplot(displ,hwy,data=mpg)
?qplot

qplot()


