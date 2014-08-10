source("load_script.R")

household_data <- load.and.parse.data()
par( mfrow = c(1,1), mar = c(5,5,5,5))
hist( as.numeric(household_data$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()