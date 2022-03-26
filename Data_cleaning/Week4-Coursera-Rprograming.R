
str(airquality)
str(str)


m <- set.seed(1)
rnorm(5)
v <- rpois(5,2)


library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

str(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])

hist(outcome[, 11])

###### BEST fuction

best <- function(state, outcome) {
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  
  if (state %in% data$State & outcome %in% c("heart failure","heart attack","pneumonia")){
    if(outcome=="heart attack"){
      a<-data[,c(2,7,11)]
    }
    
    if(outcome=="heart failure"){
      a<-data[,c(2,7,17)]
    }
    
    if(outcome=="pneumonia"){
      a<-data[,c(2,7,23)]
    }
    
    b<-split(a,a$State)
    c<-b[[state]]
    c<-c[,c(1,3)]
    colnames(c)<-cbind('Hospital.Name',outcome)
    c[,2]<-as.numeric(c[,2])
    
    d<- c[which(c[,2]==min(c[,2],na.rm=TRUE)),]
    
    best_hospitals<-d$Hospital.Name
    best_hospital<-sort(best_hospitals)[1]
    
  }
  
  else if (state %in% data$State ==FALSE) { stop("invalid state")}
  
  else if (outcome %in% c("heart failure","heart attack","pneumonia")==FALSE){
    stop("invalid outcome")
  }
  
  best_hospital   
}

best("SC", "heart attack")

best("NY", "pneumonia")

best("AK", "pneumonia")



################ Rank hospital #######################


rankhospital <- function(state, outcome,num='best') {
  
  if(is.character(num)){
    if (num %in% c('best','worst')==FALSE){
      stop('Invalid Rank')
    } }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  if (state %in% data$State ==FALSE) { stop("invalid state")}
  
  if (outcome %in% c("heart failure","heart attack","pneumonia")==FALSE){
    stop("invalid outcome")}
  
  
  
  
  if (state %in% data$State & outcome %in% c("heart failure","heart attack","pneumonia")){
    if(outcome=="heart attack"){
      a<-data[,c(2,7,11)]
    }
    
    if(outcome=="heart failure"){
      a<-data[,c(2,7,17)]
    }
    
    if(outcome=="pneumonia"){
      a<-data[,c(2,7,23)]
    }
    
    b<-split(a,a$State)
    c<-b[[state]]
    c<-c[,c(1,3)]
    colnames(c)<-cbind('Hospital.Name',outcome)
    c[,2]<-as.numeric(c[,2])
    
    
    if (num=='best'){
      
      d<- c[which(c[,2]==min(c[,2],na.rm=TRUE)),]
      
      hospitals<-d$Hospital.Name
      hospital<-sort(hospital)[1]
      
    }
    
    if (num=='worst'){
      
      d<- c[which(c[,2]==max(c[,2],na.rm=TRUE)),]
      
      hospitals<-d$Hospital.Name
      hospital<-sort(hospitals)[1]
      
    }
    
    if(is.numeric(num) & num < length(c$Hospital.Name)){
      
      
      l<-c[!is.na(c[,2]),]
      ll<-unique(sort(l[,2]))
      
      m<-c()
      
      for ( i in 1:length(ll)){
        temp<-which(l[,2]==ll[i])
        m<-rbind(m,l[temp,])
      }
      
      k<-m[num,2]
      p1<-which(m[,2]<k)
      p<-which(m[,2]==k)
      
      num2<-num-length(p1)
      
      hospitals<-sort(m[p,1])
      
      hospital<-hospitals[num2] 
      
    }
    
    if (is.numeric(num)){
      if (num > length(c$Hospital.Name)){ 
        return(NA)}}
    
  }
  
  hospital   
}


rankhospital("NC", "heart attack", "worst")

rankhospital("WA", "heart attack", 7)

rankhospital("TX", "pneumonia", 10)

rankhospital("NY", "heart attack", 7)



################ Rankall ####################################### Rankall #######################


rankall <- function(outcome,num='best') {
  
  if(is.character(num)){
    if (num %in% c('best','worst')==FALSE){
      stop('Invalid Rank')
    } }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  if (outcome %in% c("heart failure","heart attack","pneumonia")==FALSE){
    stop("invalid outcome")}
  
  
  
  
  if (outcome %in% c("heart failure","heart attack","pneumonia")){
    if(outcome=="heart attack"){
      a<-data[,c(2,7,11)]
    }
    
    if(outcome=="heart failure"){
      a<-data[,c(2,7,17)]
    }
    
    if(outcome=="pneumonia"){
      a<-data[,c(2,7,23)]
    }}
  
  
  a[,3]<-as.numeric(a[,3])
  
  
  colnames(a)<-cbind('hospital','state','value')
  
  states<-sort(unique(a$state))
  
  b<-split(a,a$state)
  
  ans_state<-c()
  ans_hospital<-c()
  
  
  
  
  for (letter in states){
    
    
    g<-b[[letter]]
    
    g<-g[,c(1,3)]
    
    if (num=='best'){
      
      d<- c[which(g[,2]==min(g[,2],na.rm=TRUE)),]
      
      hospitals<-d$hospital
      hospital<-sort(hospitals)[1]
      
    }
    
    if (num=='worst'){
      
      d<- g[which(g[,2]==max(g[,2],na.rm=TRUE)),]
      
      hospitals<-d$hospital
      hospital<-sort(hospitals)[1]
      
    }
    
    if(is.numeric(num) & num < length(g$hospital)){
      
      
      l<-g[!is.na(g[,2]),]
      ll<-unique(sort(l[,2]))
      
      m<-c()
      
      for ( i in 1:length(ll)){
        temp<-which(l[,2]==ll[i])
        m<-rbind(m,l[temp,])
      }
      
      k<-m[num,2]
      p1<-which(m[,2]<k)
      p<-which(m[,2]==k)
      
      num2<-num-length(p1)
      
      hospitals<-sort(m[p,1])
      
      hospital<-hospitals[num2]
    }
    
    if (is.numeric(num)){
      if (num > length(g$hospital)){ 
        hospital<-NA}}
    
    ans_state<-c(ans_state,letter)
    ans_hospital<-c(ans_hospital,hospital)
    
  }
  
  df = data.frame(ans_hospital, ans_state)       # df is a data frame 
  colnames(df)<-c('hospital','state')
  
  df
}


r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)

