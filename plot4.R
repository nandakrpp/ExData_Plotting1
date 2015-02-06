# plot4.R
# 
# Combine plots created from plot1.R, plot3.R together with 2 extra plots i.e. 
# of Voltage and Global_reactive_power data in a single png file.
# 
# 
# TODO:
#         + Tidy up code
#         + submit
# 
# See further details in assignment page: https://class.coursera.org/exdata-011/human_grading/view/courses/973505/assessments/3/submissions
#
# Modified from plot2.R, plot3.R and plot4_0_1.R
# Last modified 2015-02-06
# by Nanda Khaorapapong | nanda.krpp@gmail.com


## Read all data as numeric into a data frame with column headers and 
## without missing values
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")



## Extract data only from 2 dates of interest W/O date conversion
df <- df[df$Date %in% c("1/2/2007","2/2/2007"), ] 



## Convert date and time variables into character variables of 
## "2007-02-01 00:00:00 GMT" format and contatenate them in a vector
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")



## Open png graphic device
png("plot4.png", height=480, width=480) # This function saves but not plots the plot on the Plots window



## Form a 2 rows and 2 columns graphic
par(mfrow = c(2, 2)) 



## Top-left plot -- from plot2.R plus y-axis label defined
## Plot data from Global_reactive_power on y-asix w the axis label and datetime  
## on x-axis w/o label
plot(datetime, df$Global_active_power, type="l", xlab="",
     ylab="Global Active Power") 

## Top-right plot
## Plot Voltage data on the y-axis and datetime of usages on x-axis including
## y-axis label and automatically added x-axis label
plot(datetime, df$Voltage, type="l", ylab="Voltage")

## Bottom-left plot -- from plot3.R with legend's box suppressed
## Plot data from 3 Sub Meterings on y-axis and datetime of usages on x-asix
## Start the first metering data using default colour i.e. black with 
## y-axis name defined. Then add the second and third metering data using a red 
## and blue line colours respectively.
plot(datetime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, df$Sub_metering_2, type="l", col="red") 
lines(datetime, df$Sub_metering_3, type="l", col="blue") 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Bottom-right plot
## Plot Global_reactive_power data on the y-axis with label and datetime of 
## usages on x-axis with automatically added label.
plot(datetime, df$Global_reactive_power, type="l", ylab="Global_reactive_power")



## Close png graphic device
dev.off()