# Swirl Hierarchical Clustering

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
UA6HRPeyNgZKn0WC

library(fields)

#hierarchical clustering, a simple way of quickly examining and displaying 
#multi-dimensional data. This technique is usually most useful in the early 
#stages of analysis when you're trying to get an understanding of the data,
#e.g., finding some pattern or relationship between different factors or 
#variables. As the name suggests hierarchical clustering creates a hierarchy 
#of clusters.

dataFrame
# contains clusters of "randomly" generated points

dist(dataFrame)
# the dataFrame is a 12x2 (m x n) matrix of coordinates, dist() calculates the 
# distance between each point and returns a (m-1 x m-1) matrix filled in a lower
# right triangle - column starts at min(m) and row starts on min(m)+1
# Entry (i,j) indicates the distance between points i and j. 

# dendrogram: essentially a tree, in this case used to connect 2 of the 
  # closest points.

?hclust
# the argument is the pairwise distance matrix dist(dataFrame) - stored as:
  # distxy

hc<-hclust(distxy)

plot(hc)
plot(as.dendrogram(hc))

#Essentially the same, just no labels.

abline(h=1.5,col="blue")
abline(h=0.4,col="red")
abline(h=0.05,col="green")

# notice how 5:8 and 9:12 are connected with a horizontal line near the top of
# the display, how are distances between clusters of points measured?

# Complete Linkage: trying to measure a distance between two clusters, take 
  # the greatest distance between the pairs of points in those two clusters.
  # Obviously such pairs contain one point from each cluster.

# TO measure the distance between the two clusters 1:4 and 5:8, the greatest 
  # distance would be between 4 and 8
  # 5:8 and 9:12 would be 8 and 11
  # 1:4 and 9:12 would be 4 and 11
    # As luck would have it - not always the case

# The dataframe dFsm contains these 3 points
dist(dFsm)

# Average Linkage: compute an "average" point in each cluster (think of it as 
  # the cluster's center of gravity). You do this by computing the mean 
  # (average) x and y coordinates of the points in the cluster.
# Then you compute the distances between each cluster average to compute the 
  # intercluster distance.

hc

# http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering
# concise tutorial on creating heatmaps in R

?heatmap

heatmap(dataMatrix,col=cm.colors(25))

# mt is a subset from mtcars, contains 6 factors of 11 cars.
heatmap(mt)

# It shows a little better how the rows and columns are treated (clustered and 
# colored) independently of one another. To understand the disparity in color 
# (between the left 4 columns and the right 2) look at mt now.

mt

# four of the columns are all relatively small numbers and only two (disp and 
# hp) are large? That explains the big difference in color columns. Now to 
# understand the grouping of the rows call plot with one argument,
# the dendrogram object denmt we've created for you.

plot(denmt)

distmt






