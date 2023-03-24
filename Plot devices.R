# graphing devices
?Devices

#default device for graphing is typically screen device
# to share a plot, you should push it to a file device
  # 
library(datasets)
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")

# to create a plot on a file device, you can explicitly launch
# a graphics device.
# Call a plotting function to make a plot - if using a file device, no plot
  # will appear on the screen
# you must explicitly close the graphics device with dev.off()
?dev.off

pdf(file="oldfaithful_data.pdf") #iniates the graphic device as pdf and 
  #also creates a blank pdf with file name indicated. 
with(faithful,plot(eruptions,waiting)) #standard plot creation-does not 
  #show up in plot tab on bottom right. 
title(main="Old Faithful Geyser Data") #annotate title
dev.off() # must be run to complete the pdf creation after plot is final

# the above 4 lines of code are used to create a pdf plot which can be shared
# like any old pdf file. 

###################################################

## Vector formats
#pdf: useful for line type graphics, resizes well, portable, but not efficient
  #with a lot of points/objects
#svg: XML based scalable vector graphics - supports animation and interactivity
  #potentially useful for web-based plots.
#win.metafile: windows metafile format, windows only
#postscript: not used often, pre-pdf

## Bitmap formats
#png: bitmapped formats good for line drawings or images with solid colors,
  #does not resize well, however it is useful for large sets of data.
#jpeg: good for photos, efficient file sizes, good for large sets of data
  #does not resize well
#tiff:
#bmp: 

## Multiple plot devices
#you can only plot to 1 device at a time
#multiple can be open.
#the currently open graphics device can be called via dev.cur()

?dev.cur

#every open graphics device is assigned an integer >=2
#the active can be changed by running dev.set(integer)

## Copying plots
# for example, if you create a really nice plot on screen and then wish to
# send it to a file, you can use dev.copy()
dev.copy(png,file="bitmapplot.png")
dev.copy2pdf(file="copiedtopdf.pdf")
dev.off()

# this is really nice!
# there seems to also be really nice and easy export options within Rstudio
