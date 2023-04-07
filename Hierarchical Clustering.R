rm(list=ls())

myplclust <- function(hclust, lab = hclust$labels, lab.col = rep(1, length(hclust$labels)),
                      hang = 0.1, ...) {
  ## modifiction of plclust for plotting hclust objects *in colour*! Copyright
  ## Eva KF Chan 2009 Arguments: hclust: hclust object lab: a character vector
  ## of labels of the leaves of the tree lab.col: colour for the labels;
  ## NA=default device foreground colour hang: as in hclust & plclust Side
  ## effect: A display of hierarchical cluster with coloured leaf labels.
  y <- rep(hclust$height, 2)
  x <- as.numeric(hclust$merge)
  y <- y[which(x < 0)]
  x <- x[which(x < 0)]
  x <- abs(x)
  y <- y[order(x)]
  x <- x[order(x)]
  plot(hclust, labels = FALSE, hang = hang, ...)
  text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order],
       col = lab.col[hclust$order], srt = 90, adj = c(1, 0.5), xpd = NA, ...)
}

dataFrame<-data.frame(x=x,y=y)
distxy<-dist(dataFrame)
hClustering<-hclust(distxy)
myplclust(hClustering,lab=rep(1:3,each=4),lab.col=rep(1:3,each=4))

x<-runif(200,0,999)
y<-runif(200,0,999)

# heatmap() function
df<-data.frame(x=x,y=y)
set.seed(143)
dataMatr<-as.matrix(df)[sample(1:12),]
heatmap(dataMatr)

############# INCOMPLETE

