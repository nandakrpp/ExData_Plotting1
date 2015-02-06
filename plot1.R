# plot1.R
# 
# Extracts data only from dates of interest, creates a histogram type plot of 
# Global_active_power units and saves it in a png file.
# See further details in assignment page: https://class.coursera.org/exdata-011/human_grading/view/courses/973505/assessments/3/submissions
# 
# Modified from plot1_0_4.R
# Last modified 2015-02-06
# by Nanda Khaorapapong | nanda.krpp@gmail.com
# 


## Read all data as numeric into a data frame with column headers and 
##  without missing values
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
               na.strings="?")

# ## Convert Date variables to Date class
# df$Date <- as.Date(df$Date, format="%d/%m/%Y") # capital Y return 4 digits year
# 
# ## Extract only data from the dates 2007-02-01 and 2007-02-02
# df <- df[df$Date>="2007-02-01" & df$Date <="2007-02-02",]
# ^ To replace these two consecutive methods by the non-conversition method as
#   follows


## Extract data only from 2 dates of interest W/O date conversion
df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,] 

## Plot data from Global_active_power on x-axis with its label defined and
## frequency of each data value on y-axis with automatically added label. Also 
## add main title to the plot
# hist(df$Global_active_power, main="Global Active Power", 
#      xlab="Global Active Power (kilowatts)", ylab="Frequence", col="Red")
hist(df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",  col="Red")

## Copy the plot into a png file
dev.copy(png, file="plot1.png", height=480, width=480) # This function saves and also plots the plot on the Plots window
dev.off() # close the png file device