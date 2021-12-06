#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$ex1 <- DT::renderDataTable(
    DT::datatable(data3, options = list(pageLength = 25))
  )
  
  output$ex2 <- DT::renderDataTable(
    DT::datatable(Tabla, options = list(pageLength = 25))
  )
  
  selectedData <- reactive({
    data_ipc_graf[, str_replace_all(input$producto," ","_")]
    
  })
      
  output$ex3 <- renderPlot({
    ggplot(data_ipc_graf,aes(y=selectedData(), x=fechas))+
      geom_line()+
      geom_vline(data = lines, aes(xintercept = vlines),col = c("yellow","blue","green","red","red","red"))+
      geom_text(data = lines, aes(x = vlines, y = c(selectedData()[8]+0.02,selectedData()[14]+0.02,selectedData()[15]+0.02
                                                    ,selectedData()[16]+0.02,selectedData()[21]+0.02,selectedData()[26])+0.02, label = labels))+
      labs(title = input$producto,
           x="Meses",y="IPC Individual")+
      theme_light()+
      theme(plot.title = element_text(face="bold",size=17),
            plot.subtitle = element_text(face="italic",size=13))+
      theme(axis.text.x = element_text(face="bold",color="darkgoldenrod4"), 
            axis.title.x = element_text(face = "bold",size=12)) +
      theme(axis.text.y = element_text(face="bold",color="darkgoldenrod4"),
            axis.title.y = element_text(face = "bold",size=12))
   
})
})

   

    


