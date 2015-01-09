# Load data into data.frame
data <- read.csv("~\\household_power_consumption.txt", 
                 sep=";", colClasses = "character")

# Get requirement data
sdata <- subset(data, data$Date == "1/2/2007" | 
                  data$Date == "2/2/2007")

# Create new variable DateTime for producing plots
sdata$DateTime <- paste(sdata$Date, sdata$Time)
sdata$DateTime <- strptime(sdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Open raphic dvice (png)
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

with(sdata, {
  # Plot 1-1
  plot(sdata$DateTime, as.numeric(sdata$Global_active_power),
       type = "l",
       main = "",
       xlab = "",
       ylab = "Global Active Power")
  
  # Plot 1-2
  plot(sdata$DateTime, as.numeric(sdata$Voltage),
       type = "l",
       main = "",
       xlab = "datetime",
       ylab = "Voltage")
  
  # Plot 2-1
  plot(sdata$DateTime, as.numeric(sdata$Sub_metering_1), 
       type = "l", 
       col  = "black", 
       xlab = "",
       ylab = "Energy sub metering")
  lines(sdata$DateTime, as.numeric(sdata$Sub_metering_2), col = "red")
  lines(sdata$DateTime, as.numeric(sdata$Sub_metering_3), col = "blue")
  legend("topright", 
         pch = '___', 
         border = "white",
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # Plot 2-2
  plot(sdata$DateTime, as.numeric(sdata$Global_reactive_power),
       type = "l",
       main = "",
       xlab = "datetime",
       ylab = "Global Reactive Power")
})

# Close graphic device
dev.off()