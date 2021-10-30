
#Calculo del micro indice de producto(MIPRO)

MIPRO_t.p = function(t,p ){
  MIPRO_t.p(0,p) = 100 ##Fijo para el 2018
  X = IPRO_t.p(t,p)*MIPRO_t.p(t-1,p)/100
  return(X)
}

#Calculo del micro indice de subclase(MISCL)
MISCL_t.s = function(t,s,p){
  sum(MIPRO_t.p(t,p)*Wpro_p(p)/Wscl_s(s))
}

######SE NECESITA GUARDAR PONDERACION DE PRODUCTOS COMO Wpro_p #########
######SE NECESITA GUARDAR PONDERACION DE la sub clase COMO Wscl_s #########


#Indice de la clase

ISCL_t.s = function(t,s){
  MISCL_t.s(t,s)/MISCL_t.s(t-1,s)*100
}

#Calculo del micro indice de clase (MICLA)

MICLA_t.c = function(t,c){
  
  sum(MISCL_t.s(t,s)*Wscls(s)/Wcla_c(c))
}


