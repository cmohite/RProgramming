pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
        
        
        ## Read files for given Monitor IDs & merge read data into 1 data.frame. 
        ## Find mean from the resultant data.frame for given pollutant.

        data <- data.frame()
        
        dirname <- dirname("pollutantmean.R")
        fextn <- ".csv"
        
        for (monitorId in id) {
                fname <- paste(dirname, "/", directory, "/", sprintf("%03d",monitorId), fextn, sep="")
                csvdata <- read.csv(fname)        
                data <- rbind(data, csvdata)
        }       
        
        result <- mean(data[,pollutant], na.rm=TRUE)
        result
}
