source("load_script.R")
household_data <- load.and.parse.data()
date_time_vec <- retrieve.date.vector(household_data)

energy_sub_mtr_1 <- as.double( household_data$Sub_metering_1 )
energy_sub_mtr_2 <- as.double( household_data$Sub_metering_2 )
energy_sub_mtr_3 <- as.double( household_data$Sub_metering_3 )

par( mfrow = c(2,2), mar = c(5,5,5,5))

plot( x = date_time_vec, y=as.numeric( household_data$Global_active_power), 
      type="l", ylab="Global Active Power", xlab="")

plot( x = date_time_vec, y=as.numeric( household_data$Voltage), type = 'l', xlab="datetime", ylab="Voltage")

plot( x = date_time_vec, y = energy_sub_mtr_1, 
      type="l", ylab="Energy sub metering", xlab="")
lines( x = date_time_vec, energy_sub_mtr_2, col="red")
lines( x = date_time_vec, energy_sub_mtr_3, col="blue")
legend( 'topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c("black", "red", "blue"), lty=1)

plot( x = date_time_vec, y = as.numeric(household_data$Global_reactive_power), type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy( png, file="plot4.png", width=960, height=960 )
dev.off()