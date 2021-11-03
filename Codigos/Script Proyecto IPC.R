library(readr)
library(dplyr)

data = read_delim("Base anonimizada IPC 2019.csv",  delim = "\\", 
                  escape_double = FALSE, 
                  locale = locale(encoding = "ISO-8859-1"), 
                  trim_ws = TRUE)
  

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

