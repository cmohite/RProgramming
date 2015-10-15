corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
        
        corr <- numeric(0)
        
        dirname <- dirname("complete.R")
        fextn <- ".csv"
        
        for (monitorId in 1:332) {
        
                fname <- paste(dirname, "/", directory, "/", sprintf("%03d",monitorId), fextn, sep="")
                csvdata <- na.omit(read.csv(fname))        
                
                if(nrow(csvdata) >= threshold) {
                        cr <- cor(csvdata["sulfate"], csvdata["nitrate"])
                        if (!is.na(cr)) {
                                corr <- append(corr, cr)
                        }
                }
                
        }       

        corr        
}
