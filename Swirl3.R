library(swirl)
swirl()
bye()
info()
play()
nxt()

library(ggplot2)
library(ggplot2movies)
library(tidyverse)
library(lubridate)
library(tools)
library(lattice)

str(mpg)
#looking for a correlation between engine displacement (displ) and highway miles
# per gallon (hwy)

qplot(displ,hwy,data=mpg)
# using different colors to subset drive type (3 factors, front, rear, 4w)

qplot(displ,hwy,data=mpg,color=drv)
# a legend is already created and colors are split by drive type

qplot(displ,hwy,data=mpg,color=drv,geom = c("point","smooth"))
# geom has a vector of length 2, point refers to the data points and smooth refers
# to the trned lines we want plotted. The grey area indicate the 95% confidence
# intervals for the lines

qplot(y=hwy,data=mpg,color=drv)
# since x was not specified, it is just taking each hwy value in order

myhigh

qplot(drv,hwy,data=mpg,geom="boxplot")
# for box plots, first arg is what we are splitting the data by, second is what is
#to be measured, hwy split by drv. geom specifies as boxplot

qplot(drv,hwy,data=mpg,geom="boxplot",color=manufacturer)
# adding the color arg in to the boxplot still splits into sections by drv, but also
# splits those sections by manufacturer into colors. 

qplot(hwy,data=mpg,fill=drv)
# since only 1 vector has been specified a histogram is created, fill indicates splitting
# into colors based on drv type

qplot(displ,hwy,data=mpg,facets=.~drv)
#facets argument creates 3 different panels. What facets is set equal to is interesting:
# to the left of ~ is the number of rows, where "." indicates a single row
# to the right of ~ is the number of columns, where drv has 3 factors, implies 3 cols

qplot(hwy,data=mpg,facets=drv~.,binwidth=2)
# facets arg now  has drv on left, 3 rows and . on right, 1 column.

2
1
mahonk5692@gmail.com
ClRttWgqBPQcpou7
3
1
9

