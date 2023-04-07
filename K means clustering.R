# K-means clustering
rm(list=ls())
# summarizing high dimensional data - What kinds of observations are similar to 
# each other and what observations are very different
# What does it mean to be close? How do we group things? 
# How do we visualize the grouping? How do we interpret the grouping? 

# Pick a distance/similarity that makes sense for your problem
# continuous -- euclidean distance OR correlation similarity
# binary -- manhattan distance

# This is a partitioning approach: Fix a number of clusters, get "centroids" of
  # of each cluster, assign things to the closest centroid, recalculate centroids

# Requires a defined distance metric, a number of clusters, an initial guess

# produces a final estimate of cluster centroids, an assignment of each point 
  # to clusters

set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))

# this data is pretty clustered, looks like 3 clusters
# he adds additional (3) symbols and assigns groups to these symbols (clusters)

?kmeans
# important parameters:
# kmeans(x,centers,iter.max=10,nstart=1)

#Important parameters:
  
# x: numeric matrix of data, or an object that can be coerced to such a matrix 
  #(such as a numeric vector or a data frame with all numeric columns).
# centers: either the number of clusters, say kk, or a set of initial (distinct) 
  #cluster centres. If a number, a random set of (distinct) rows in x is chosen 
  #as the initial centres.
# iter.max: the maximum number of iterations allowed.
# nstart: if centers is a number, how many random sets should be chosen?

dataFrame<-data.frame(x,y)
kmeansObj<-kmeans(dataFrame,centers=3)
names(kmeansObj)
kmeansObj$cluster
str(kmeansObj)
#kmeansObj creates a list of vectors & matrix (centers) using data from the 
  # dataFrame with 2 columns, x & y set above. $centers contains the coords
  # of the initial center points (generated automatically since the argument
  # only sets number of centers, not coords)

par(mar=rep(0.2,4))
plot(x,y,col=kmeansObj$cluster,pch=19,cex=2)
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)

#plot sets colors as the factor levels which corresponds to each grouping
# cex argument sets size of the points based on a scale where 1 is default

## Using heatmaps
set.seed(1234)
dataMatrix<-as.matrix(dataFrame)[sample(1:12),]
kmeansObj2<-kmeans(dataMatrix,centers=3)
par(mfrow=c(1,2),mar=c(2,4,.1,.1))
image(t(dataMatrix)[,nrow(dataMatrix):1],yaxt="n")
image(t(dataMatrix)[,order(kmeansObj$cluster)],yaxt="n")

?t


