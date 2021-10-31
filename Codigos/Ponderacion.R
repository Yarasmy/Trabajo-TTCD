
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


pond= c()
productos= c()
N=dim(ponde1)[1]
#aaa= c()
#mmm= c()
for(i in 1:N){
  if(ponde1$Año[i] == 2020){
    #aaa= c(aaa,ponde1$Año[i])
    if(ponde1$Mes[i] == 1){
      #mmm= c(mmm, ponde1$Mes[i])
      pond= c(pond, ponde1$Ponderación[i])
      productos= c(productos, ponde1$Glosa[i])
    }
  }
}
#261
sum(pond)
dim(ponde1)

productos

#5481/261#21
## comentarios son para comprobar el funcionamiento de la funcion

diferentes = setdiff(Lista_productos, productos)
diferentes

## 8 elementos sin ponderacion

pond= pond/sum(pond)*100
Lista_productos=productos


data_sub= data[,1:8]
data_sub= cbind(data_sub,PONDERACION= 0)
head(data_sub)

N=dim(data_sub)[1]
N

for(i in 1:N){
  for(j in 1:length(productos)){
    if(productos[j] == data_sub$Glosa_Producto[i]){
      data_sub$PONDERACION[i] = pond[j]
    } 
  }
}
head(data_sub)
##Recordar que se reajusto

sum(table(data_sub$Glosa_Producto))
##Los datos se repiten muchas veces 
rep = as.numeric(table(data_sub$Glosa_Producto))
nom_rep =names(table(data_sub$Glosa_Producto))


Wscl= c(0,0,0,0)
N=dim(data_sub)[1]
for(i in 1:N){
  ##Son 4 subclases
  for(j in 1:4){
    if(data_sub$SUBCLASE[i] == j){
      for(k in 1:269){
        if(data_sub$Glosa_Producto[i] == nom_rep[k]){
          div=rep[k]
        }
      }
      Wscl[j]= Wscl[j]+data_sub$PONDERACION[i]/div
      #Para reajustar
    }
  }
}

Wscl
sum(Wscl)




