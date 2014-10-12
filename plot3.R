
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



#Plot 3
png(file="plot3.png") #Start the png device

#Setting the plot without the points (to draw the lines afterwards). Add y label
with(hpc_jan, plot(time_date, Sub_metering_1, type="n" , xlab="",
                   ylab="Energy sub metering"))
#Add Submetering 1 in black
with(hpc_jan, lines(time_date, Sub_metering_1, col="black"))
#Add Submetering 2 in red
with(hpc_jan, lines(time_date, Sub_metering_2, col="red"))
#Add Submetering 3 in blue
with(hpc_jan, lines(time_date, Sub_metering_3, col="blue"))

#Adding legend to the graph
legend("topright", lty="solid", col=c("black","red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off() #Close the png device
