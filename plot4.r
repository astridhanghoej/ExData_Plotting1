setwd("P:/Coursera/exploratorydataanlysis/")
Sys.setlocale(category = "LC_ALL", locale = "english")

#reads in data
power_data<-read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=FALSE, na.strings = "?",skip = 66637, nrow = 2880)

#names variabkes
header<-names(read.table("./exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?",nrow = 1))
names(power_data)<-header
power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time), format="%d/%m/%Y %H:%M:%S")

#checks if load is correct
table(power_data$Date)

#attach dataset for plotting
attach(power_data)

##PLOT4
par(mfrow=c(2,2))
#plot (1,1)
plot(DateTime,Global_active_power, ylab = "Global Active Power (kilowatts)", type="l")
#plot (1,2)
plot(DateTime, Voltage, type="l")
#plot (2,1)
plot(DateTime, Sub_metering_1, ylab = "Energy Sub Metering", type="l", col=1)
lines(DateTime, Sub_metering_2, col=2)
lines(DateTime, Sub_metering_3, col=3)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=1:3, lty=1)
#plot (2,2)
plot(DateTime,Global_reactive_power, type="l")
dev.copy(png,'plot4.png')
dev.off()
