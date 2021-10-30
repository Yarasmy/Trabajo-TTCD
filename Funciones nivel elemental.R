
# Script de Funciones -----------------------------------------------------


## PM
### t>=0

PM_t.v_e = function(datos,t,v,e){
  
  PM = datos %>% filter(FUENTE == e |
                          VARIEDAD == v)
  mes = 9+t
  dime = dim(PM)[1]
  
  return(sum(PM[,mes])/dime)
  
}

## IVE
### t>0

IVE_t.v.e = function(datos,t,v,e){
  
  return(100*PM_t.v_e(datos,t,v,e)/PM_t.v_e(datos,t-1,v,e))
  
}

## IVAR
### t>0

IVAR_t.v_p = function(datos,t,v,p){
  
  datos2 = datos[posiciones[[p]][[2]],]
  ne = length(unique(datos2$FUENTE))
  ivar = 1
  
  for (i in 1:ne){
    
    ivar = ivar*(IVE_t.v.e(datos2,t,v,i))^(1/ne)
    
  }
  
  return(ivar)
}

## IPRO


IPRO_t.p = function(datos,t,p){
  
  datos2 = datos[posiciones[[p]][[2]],]
  nv = length(unique(datos2$VARIEDAD))
  ipro = 1
  
  for (i in 1:nv){
    
    ipro = ipro*(IVAR_t.v_p(datos2,t,i,p))^(1/nv)
    
  }
  
  return(ipro)
}

#### Prueba

PM_t.v_e(data,0,1,1)

IVE_t.v.e(data,1,1,1)

unique(data$SUBCLASE[posiciones[[100]][[2]]])

IVAR_t.v_p(data,1,1,1)

IPRO_t.p(data,1,1)




