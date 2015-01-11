##uncomment next line to see dayweek names in English
##Sys.setlocale("LC_ALL","English")

##load data
path2file <- "household_power_consumption.txt"
if (!file.exists(path2file)) stop("Error: file doesn't exist")
data <- read.table(path2file, sep=";",header = T, na.strings = '?',
                   colClasses = c(rep("character",2),rep("numeric",7)) )

# Get requirement data
sdata <- subset(data, data$Date == "1/2/2007" | 
                  data$Date == "2/2/2007")

# Create new variable DateTime for producing plots
sdata$DateTime <- paste(sdata$Date, sdata$Time)
sdata$DateTime <- strptime(sdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Open raphic dvice (png)
png(filename = "plot3.png", width = 480, height = 480)

# Produce plot of Submeterings over time
plot(sdata$DateTime, as.numeric(sdata$Sub_metering_1), 
     type = "l", 
     col  = "black", 
     xlab = "",
     ylab = "Energy sub metering")
lines(sdata$DateTime, as.numeric(sdata$Sub_metering_2), col = "red")
lines(sdata$DateTime, as.numeric(sdata$Sub_metering_3), col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close graphic device
dev.off()