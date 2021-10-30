library(readr)
library(dplyr)



data = read_delim("ipc base anual 2018/Base anonimizada IPC 2019.csv", 
                  "\\", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                  trim_ws = TRUE)

diccionario_data = read_delim("ipc base anual 2018/Diccionario datos IPC 2019.csv",
                              ";", escape_double = FALSE, trim_ws = TRUE)

  
Lista_productos = unique(data$Glosa_Producto)
N = length(Lista_productos)
## Encontrando los indices de cada producto

posiciones = list()
index = list()
for(i in 1:N){
  pos = which(Lista_productos[i] == data$Glosa_Producto)
  index = list(Lista_productos[i],pos)
  posiciones[[i]] = index
  
}

posiciones[[7]][[2]]


PM_t.v_e(data,0,1,1)

IVE_t.v.e(data,1,1,1)

unique(data$SUBCLASE[posiciones[[100]][[2]]])

IVAR_t.v_p(data,1,1,1)

IPRO_t.p(data,1,1)

