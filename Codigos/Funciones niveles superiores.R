
#Calculo del micro indice de producto(MIPRO)#---_-

MIPRO_t.p = function(datos, t, p ){
  MIPRO = NULL
  MIPRO[1] = 100 ##Fijo para el 2018
  for(i in 1:t){
    MIPRO[i+1] =IPRO_t.p(datos, i, p)*MIPRO[i]/100
  }
  X = MIPRO[t+1]
  return(X)
}
##Prueba

MIPRO_t.p(data,1,1)

#Calculo del micro indice de subclase(MISCL)#----
MISCL_t.s = function(datos, t, s, p){
  sum(MIPRO_t.p(datos, t, p)*Wpro_p(p)/Wscl_s(s))
}

######SE NECESITA GUARDAR PONDERACION DE PRODUCTOS COMO Wpro_p #########
######SE NECESITA GUARDAR PONDERACION DE la sub clase COMO Wscl_s #########


#Indice de la subclase#----

ISCL_t.s = function(datos, t ,s){
  MISCL_t.s(datos, t, s)/MISCL_t.s(datos, t-1, s)*100
}

#Calculo del micro indice de clase (MICLA) #----

MICLA_t.c = function(datos, t, c){
  
  sum(MISCL_t.s(datos, t, s)*Wscls(s)/Wcla_c(c))
}

# Indice de clase  #----

ICLA_t.c = function(datos, t, c){
  MICLA_t.c(datos, t, c)/MICLA_t.c(datos, t-1, c)*100
}

# Micro indice de grupo (MIGRU)#----

MIGRU_t.g = function(datos, t, g){
  sum(MICLA_t.c(datos, t, c)*Wcla_c(c)/Wgru_g(g))
}
  
#Indice de grupo (IGRU)#----

IGRU_t.g= function(datos, t, g){
  MIGRU_t.g(datos, t, g) /MIGRU_t.g(datos, t-1, g)*100
}


#Calculo del micro indice de division (MIDIV)

MIDIV_t.d = function(datos, t, d){
  sum(MIGRU_t.g(datos, t, g)*Wgru_g(g)/Wdiv_d(d))
}

## Indice al precio al consumidor (IPC)


IPC_t = function(datos,t){
  N = length(Lista_productos)
  ipc= 0
  for( i in 1:N){
    ipc =+ MIPRO_t.p(datos, t, i)*Wprop_p(i)
  }
  return(ipc)
}

