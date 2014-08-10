source("load_script.R")

household_data <- load.and.parse.data()
date_time_vec <- retrieve.date.vector(household_data)
par( mfrow = c(1,1), mar = c(5,5,5,5))
plot( x = date_time_vec, y=as.numeric( household_data$Global_active_power), 
      type="l", ylab="Global Active Power(kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()