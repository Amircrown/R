complete <- function(directory, id = 1:332) {
    
    data_frame <- data.frame(id =NULL , nobs =NULL )
    
    for (file_number in id){
        
        if (file_number <10) {
            file_n  <- paste("/00" , file_number, sep ='')
        }
        else {
            if (file_number <100)
                file_n  <- paste("/0" , file_number , sep ='')
            else
                file_n <- paste("/" , file_number , sep ='')    
        }
        
        
        address <- paste(directory, file_n, ".csv", sep = '')
        rd <- read.csv(address, header = TRUE)       
        
        result <- complete.cases(rd)
        
        #print(length(result[result==TRUE]))
        data_frame <- rbind(data_frame,
                            data.frame(id = file_number, nobs = length(result[result==TRUE])))
        
    }
    return(data_frame)    
    
    
}