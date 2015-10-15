complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        data <- data.frame()
        
        dirname <- dirname("complete.R")
        fextn <- ".csv"
        
        for (monitorId in id) {
                fname <- paste(dirname, "/", directory, "/", sprintf("%03d",monitorId), fextn, sep="")
                csvdata <- read.csv(fname)        
                cc <- complete.cases(csvdata)
                data <- rbind(data, data.frame(monitorId, sum(cc)))
        }       
        
        colnames(data) <- c("id", "nobs")
        data
        
}
