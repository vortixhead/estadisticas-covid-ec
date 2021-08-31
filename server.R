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

    output$vacun2Plot <- renderPlotly({
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
                color = variable)
        ) + 
            geom_line() +
            labs(
                x="", 
                y="Vacunas", 
                title="Vacunas aplicadas por día", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(breaks = date_breaks("months"), date_labels = "%b %Y") +
            theme(axis.text.x = element_text(angle = 45)) +
            custom_colors+
            scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))
        vacun2_plt
    })
    
    output$hospiPlot <- renderPlotly({
        
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
                color = informacion
                )
            ) + 
            geom_line() +
            labs(
                x="", 
                y="Hospitalizaciones", 
                title="Hospitalizaciones diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(breaks = date_breaks("months"), date_labels = "%b %Y") +
            theme(axis.text.x = element_text(angle = 45)) +
            custom_colors +
            scale_y_continuous(labels = unit_format(unit = "K", scale = 1e-3))
        hospi_plt
    })
    
    output$muertPlot <- renderPlotly({
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
                color = informacion)
        ) + 
            geom_line() +
            labs(
                x="", 
                y="Muertes", 
                title="Muertes diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(breaks = date_breaks("months"), date_labels = "%b %Y") +
            theme(axis.text.x = element_text(angle = 45)) +
            custom_colors +
            scale_y_continuous(labels = unit_format(unit = "K", scale = 1e-3))
        muert_plt
    })
    
    output$positPlot <- renderPlotly({
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
                color = informacion)
            ) + 
            geom_line() +
            labs(
                x="", 
                y="Positivas", 
                title="Pruebas positivas diarias", 
                color = 'Leyenda') +
            theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
            scale_x_date(breaks = date_breaks("months"), date_labels = "%b %Y") +
            theme(axis.text.x = element_text(angle = 45)) +
            custom_colors +
            scale_y_continuous(labels = unit_format(unit = "K", scale = 1e-3))
        posit_plt
    })
    
    # output$vacunPlot <- renderPlotly({
    #     filtered_data <- reactive({
    #         vacun_dia_long %>% 
    #             filter(fabricante %in% input$vacun_filter) %>%
    #             filter(between(fecha, 
    #                            as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
    #                            as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
    #     })
    #     
    #     colors <- brewer.pal(3, "Dark2")
    #     names(colors) <- levels(factor(vacun_dia_long$fabricante))
    #     custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
    #     
    #     # crear plot
    #     vacun_plt <- ggplot(
    #         filtered_data(), 
    #         aes(
    #             x=fecha, 
    #             y=cantidad, 
    #             color = fabricante)
    #     ) + 
    #         geom_line() +
    #         labs(
    #             x="", 
    #             y="Vacunas", 
    #             title="Vacunas arribadas diarias", 
    #             color = 'Leyenda') +
    #         theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
    #         scale_x_date(breaks = date_breaks("months"), date_labels = "%b %Y") +
    #         theme(axis.text.x = element_text(angle = 45)) +
    #         custom_colors +
    #         scale_y_continuous(labels = unit_format(unit = "M", scale = 1e-6))
    #     vacun_plt
    # })
    
    # output$camasPlot <- renderPlotly({
    #     filtered_data <- reactive({
    #         camas_dia_long %>% 
    #             filter(informacion %in% input$camas_filter) %>%
    #             filter(between(fecha, 
    #                            as.Date(input$rango_fechas[1], format="%Y/%m/%d"), 
    #                            as.Date(input$rango_fechas[2], format="%Y/%m/%d")))
    #     })
    #     
    #     colors <- brewer.pal(6, "Dark2")
    #     names(colors) <- levels(factor(camas_dia_long$informacion))
    #     custom_colors <- scale_color_manual(name = "Leyenda", values = colors)
    #     
    #     # crear plot
    #     camas_plt <- ggplot(
    #         filtered_data(), 
    #         aes(
    #             x=fecha, 
    #             y=cantidad, 
    #             color = informacion)
    #     ) + 
    #         geom_line() +
    #         labs(
    #             x="", 
    #             y="Camas", 
    #             title="Ocupación de camas por día", 
    #             color = 'Leyenda') +
    #         theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
    #         scale_x_date(breaks = date_breaks("months"), date_labels = "%b %Y") +
    #         theme(axis.text.x = element_text(angle = 45)) +
    #         custom_colors +
    #         scale_y_continuous(labels = unit_format(unit = "K", scale = 1e-3))
    #     camas_plt
    # })

})
