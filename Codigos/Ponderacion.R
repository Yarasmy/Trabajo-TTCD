
library(readxl)
ponderaciones = read_excel("Datos/ipc-base-2018-serie-referencial-xls.xlsx", 
                             sheet = "IPC Base 2018=100", skip = 3)


index2 = c()

for (i in 1:length(Lista_productos)) {
  lol = which(Lista_productos[i] == ponderaciones$Glosa)
  index2= c(index2,lol)
}

ponde = ponderaciones[index2,]
unique(ponde$Glosa)

## Ponderadores

ponde = ponde[,1:10]

ponde1 = na.omit(ponde)

pond= c()
productos= c()
N=dim(ponde1)[1]
#aaa= c()
#mmm= c()
for(i in 1:N){
  if(ponde1$Año[i] == 2018){
    #aaa= c(aaa,ponde1$Año[i])
    if(ponde1$Mes[i] == 1){
      #mmm= c(mmm, ponde1$Mes[i])
      pond= c(pond, ponde1$Ponderación[i])
      productos= c(productos, ponde1$Glosa[i])
    }
  }
}


sum(pond)

##Chequear que se uso toda la lista de productos
diferentes = setdiff(Lista_productos, productos)
diferentes
#Perfecto :)

##Reescalamos
pond= pond/sum(pond)*100


data_sub= data[,1:8] 
data_sub= cbind(data_sub,PONDERACION= 0)
head(data_sub)


N=dim(data_sub)[1]
N

##Los datos se repiten muchas veces 
rep = as.numeric(table(data_sub$Glosa_Producto))
nom_rep =names(table(data_sub$Glosa_Producto))

for(i in 1:N){
  for(j in 1:length(productos)){
    if(productos[j] == data_sub$Glosa_Producto[i]){
      for(k in 1:269){
        if(data_sub$Glosa_Producto[i] == nom_rep[k]){
          div=rep[k]
        }
      }
      data_sub$PONDERACION[i] = pond[j]/div
    } 
  }
}
head(data_sub)
##Recordar que se reajusto

###############################################################################



