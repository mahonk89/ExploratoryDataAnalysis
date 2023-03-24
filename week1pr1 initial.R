
getwd()

hhpc10<-read.table("household_power_consumption.txt",nrow=10,sep=";",header=T,
                   na.strings = c("?","","NA"),)

hhpc10[1,]

#set colClasses vector, length=9 to include date, time classes.
#see coursera for further breakdown and google if necessary
#strptime() and as.Data() functions ---- SOMEHOW
