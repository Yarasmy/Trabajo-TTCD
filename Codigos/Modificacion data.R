DA= matrix(NA,nrow =269 ,ncol=30)
for (i in 1:269) {
  DA[i,1] = posiciones[[i]][[1]]
}
for (k in 1:29) {
  for (i in 1:269){
    ceros= 0
    for (j in 1:length(posiciones[[i]][[2]])) {
      if(posiciones[[i]][[2]][j] == 0){
        ceros = ceros+1
      }
    }
    DA[i,1+k] = sum(data[posiciones[[i]][[2]],(k+8)])/(length(posiciones[[i]][[2]])-ceros)     
  }
}
data3= data.frame(DA)
a=names(data[9:37])
colnames(data3)=c("productos",a[1:29])

data3= data3%>% mutate("Ponderacion" = pond)
data3[,2:30] = apply(data3[,2:30],2,as.numeric)

class(data3$pm_Enero2019)
Costo_canasta =c()
for(i in 1:29){
  Costo_canasta= c(Costo_canasta, sum(data3[i+1])/100000)
  ##100.000, 100 para ajustar el indice, 1000 para dejar en miles
}
C_C <- ts(Costo_canasta, start = 2019, frequency = 12)
####Grafico costo de la canasta basica

plot(C_C, type = "l", lwd = 2, col = "red",font.main = 4, family="serif",
     main = "Precio de la canasta basica", xlab = "Fecha", 
     ylab = "En miles de pesos",  xlim = c(2019,2021.5), 
     ylim = c(70,170), las = 1)

