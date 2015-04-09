
# This is from deleteme 2

best <- function(state,outcome){

    
    data <- read.csv("outcome-of-care-measures.csv", colClasses ="character" )
    
    data1<- data[,c(2,7,11,17,23)]
    
    if (outcome == "heart attack")
        coloumn <- 3
    else if (outcome == "heart failure")
        coloumn <- 4
        else if (outcome =="pneumonia")
            coloumn <-5
            else
                stop("invalid outcome")
    
    data_state <- subset(data1, data1[,2]==state, c(1,2,coloumn))
    if (nrow(data_state)==0){
        stop("invalid state")
    }
    
    data_state = subset(data_state, data_state[,3]!="Not Available" )
    #print(data_state[,3])
    data_state[,3]<-as.numeric(data_state[,3], na.rm = TRUE) 
    
    minim_val <- min(data_state[,3])
    minim_list <- subset(data_state,data_state[,3]== minim_val)
    #print(data_state)
    
    
    
    return(sort(minim_list[,1])[1])
    
}