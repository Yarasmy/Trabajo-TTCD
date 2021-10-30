
library(readxl)
ponderaciones = read_excel("ipc-xls.xlsx", 
                             sheet = "IPC Base 2018=100", skip = 3)


index2 = c()
for (i in 1:length(Lista_productos)) {
  
  lol = which(Lista_productos[i] == ponderaciones$Glosa)
  index2= c(index2,lol)
  
}

ponde = ponderaciones[index2,]

ponde1= na.omit(ponde)


kol = seq(0,3228,12)
pondera = c()
for(i in 1:N){
  
  pondera = c(pondera,mean(ponde1$Ponderación[(kol[i]+1):kol[i+1]]))
  
}





