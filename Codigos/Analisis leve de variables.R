rango= c()
Tipo= NULL
N_DatosNoCompletos=0
for(i in 1:269){
  t=0
  valores_i=as.numeric(DA[i,2:30])
  maximo=max(valores_i)
  for(j in 1:29){
    if(valores_i[j]==0){
      valores_i[j]=maximo*10
      t= t+1
    }
  }
  if(t==0){
    Tipo[i]="Posee datos de precios en todos los periodos"
  }
  else{
    Tipo[i]="No posee datos en todos los periodos"
    N_DatosNoCompletos=N_DatosNoCompletos+1
  }
  minimo=min(valores_i)
  rango= c(rango, maximo-minimo )
  
}
rango=round(rango,0)

Tabla= data.frame(Producto=Lista_productos, Rango=rango,Tipo=Tipo)
N_DatosNoCompletos#20
