rm(hhpc10)
initialdir<-getwd()

electric<-function(nread=1,nskip=0){

  hhpc<<-read.table("household_power_consumption.txt",nrow=nread,skip=nskip,sep=";",header=T,
                   na.strings = c("?","","NA"),colClasses = colclass,col.names = columnheaders)

  
  sapply(hhpc[,1],as.Date,format="%d/%m/%Y")

  return("Your new data frame named 'hhpc' has been created")
  
}


electric(20,66600)

colclass<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
colnames(hhpc)
columnheaders<-colnames(hhpc)


returnskipn<-function(start){
  m1<-list()
  DF<-read.table("household_power_consumption.txt",nrow=1,skip=start,sep=";",header=T,
                    na.strings = c("?","","NA"),colClasses = colclass,col.names = columnheaders)
  sapply(DF[,1],as.Date,format="%d/%m/%Y")
  startdate<-as.Date("01/02/2007",format = "%d/%m/%Y")

  
  m1[1]<-start
  m1[2]<-DF[1,1]
  m1[3]<-DF[1,2]
  m1[4]<-startdate
  m1[5]<-class(startdate)
  names(m1)<-c("Skip","Date","Time","DTREQ","^class")
  
  tf<-if(DF[1,1]<startdate) T
  #return(tf)
  return(m1)
  #return(c(x1,x2,startdate))
}

returnskipn(66636+2879)
electric(2879,66636) 
?list

60*24*2




hhpc10
hhpc10<-read.table("household_power_consumption.txt",nrow=10,sep=";",header=T,
                   na.strings = c("?","","NA"),colClasses = colclass)
colclass<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")


?as.Date
?strptime
?read.table
?format.Date

#set colClasses vector, length=9 to include date, time classes.
#see coursera for further breakdown and google if necessary
#strptime() and as.Data() functions ---- SOMEHOW

install.packages("tidyverse")
install.packages("lubridate")

stdt<-"06/05/1992"
stdt
class(stdt)
stdt<-as.Date(stdt,format = "%d/%m/%Y")