#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(datasets)
library(ggplot2)
library(plotly)
# Define UI for application that draws a histogram
shinyUI(navbarPage(
  title = 'IPC en la contingencia',
  tabPanel('Inicio', icon=icon("house-user"),
           fluidRow(
             column(4,img(src = "1.png", height = 360, width = 360),
                          style = "text-align: center;"),

             column(8,
             p(strong("Introducción"),style="text-align:justify;color:black;background-color:lavender;padding:15px;border-radius:10px"),
                          br(),
                          p("Chile enfrento en 2020 una de las peores crisis económicas 
                            de su historia. Esto debido a la crisis social que se inició 
                            en el último trimestre de 2019. Sumado al cierre de fronteras, 
                            prolongadas cuarentenas y la suspensión de ciertas actividades 
                            económicas para controlar el avance de la enfermedad por coronavirus
                            (COVID-19). Todo lo anterior implico un menor nivel de producción y
                            un aumento en el desempleo. Para enfrentar esta situación, el 
                            Gobierno puso en marcha medidas económicas dirigidas a apoyar el
                            ingreso de los hogares, proteger el empleo y brindar alivio económico
                            a empresas afectadas por la pandemia.", 
                            strong("(Fuente: CEPAL. Balance Preliminar de las Economías de 
                                   América Latina y el Caribe ▪ 2020)"),
                            style="text-align:justify;color:black;padding:15px;border-radius:10px"),
        
                          p("Existen diversos indicadores económicos que nos permiten medir y
                            analizar distintos aspectos de una economía, como, por ejemplo: el
                            empleo, la producción, los precios, etc. Dentro del conjunto de
                            indicadores hay algunos que son más perceptibles para las personas
                            porque las afectan directamente, tales como el empleo y el Índice de
                            Precios al Consumidor (IPC). Con el objetivo de acercar la percepción de
                            lo sucedido el año 2020 a la población, decidimos trabajar con el IPC. El
                            fin de este estudio es entregar una visión mas cercana, una ayuda visual que
                            muestre la variación, principalmente ese año, en los precios de la canasta
                            básica.",
                            style="text-align:justify;color:black;padding:15px;border-radius:10px")
                           ))),
  tabPanel('Productos Canasta',  DT::dataTableOutput('ex1')),
  tabPanel("Caracteristicas productos", DT::dataTableOutput('ex2')),
  tabPanel('Graficos Interactivos',     
             sidebarPanel(
               selectInput("producto", "Seleccione producto:", 
                           choices=data_ipc$Productos),
             ),
             
             mainPanel(
               plotOutput("ex3")  
             )
             
           )
))