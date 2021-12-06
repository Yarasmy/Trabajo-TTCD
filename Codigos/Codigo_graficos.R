library(ggplot2)
library(plotly)


### Graficos IPC


ipc = c()
for(i in 1:28){
  razon = sum(data3[,2+i])/sum(data3[,i+1])
  ipc = c(ipc,razon)
}

fechas = seq(from = as.Date("2019-02-01"),
             by="month", length.out=28)

data4 = data.frame(Fecha =fechas,IPC = ipc)
lines = data.frame(vlines = c(fechas[8],fechas[14],fechas[15],fechas[16],fechas[21],fechas[26]), 
                    labels = c("Estallido Social","Inicio cuarentenas" ,"Inicio IFE",
                               "1° Retiro 10%","2° Retiro 10%","3° Retiro de 10%"),
                    stringsAsFactors = FALSE)

Grafico_IPC = ggplot(data = data4,aes(Fecha, IPC))+
  geom_line()+
  geom_vline(data = lines, aes(xintercept = vlines),col = c("yellow","blue","green","red","red","red"))+
  geom_text(data = lines, aes(x = vlines, y = c(0.7,1.2,0.7,1.2,0.7,1.2), label = labels))+
  labs(title = "IPC Mensuales",
       x="Meses",y="Valor IPC",
       subtitle = "Data 2019-2021")+
  theme_light()+
  theme(plot.title = element_text(face="bold",size=17),
        plot.subtitle = element_text(face="italic",size=13))+
  theme(axis.text.x = element_text(face="bold",color="darkgoldenrod4"), 
        axis.title.x = element_text(face = "bold",size=12)) +
  theme(axis.text.y = element_text(face="bold",color="darkgoldenrod4"),
        axis.title.y = element_text(face = "bold",size=12))
Grafico_IPC
ggplotly(Grafico_IPC)

### Grafico costo de canasta

Costo_canasta =c()
for(i in 1:29){
  Costo_canasta= c(Costo_canasta, sum(data3[i+1])/100)
}

fecha = seq(from = as.Date("2019-01-01"),
             by="month", length.out=29)

data5 = data.frame(Fecha =fecha,Canasta= Costo_canasta)
Grafico_CostoCanasta = ggplot(data = data5,aes(Fecha, Canasta))+
  geom_line()+
  labs(title = "Costo Canasta Mensuales",
       x="Meses",y="Valor en pesos",
       subtitle = "Data 1981-2019")+
  theme_light()+
  theme(plot.title = element_text(face="bold",size=17),
        plot.subtitle = element_text(face="italic",size=13))+
  theme(axis.text.x = element_text(face="bold",color="darkgoldenrod4"), 
        axis.title.x = element_text(face = "bold",size=12)) +
  theme(axis.text.y = element_text(face="bold",color="darkgoldenrod4"),
        axis.title.y = element_text(face = "bold",size=12))
ggplotly(Grafico_CostoCanasta)


#####
Precio_Compu= c()
for(i in 1:29){
  Precio_Compu= c(Precio_Compu, data3[104,i+1])
}


fecha = seq(from = as.Date("2019-01-01"),
            by="month", length.out=29)

data6 = data.frame(Fecha =fecha,Precio_Compu= Precio_Compu)
Grafico_PrecioCompu = ggplot(data = data6,aes(Fecha, Precio_Compu))+
  geom_line()+
  labs(title = "Precio Computador",
       x="Meses",y="Valor en pesos")+
  theme_light()+
  theme(plot.title = element_text(face="bold",size=17),
        plot.subtitle = element_text(face="italic",size=13))+
  theme(axis.text.x = element_text(face="bold",color="darkgoldenrod4"), 
        axis.title.x = element_text(face = "bold",size=12)) +
  theme(axis.text.y = element_text(face="bold",color="darkgoldenrod4"),
        axis.title.y = element_text(face = "bold",size=12))
ggplotly(Grafico_PrecioCompu)


### Calcularemos la variciaon de productos entre su mismo precio


Variaron = c()
for(i in 1:269){
  a=0
  if(data3[i,2]==0){
    var=NA
    a=1
  }
  if(data3[i,2]==data3[i,30]){
    var=NA
    a=1
  }
  if(a==0){
    var= (data3[i,30]-data3[i,2])/data3[i,2]
    if(var==-1){
      var=0
    }
  }
  Variaron= c(Variaron, var)
}

round(Variaron,2)

aux=na.omit(Variaron)
min(aux)#253
max(aux)#264

Precio_min= c()
for(i in 1:29){
  Precio_min= c(Precio_min, data3[253,i+1])
}
Precio_max= c()
for(i in 1:29){
  Precio_max= c(Precio_max, data3[264,i+1])
}

nombre_min=data3$productos[253]
nombre_max=data3$productos[264]
fecha = seq(from = as.Date("2019-01-01"),
            by="month", length.out=29)

data7 = data.frame(Fecha =fecha,Precio_min= Precio_min, Precio_max=Precio_max)
Grafico_PrecioMenorAum = ggplot(data = data7, aes(Fecha, Precio_min))+
  geom_line()+
  labs(title = "Precio Clases Deportivas",
       x="Meses",y="Valor en pesos")+
  theme_light()+
  theme(plot.title = element_text(face="bold",size=17),
        plot.subtitle = element_text(face="italic",size=13))+
  theme(axis.text.x = element_text(face="bold",color="darkgoldenrod4"), 
        axis.title.x = element_text(face = "bold",size=12)) +
  theme(axis.text.y = element_text(face="bold",color="darkgoldenrod4"),
        axis.title.y = element_text(face = "bold",size=12))
ggplotly(Grafico_PrecioMenorAum)


Grafico_PrecioMayorAum = ggplot(data = data7, aes(Fecha, Precio_max))+
  geom_line()+
  labs(title = "Precio Membresía En 
       Asociación Profesional",
       x="Meses",y="Valor en pesos")+
  theme_light()+
  theme(plot.title = element_text(face="bold",size=17),
        plot.subtitle = element_text(face="italic",size=13))+
  theme(axis.text.x = element_text(face="bold",color="darkgoldenrod4"), 
        axis.title.x = element_text(face = "bold",size=12)) +
  theme(axis.text.y = element_text(face="bold",color="darkgoldenrod4"),
        axis.title.y = element_text(face = "bold",size=12))
ggplotly(Grafico_PrecioMayorAum)

