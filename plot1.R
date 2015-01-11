##uncomment next line if you want to see weekdays in English
##Sys.setlocale("LC_ALL","English")

##load data
filePath <- "household_power_consumption.txt"
if (!file.exists(filePath)) stop("Error: file doesn't exist")
data <- read.table(filePath, sep=";",header = T, na.strings = '?',
                   colClasses = c(rep("character",2),rep("numeric",7)) )

# Get requirement data
sdata <- subset(data, data$Date == "1/2/2007" | 
                  data$Date == "2/2/2007")

# Open graphic device (png)
png(filename = "plot1.png", width = 480, height = 480)

# Produce histogramm
hist(x    = as.numeric(as.character(sdata$Global_active_power)),
     
     # fill the bars
     col  = "red",
     
     # write a title
     main = "Global Active Power",
     
     # write a title of x-axis
     xlab = "Global Active Power (kilowatts)")

# Close graphic device
dev.off()