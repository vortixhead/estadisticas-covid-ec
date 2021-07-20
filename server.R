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
    # cargar datos
    source('./load_data.R')

    output$vacun2Plot <- renderPlot({
        filtered_data <- reactive({
            vacun2_dia_long %>% 
                filter(variable %in% input$vacun2_filter) %>%
                filter(between(fecha, 
                               as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
                               as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
        })
        
        colors <- brewer.pal(3, "Dark2")
        names(colors) <- levels(factor(vacun2_dia_long$variable))
        custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
        
        # crear plot
        vacun2_plt <- ggplot(
            filtered_data(), 
            aes(
                x=fecha, 
                y=cantidad, 
                group = variable, 
                color = variable)
        ) + 
            geom_line() +
            labs(
                x="Fecha", 
                y="Vacunas", 
                title="Vacunas arribadas diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(date_labels = "%b %Y") +
            custom_colors
        vacun2_plt
    })
    
    output$hospiPlot <- renderPlot({
        
        # filtros
        filtered_data <- reactive({
            hosp_dia_long %>% 
                filter(informacion %in% input$hosp_filter) %>%
                filter(between(fecha, 
                               as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
                               as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
        })
        
        colors <- brewer.pal(3, "Dark2")
        names(colors) <- levels(factor(hosp_dia_long$informacion))
        custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
        
        hospi_plt <- ggplot(
            filtered_data(), 
            aes(
                x=fecha, 
                y=cantidad, 
                group = informacion, 
                color = informacion
                )
            ) + 
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
        filtered_data <- reactive({
            muert_dia_long %>% 
                filter(informacion %in% input$muert_filter) %>%
                filter(between(fecha, 
                               as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
                               as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
        })
        
        colors <- brewer.pal(4, "Dark2")
        names(colors) <- levels(factor(muert_dia_long$informacion))
        custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
        
        # crear plot
        muert_plt <- ggplot(
            filtered_data(), 
            aes(
                x=fecha, 
                y=cantidad, 
                group = informacion, 
                color = informacion)
        ) + 
            geom_line() +
            labs(
                x="Fecha", 
                y="Muertes", 
                title="Muertes diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(date_labels = "%b %Y") +
            custom_colors
        muert_plt
    })
    
    output$positPlot <- renderPlot({
        filtered_data <- reactive({
            posit_dia_long %>% 
                filter(informacion %in% input$posit_filter) %>%
                filter(between(fecha, 
                               as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
                               as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
        })
        
        colors <- brewer.pal(4, "Dark2")
        names(colors) <- levels(factor(posit_dia_long$informacion))
        custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
        
        # crear plot
        posit_plt <- ggplot(
            filtered_data(), 
            aes(
                x=fecha, 
                y=cantidad, 
                group = informacion, 
                color = informacion)
            ) + 
            geom_line() +
            labs(
                x="Fecha", 
                y="Positivas", 
                title="Pruebas positivas diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(date_labels = "%b %Y") +
            custom_colors
        posit_plt
    })
    
    output$vacunPlot <- renderPlot({
        filtered_data <- reactive({
            vacun_dia_long %>% 
                filter(fabricante %in% input$vacun_filter) %>%
                filter(between(fecha, 
                               as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
                               as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
        })
        
        colors <- brewer.pal(3, "Dark2")
        names(colors) <- levels(factor(vacun_dia_long$fabricante))
        custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
        
        # crear plot
        vacun_plt <- ggplot(
            filtered_data(), 
            aes(
                x=fecha, 
                y=cantidad, 
                group = fabricante, 
                color = fabricante)
        ) + 
            geom_line() +
            labs(
                x="Fecha", 
                y="Vacunas", 
                title="Vacunas arribadas diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(date_labels = "%b %Y") +
            custom_colors
        vacun_plt
    })

})
