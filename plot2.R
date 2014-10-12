
#Read data (separated by ";" and assigning class to columns)
hpc<-read.csv("household_power_consumption.txt",na.strings="?", header=TRUE, 
              sep=";", colClasses=c("character","character",rep("numeric",7)))

#Transforming the Date into Date format
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")

#Subsetting between "2007-02-01" and "2007-02-02"
hpc_jan<-hpc[hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02",]


#Create a new variable that is the concatenation of the Date and the time
hpc_jan$time_date<-paste(hpc_jan$Date,hpc_jan$Time, sep=", ")
#Transforming the variable into Datetime format
hpc_jan$time_date<-strptime(hpc_jan$time_date, "%d/%m/%Y, %H:%M:%S")



#Plot 2
png(file="plot2.png") #Start the png device

#Draw the plot adding the lines afterwards (no points are drawn here)
with(hpc_jan, plot(time_date, Global_active_power, type="n" , xlab="",
                   ylab="Global Active Power (kilowatts)"))
#Add lines
with(hpc_jan, lines(time_date, Global_active_power))

dev.off() #Close the png device
