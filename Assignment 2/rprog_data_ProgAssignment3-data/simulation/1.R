Sim_1<-function(times_week, total_sample){
    
w<-0
r<-0
q<-0
p_w<-0
for (i in c(1:total_sample)){
    for (i in c(1:times_week)){
        samp <- sampling()
        if (samp=='w'){
            w<-w+1
            
        }
        else if (samp=='r'){
            r<-r+1
        }
        else
            q<-q+1     
    
    }
}
print(w/(total_sample*times_week))


    
    
}

sampling<-function(){
    a<-sample(0:1,1)
    b<-sample(0:1,1)
    c<-sample(0:1,1)
    if (a==1 & b==1 & c==1){
        return('w')
        
    }
    else if (a==0 & b==0 & c==0){
        return(sampling())
    }
    else
        return('q')    
}