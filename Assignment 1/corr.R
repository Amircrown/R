#source("complete.R")
corr <- function(directory,threshold = 0){
    
    number_of_files = length(dir("specdata/"))
    
    list_of_completted_cases <- complete(directory, 1:number_of_files)
    
    list_of_meet_threshold <- subset(list_of_completted_cases,nobs>threshold)
    
    List_of_file_numbers <- list_of_meet_threshold[,1]
    
    #result_dataset <- data.frame()
    
    corrolation <-  as.numeric(NULL) 
    
    for (i in List_of_file_numbers){
        
        if (i <10) {
            file_n  <- paste("/00" , i, sep ='')
        }
        else {
            if (i <100)
                file_n  <- paste("/0" , i , sep ='')
            else
                file_n <- paste("/" , i , sep ='')    
        }
        
        
        address <- paste(directory, file_n, ".csv", sep = '')
        rd <- read.csv(address, header = TRUE)     
        x<-rd[,"nitrate"]
        y<-rd[,"sulfate"]
        #print(x)
        
        corrol <- cor(x,y, use = "complete.obs" )
        # print("xorro=",corrol," num=",i)
        corrolation <- c(corrolation,corrol)
        
        #result_dataset = rbind(result_dataset,rd)
        
        
    }
    
    return(corrolation)
    
}