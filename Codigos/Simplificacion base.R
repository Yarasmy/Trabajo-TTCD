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


data3[,2:30] = apply(data3[,2:30],2,as.numeric)


