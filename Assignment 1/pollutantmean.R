
pollutantmean <- function(directory, pollutant, id = 1:332){

    
    sum_mean <- 0
    rd_total <- NULL
    for (file_number in id){
        
        if (file_number <10) {
            file_n  <- paste("/00" , file_number , sep ='')
        }
        else {
            if (file_number <100)
                file_n  <- paste("/0" , file_number , sep ='')
            else
                file_n <- paste("/" , file_number , sep ='')    
        }
        address <- paste (directory, '/', file_n, ".csv", sep = '')
        #print (address)
        rd <- read.csv(address,header = TRUE)
        rd_total <- rbind(rd_total,rd)
        #print(sum_mean)
        
    }
    sum_mean <- mean(rd_total[,pollutant], na.rm = TRUE ) 
    sum_mean 
    
}

