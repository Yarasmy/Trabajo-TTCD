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
})
   

    


