load.and.parse.data <- function(){
  orig_file <- "household_power_consumption.txt"
  summary_file <- "household_power_consumption_02_01-02_02.txt"
  if( !file.exists(summary_file)){
    con <- file(orig_file, "r")
    text <- readLines( con, 1)
    while( length( line <- readLines( con, 1) ) > 0 ){
      if( length( grep(  "^1/2/2007|^2/2/2007", line ) ) > 0 ){
        text <- paste( text, "\n", line, sep="") 
      }
    }
    print( "Finished reading data...")
    close(con)
    
    #Write output to summary file
    
    text.con <- textConnection( text, open="r")
    household_data <- read.csv2( text.con )
    close( text.con )
    write.csv2( household_data, summary_file)
  }
  household_data <- read.csv2(summary_file, stringsAsFactors = FALSE)
  household_data
}
retrieve.date.vector <- function(household_data){
  date_time_vec_str <- paste( household_data$Date, household_data$Time )
  date_time_vec <- strptime( date_time_vec_str, "%d/%m/%Y %H:%M:%S")
  date_time_vec
}