
# Script de Funciones -----------------------------------------------------


## PM

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

