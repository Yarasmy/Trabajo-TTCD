
#Calculo del micro indice de producto(MIPRO)

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

#Calculo del micro indice de subclase(MISCL)
MISCL_t.s = function(datos, t, s, p){
  sum(MIPRO_t.p(datos, t, p)*Wpro_p(p)/Wscl_s(s))
}

######SE NECESITA GUARDAR PONDERACION DE PRODUCTOS COMO Wpro_p #########
######SE NECESITA GUARDAR PONDERACION DE la sub clase COMO Wscl_s #########


#Indice de la clase

ISCL_t.s = function(datos, t ,s){
  MISCL_t.s(datos, t, s)/MISCL_t.s(datos, t-1, s)*100
}

#Calculo del micro indice de clase (MICLA)

MICLA_t.c = function(t,c){
  
  sum(MISCL_t.s(datos, t, s)*Wscls(s)/Wcla_c(c))
}



