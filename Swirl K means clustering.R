# K Means Clustering

rm(list=ls())

library(swirl)
swirl()
kevbo
bye()
info()
play()
nxt()
main()

mahonk5692@gmail.com
iPoR1xuGqSrA52qV

library(ggplot2)
library(fields)
library(jpeg)
library(datasets)

  # k-means clustering is another simple way of examining and organizing 
# multi-dimensional data. As with hierarchical clustering, this technique is 
# most useful in the early stages of analysis when you're trying to get an
# understanding of the data, e.g., finding some pattern or relationship between 
# different factors or variables.

  # k-means method "aims to partition the points into k groups such that the sum 
# of squares from points to the assigned cluster centres is minimized."

# We must have already decided on a measure of distance (Euclidean)

  # you must first guess how many clusters you have (or want)
# Once you fix this number, you randomly create a "centroid" (a phantom point) 
# for each cluster and assign each point or observation in your dataset to the 
# centroid to which it is closest. Once each point is assigned a centroid, 
# you readjust the centroid's

  # Once you have repositioned the centroids, you must recalculate the distance 
# of the observations to the centroids and reassign any, if necessary, to the 
# centroid closest to them. Again, once the reassignments are done, readjust 
# the positions of the centroids based on the new cluster membership. The 
# process stops once you reach an iteration in which no adjustments are made
# or when you've reached some predetermined maximum number of iterations.

  # a "random" plot has been generated with coordinates stored in 2 vectors
# 'x' and 'y'. Eyeball the display and guess there are 3 clusters for which we 
# pick 3 positions of centroids, one for each cluster.
  # cx and cy are vectors of length=3 which are the x/y coordinates for the 3
# proposed centroids. They are also stored in a 2x3 matrix 'cmat'

## HOW WERE THE CX AND CY COORDINATES CALCULATED FOR INITIAL CLUSTER ASSIGNMENT?

cmat
points(cx,cy,col=c('red',"orange","purple"),pch=3,cex=2,lwd=2)
# first 2 arguments are vectors which create coordinates
# col argument assigns 3 specified colors
# pch=3 is the point type (plus sign +)
# cex is the "expansion of character" i.e. scale, default =1
# lwd is the line width, default =1

  # Initial centroids are placed on plot. To continue, we have to calculate the 
# distances between each point and every centroid - 12 points, 3 centroids means
# 36 distances must be calculated.
  # dist(xi,yi,cxj,cyj) is likely to end up as a matrix with 3 columns and 12 
# rows, to which we take the smallest value from each row and then assign it
# to that column (centroid)

  # mdist() is a function with 4 arguments - similar to guess above
# mdist(x,y,cx,cy)

mdist(x,y,cx,cy)

 # this created 12 columns and 3 rows, inverse of my guess but all the same. 

?which.min
?apply

  # which.min is a function that you can apply to all of the columns of distTmp
# with one call. 

apply(distTmp,2,which.min)
# apply(data,margin (1=row,2=column,...),function)
# apply the function which.min to the data distTmp by column
# essentially, finds the minimum value in each column and should return a vector
# which will display the ROW in WHICH the MINIMUM value is, hence which.min

# cols1<-c("red","orange","purple")
# cluster assignments (the above apply function) are stored in 'newClust'

points(x,y,pch=19,cex=2,col=cols1[newClust])

  # this process assigned points to each initial cluster and colored them to
# match that cluster. 
  # the argument col=cols1[newClust] is pretty neat as newClust is acting as
# a factor and is assigning a single color of the string of length=3 to each
# of the 12 points based on the factor newClust 2 2 2 1 3 3 3 1 3 3 3 3
# orange, orange, orange, red, purple, purple, purple, red, purple, purple, purple
  # How I am used to colors being assigned in points/plots is a single string of
# all of the colors in order, or assigned by point.

  # Now we have to recalculate our centroids so they are the average of the 
