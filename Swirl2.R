library(swirl)
swirl()
bye()
info()
play()
nxt()

sample(colors(),10)

colors()
colorRamp
# takes a palette of colors (red, green blue) and returns a color with a mixture
# of these based on intensity 0:1
# basically used to create a vector of colors which blends the start and end points
# so if c("red","yellow") is used, it would start with red and turn a little more orange
# on its way to yellow, depending on the number of arguments used.
  # colorRamp makes a function that takes a numeric vector where 0<=input<=1 and returns
  # length number of colors
colorRampPalette
  # colorRampPalette does this but by using a number to indicate the number of colors
  #needed


pal<-colorRamp(c("red","blue"))
pal(1)
pal(seq(0,1,len=6))

seq(0,1,len=6)

p1<-colorRampPalette(c("red","blue"))
p1(2)
p1(6)
0xcc

p2<-colorRampPalette(c("red","yellow"))
p2(2)
p2(10)

showMe(p1(20))
showMe(p2(20))
showMe(p2(2))
p1
?rgb

p3<-colorRampPalette(c("blue","green"),alpha=.5)
p3(5)

plot(x,y,pch=19,col=rgb(0,.5,.5,alpha=.3))

install.packages("RColorBrewer")
#These colorBrewer palettes can be used in conjunction with the colorRamp() and colorRampPalette() functions. 
#You would use colors from a colorBrewer palette as your base palette,i.e., as arguments to colorRamp or 
# colorRampPalette which would interpolate them to create new colors.

cols<-brewer.pal(3,"BuGn")
# choose 3 colors from the "BuGn" color palette

showMe(cols)

pal<-colorRampPalette(cols)
showMe(pal(20))

image(volcano,col = pal(20))
image(volcano,col = p1(20))

library(RColorBrewer)
