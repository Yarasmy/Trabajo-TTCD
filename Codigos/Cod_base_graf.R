library(dplyr)
library(skimr)
library(stringr)

l = which(colnames(data) == "pm_16_Enero2019" )

DA1 = as.data.frame(DA)

DA1 = DA1 %>% mutate("Ponderacion" = pond)

DA1[,2:(l-8)] = apply(DA1[,2:(l-8)],2 ,as.numeric)

colnames(DA1)[1:(l-8)]=c("Productos",a)

## Valor de referencia 2018 del ipc " 100.75"


## IPC general -------------------------------------------------------------

l2 = which(colnames(DA1) == "Ponderacion" )

ipc = c()
for(i in 1:(l2-3)){
  razon = sum(DA1[,2+i])/sum(DA1[,i+1])
  ipc = c(ipc,razon)
}


##fechas = seq(from = as.Date("2019-02-01"),
##             by="month", length.out=28)

fechas = seq(as.POSIXct("2019-02-01", tz = "UTC", format = "%Y-%m-%d"),
             by ="1 month",length.out = 28)

data_3 = data.frame(Fecha =fechas,IPC = ipc)


# IPC por producto --------------------------------------------------------


data_ipc = DA1[1]

ipc_general = c()
for(i in 1:dim(DA1)[1]){
  ipc_gen = c()
  for(j in 1:(l2-3)){
    razon = DA1[i,j+2]/DA1[i,j+1]
    ipc_gen = c(ipc_gen,razon)
  }
  ipc_general = rbind(ipc_general,ipc_gen)
  
}

data_ipc = cbind(data_ipc,ipc_general)


# Controlando los nombres de variables ------------------------------------

library(stringr)

Ipc_text = c()
for(i in 1:length(colnames(DA1[3:(l2-1)]))){
  
  x = colnames(DA1[3:(l2-1)])[i]
  n = str_length(colnames(DA1[3:(l2-1)])[i])
  Ipc_text = c(Ipc_text,str_c("Ipc",str_sub(x,3,n)))
  
}



Ipc_text


colnames(data_ipc)[2:(l2-2)] = Ipc_text 

rownames(data_ipc) = seq(1,dim(data_ipc)[1],1)


largo = length(data_ipc)

data_ipc_graf = data.frame(t(data_ipc))

data_ipc_graf = data_ipc_graf[-1,]

colnames(data_ipc_graf) = data_ipc$Productos


rownames(data_ipc_graf) = seq(1,28,1)

class(data_ipc_graf[,2])

N=length(Lista_productos)
data_ipc_graf[,1:N] = apply(data_ipc_graf[,1:N],2 ,as.numeric)

fechas = seq(from = as.Date("2019-02-01"),
             by="month", length.out=28)

data_ipc_graf = data_ipc_graf %>% mutate(Fecha = fechas)

for(i in 1:(N+1)){
  nom =colnames(data_ipc_graf)
  nom[i] = str_replace_all(nom[i]," ","_")
  colnames(data_ipc_graf)[i] = nom[i]
}

colnames(data_ipc_graf)