#cluster of points assigned to them. We have to do the x and y coordinates 
#separately. This is fine since x and y distance is independent.
#We'll do the x coordinate first. The vectors x and y hold the 
#respective coordinates of our 12 data points.

?tapply

  # We can use the R function tapply which applies "a function over a ragged 
# array". This means that every element of the array is assigned a factor and 
# the function is applied to subsets of the array (identified by the factor 
# vector). This allows us to take advantage of the factor vector newClust 
# we calculated. 
  #Call tapply now with 3 arguments, x (the data), newClust (the factor array), 
# and mean (the function to apply).

tapply(x,newClust,mean)
  # tapply(the data set x, by factor newClust, use the mean() function)
# SOOOO
  # any value of x aligned with the level in newClust will be averaged.
# 2 2 2 1 3 3 3 1 3 3 3 3 is the factor vector. So the first 3 values will be 
# averaged, the 4th and 8th will be averaged, and then the 5:7,9:12 will be 
# averaged. 

tapply(y,newClust,mean)
  # also doing this on y will create a NEW coordinate set for the centroids
# the new variables were created as 'newCx', 'newCy'

points(newCx,newCy,col=cols1,pch=8,cex=2,lwd=2)
  # since we are using the base plotting system, we can keep adding these new
# centroids to the existing plot and compare to the old centroids. However, we
# are not able to remove the old centroids at all

mdist(x,y,newCx,newCy)
  # Again, this calculates the distances of each point to each cluster and 
# returns a 3x12 matrix. Stored as 'distTmp2'

apply(distTmp2,2,which.min)
  # this finds the NEW cluster assignment for each point!
# stored as a vector of factors called 'newClust2'

points(x,y,pch=19,cex=2,col=cols1[newClust2])
  # adds the points to the plot RECOLORED to their NEW cluster assignment

tapply(x,newClust2,mean)
tapply(y,newClust2,mean)

  # calculates the mean distance by cluster for the new groupings, first by x
# coordinate, then by y.
# saved as 'finalCx' and 'finalCy'

points(finalCx,finalCy,col=cols1,pch=9,cex=2,lwd=2)
  # if we continued this process points 5 through 8 would all turn red, while 
# points 1 through 4 stay orange, and points 9 through 12 purple.

  # This was all done step by step, which was neat. But swirl did the work of
# saving the variables and redoing it. I was hoping that I could save the 
# variables, redo it etc until at which point I would make a function with
# for loop to continue the process since it's a cool application of multiple
# functions
  # HOWEVER R actually has a command for k-means clustering

?kmeans

  # kmeans(x,centers,iter.max,nstart)
# x: the numeric matrix of data
# centers: either a number of clusters (single integer) OR a set of initial
  # centroid coordinates
# iter.max: specifies the max number of iterations to go through
# nstart: the number of random starts you want to try IF you specify 
  # centers as a number.

kmeans(dataFrame,centers=3)
  # returns a good amount of information in the console
# saved as object 'kmObj'
# This object can be subset via $ into the following components returned at
# the end 
# "cluster","centers","totss","withinss","tot.withinss","betweenss","size",
# "iter", "ifault"  

kmObj$iter
  # will return the number of iterations the algorithm went through
kmObj$cluster
  # will return the vector of factors with 3 levels indicated by #of clusters

plot(x,y,col=kmObj$cluster,pch=19,cex=2)
  # this will add points colored by their cluster

points(kmObj$centers,col=c("black","red","green"),pch=3,cex=3,lwd=3)
  # adds the centroids, points are stored under $centers

# Testing the kmeans() function with different clusters and plotting them

plot(x,y,col=kmeans(dataFrame,6)$cluster,pch=19,cex=2)
  # since the data points remain the same, we can add this color argument to be
# set equal to the kmeans() function with the same data set but using 6 clusters
# instead. So, same data, colored differently based on kmeans()

# This plot can be run many times just by repeatedly hitting alt+enter!
# a new set of coloring will be applied each time indicating different clusters
# It isn't refining it anymore, but just grouping them differently since the
# initial start is random




