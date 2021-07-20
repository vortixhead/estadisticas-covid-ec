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
    # cargar plots
    source('./plots.R')
    
    output$rango_fechas <- renderPrint({ input$rango_fechas })
    
    output$hospiPlot <- renderPlot({
        hospi_plt + 
        xlim(as.Date(input$rango_fechas, format="%Y/%m/%d") )
    })
    
    output$muertPlot <- renderPlot({
        muert_plt + 
        xlim(as.Date(input$rango_fechas, format="%Y/%m/%d") )
    })
    
    output$positPlot <- renderPlot({
        posit_plt + 
        xlim(as.Date(input$rango_fechas, format="%Y/%m/%d") )
    })
    
    output$vacunPlot <- renderPlot({
        vacun_plt + 
        xlim(as.Date(input$rango_fechas, format="%Y/%m/%d") )
    })

})
