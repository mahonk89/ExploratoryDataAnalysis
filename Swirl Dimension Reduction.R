# Dimension Reduction

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
CSf1kh9dsKnQujt3

library(ggplot2)
library(fields)
library(jpeg)
library(datasets)

  # In this lesson we'll discuss principal component analysis (PCA) and singular
# value decomposition (SVD), two important and related techniques of dimension 
# reduction. This last entails processes which finding subsets of variables in 
# datasets that contain their essences. 
  # PCA and SVD are used in both the exploratory phase and the more formal 
# modelling stage of analysis. We'll focus on the exploratory phase and briefly 
# touch on some of the underlying theory.

dataMatrix
  # matrix of 400 random normal numbers, mean=0,sd=1, displayed with image()

head(dataMatrix)
heatmap(dataMatrix)

myedit("addPatt.R")
  # the code is below
set.seed(678910)
for(i in 1:40){
  # flip a coin
  coinFlip <- rbinom(1,size=1,prob=0.5)
  # if coin is heads add a common pattern to that row
  if(coinFlip){
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each=5)
  }
}
  # the if statement seems to run if coinFlip returns 1 
# then it will add 0 to the first 5 columns in row i, and 3 to the next/last 3
# columns in the same row. It will only add 3 to the right side of the matrix

source("addPatt.R",local=TRUE)

heatmap(dataMatrix)

  # Suppose you have 1000's of multivariate variables X_1, ... ,X_n. By 
# multivariate we mean that each X_i contains many components, i.e., 
# X_i = (X_{i1}, ... , X_{im}. However, these variables (observations) and 
# their components might be correlated to one another.

  # As data scientists, we'd like to find a smaller set of multivariate 
# variables that are uncorrelated AND explain as much variance (or variability) 
# of the data as possible. This is a statistical approach.
  # In other words, we'd like to find the best matrix created with fewer 
# variables (that is, a lower rank matrix) that explains the original data. 
# This is related to data compression.

  # Two related solutions to these problems are: 
# PCA which stands for Principal Component Analysis and 
# SVD, Singular Value Decomposition. This latter simply means that we express a 
# matrix X of observations (rows) and variables (columns) as the product of 3 
# other matrices, i.e., X=UDV^t. 
# This last term (V^t) represents the transpose of the matrix V.

  # Here U and V each have orthogonal (uncorrelated) columns. 
# U's columns are the left singular vectors of X and 
# V's columns are the right singular vectors of X.  
# D is a diagonal matrix, by which we mean that all of its entries not 
  # on the diagonal are 0. 
# The diagonal entries of D are the singular values of X.

  # 'mat' is an example matrix to illustrate this idea
mat

?svd

svd(mat)
  # this returns a list of 3 objects 
# D - values of diagonal matrix (2)
# U - a 2 x 2 matrix
# V - a 3 x 2 matrix
  # This function can be saved to an object which can be subset to its 
# components i.e. mysvd$d, mysvd$u, mysvd$v to access those vectors/matrices

# diag<-svd(mat)$d
# matu<-svd(mat)$u
# matv<-svd(mat)$v

# Matrix multiplication is done by %*%

matu%*%diag%*%t(matv)

  # As we can see by the result of this matrix multiplication, U*D&V^t is 
# equal to the original matrix mat

  # Now we'll talk a little about PCA, Principal Component Analysis, "a simple, 
#non-parametric method for extracting relevant information from confusing 
#data sets."

  #Basically, PCA is a method to reduce a high-dimensional data set to its 
# essential elements (not lose information) and explain the variability in the 
# data. We won't go into the mathematical details here, (R has a function to 
# perform PCA), but you should know that SVD and PCA are closely related.

  # First we have to scale mat, our simple example data matrix.
# This means that we first
# subtract the column mean from every element and 
# divide the result by the column standard deviation.

  # Of course R has a command, scale, that does this for you. 

svd(scale(mat))

prcomp(scale(mat))
  # This will give you the principal components of mat.
# Notice that the principal components of the scaled matrix, shown in the 
# Rotation component of the prcomp output, ARE the columns of V, the right 
# singular values. 
  # Thus, PCA of a scaled matrix yields the V matrix (right singular vectors) 
# of the same scaled matrix.

svd1$v[,1]

svd1$d

head(constantMatrix)

svd2$d

  # one problem with them that you should be aware of, is that they cannot deal 
# with MISSING data. Neither of them will work if any data in the matrix is 
# missing. (You'll get error messages from R in red if you try.)
  # Missing data is not unusual, so luckily we have ways to work around this 
#problem. One we'll just mention is called imputing the data.

  #This uses the k nearest neighbors to calculate a values to use in place of 
# the missing data. You may want to specify an integer k which indicates how
# many neighbors you want to average to create this replacement value. 
  # The bioconductor package (http://bioconductor.org) has an impute package 
# which you can use to fill in missing data. One specific function in it is
# impute.knn.

dim(faceData)

a1<-(svd1$u[,1]*svd1$d[1])%*%t(svd1$v[,1])

myImage(a1)

a2<-svd1$u[,1:2]%*%diag(svd1$d[1:2])%*%t(svd1$v[,1:2])

myImage(a2)

myImage(svd1$u[,1:5]%*%diag(svd1$d[1:5])%*%t(svd1$v[,1:5]))
myImage(svd1$u[,1:10]%*%diag(svd1$d[1:10])%*%t(svd1$v[,1:10]))

