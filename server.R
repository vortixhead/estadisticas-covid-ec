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
    
    output$rango_fechas <- renderPrint({ input$rango_fechas[1] })
    
    output$hosp_filter <- renderPrint({ input$hosp_filter })
    
    output$hospiPlot <- renderPlot({
        
        # filtros
        filtered_data <- reactive({
            hosp_dia_long %>% 
                filter(informacion %in% input$hosp_filter) %>%
                filter(between(fecha, 
                               as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
                               as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
        })
        
        names(colors) <- levels(factor(hosp_dia_long$informacion))
        custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
        
        hospi_plt <- ggplot(
            filtered_data(), 
            aes(
                x=fecha, 
                y=cantidad, 
                group = informacion, 
                color = informacion)) + 
            geom_line() +
            labs(
                x="Fecha", 
                y="Hospitalizaciones", 
                title="Hospitalizaciones diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(date_labels = "%b %Y") +
            custom_colors
        hospi_plt
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
