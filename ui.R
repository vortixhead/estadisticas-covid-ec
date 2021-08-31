#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Estadísticas sobre COVID-19 en Ecuador"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          dateRangeInput(
            "rango_fechas", 
             label = h4("Rango de fecha"),
             start = '2020-03-13',
             min = '2020-03-13',
             language = 'es',
             separator = 'hasta'
             ),
          hr(),
          conditionalPanel(
            condition = "input.tabs == 'Vacunas aplicadas'",
            checkboxGroupInput(
              "vacun2_filter", 
              label = h4("Filtrar"), 
              choices = list(
                "Total" = "dosis_total", 
                "Primera dosis" = "primera_dosis", 
                "Segunda dosis" = "segunda_dosis"
              ),
              selected = c(
                "dosis_total", 
                "primera_dosis", 
                "segunda_dosis"
              )
            ),
          ),
          conditionalPanel(
            condition = "input.tabs == 'Camas'",
            checkboxGroupInput(
              "camas_filter", 
              label = h4("Filtrar"), 
              choices = list(
                "(MSP) Hospitalizacion Porcentaje Ocupadas" = "(MSP) Hospitalización Porcentaje Ocupadas", 
                "(MSP) Hospitalizacion Lista Espera" = "(MSP) Hospitalización Lista Espera", 
                "(MSP) Hospitalizacion Camas Asignadas" = "(MSP) Hospitalización Camas Asignadas",
                "(MSP) Hospitalizacion Camas Ocupadas" = "(MSP) Hospitalización Camas Ocupadas",
                "(MSP) Cuidados Intermedios Porcentaje Ocupadas" = "(MSP) Cuidados Intermedios Porcentaje Ocupadas",
                "(MSP) Cuidados Intermedios Lista Espera" = "(MSP) Cuidados Intermedios Lista Espera",
                "(MSP) Cuidados Intermedios Camas Asignadas" = "(MSP) Cuidados Intermedios Camas Asignadas",
                "(MSP) Cuidados Intermedios Camas Ocupadas" = "(MSP) Cuidados Intermedios Camas Ocupadas",
                "(MSP) UCI Porcentaje Ocupadas" = "(MSP) UCI Porcentaje Ocupadas",
                "(MSP) UCI Lista Espera" = "(MSP) UCI Lista Espera",
                "(MSP) UCI Camas Asignadas" = "(MSP) UCI Camas Asignadas",
                "(MSP) UCI Camas Ocupadas" = "(MSP) UCI Camas Ocupadas",
                "(RPIS) Hospitalización Porcentaje Ocupadas" = "(RPIS) Hospitalización Porcentaje Ocupadas",
                "(RPIS) Hospitalizacion Lista Espera" = "(RPIS) Hospitalización Lista Espera",
                "(RPIS) Hospitalizacion Camas Asignadas" = "(RPIS) Hospitalización Camas Asignadas",
                "(RPIS) Hospitalizacion Camas Ocupadas" = "(RPIS) Hospitalización Camas Ocupadas",
                "(RPIS) Cuidados Intermedios Porcentaje Ocupadas" = "(RPIS) Cuidados Intermedios Porcentaje Ocupadas",
                "(RPIS) Cuidados Intermedios Lista Espera" = "(RPIS) Cuidados Intermedios Lista Espera",
                "(RPIS) Cuidados Intermedios Camas Asignadas" = "(RPIS) Cuidados Intermedios Camas Asignadas",
                "(RPIS) Cuidados Intermedios Camas Ocupadas" = "(RPIS) Cuidados Intermedios Camas Ocupadas",
                "(RPIS) UCI Porcentaje Ocupadas" = "(RPIS) UCI Porcentaje Ocupadas",
                "(RPIS) UCI Lista Espera" = "(RPIS) UCI Lista Espera",
                "(RPIS) UCI Camas Asignadas" = "(RPIS) UCI Camas Asignadas",
                "(RPIS) UCI Camas Ocupadas" = "(RPIS) UCI Camas Ocupadas",
                "(RPC) Hospitalizacion Porcentaje Ocupadas" = "(RPC) Hospitalización Porcentaje Ocupadas",
                "(RPC) Hospitalizacion Lista Espera" = "(RPC) Hospitalización Lista Espera",
                "(RPC) Hospitalizacion Camas Asignadas" = "(RPC) Hospitalización Camas Asignadas",
                "(RPC) Hospitalizacion Camas Ocupadas" = "(RPC) Hospitalización Camas Ocupadas",
                "(RPC) Cuidados Intermedios Porcentaje Ocupadas" = "(RPC) Cuidados Intermedios Porcentaje Ocupadas",
                "(RPC) Cuidados Intermedios Lista Espera" = "(RPC) Cuidados Intermedios Lista Espera",
                "(RPC) Cuidados Intermedios Camas Asignadas" = "(RPC) Cuidados Intermedios Camas Asignadas",
                "(RPC) Cuidados Intermedios Camas Ocupadas" = "(RPC) Cuidados Intermedios Camas Ocupadas",
                "(RPC) UCI Porcentaje Ocupadas" = "(RPC) UCI Porcentaje Ocupadas",
                "(RPC) UCI Lista Espera" = "(RPC) UCI Lista Espera",
                "(RPC) UCI Camas Asignadas" = "(RPC) UCI Camas Asignadas",
                "(RPC) UCI Camas Ocupadas" = "(RPC) UCI Camas Ocupadas"
              ),
              selected = c(
                "(MSP) Hospitalización Porcentaje Ocupadas",
                "(MSP) Hospitalización Lista Espera", 
                "(MSP) Hospitalización Camas Asignadas",
                "(MSP) Hospitalización Camas Ocupadas",
                "(MSP) Cuidados Intermedios Porcentaje Ocupadas",
                "(MSP) Cuidados Intermedios Lista Espera",
                "(MSP) Cuidados Intermedios Camas Asignadas",
                "(MSP) Cuidados Intermedios Camas Ocupadas",
                "(MSP) UCI Porcentaje Ocupadas",
                "(MSP) UCI Lista Espera",
                "(MSP) UCI Camas Asignadas",
                "(MSP) UCI Camas Ocupadas"
                # "(RPIS) Hospitalización Porcentaje Ocupadas",
                # "(RPIS) Hospitalización Lista Espera",
                # "(RPIS) Hospitalización Camas Asignadas",
                # "(RPIS) Hospitalización Camas Ocupadas",
                # "(RPIS) Cuidados Intermedios Porcentaje Ocupadas",
                # "(RPIS) Cuidados Intermedios Lista Espera",
                # "(RPIS) Cuidados Intermedios Camas Asignadas",
                # "(RPIS) Cuidados Intermedios Camas Ocupadas",
                # "(RPIS) UCI Porcentaje Ocupadas",
                # "(RPIS) UCI Lista Espera",
                # "(RPIS) UCI Camas Asignadas",
                # "(RPIS) UCI Camas Ocupadas",
                # "(RPC) Hospitalización Porcentaje Ocupadas",
                # "(RPC) Hospitalización Lista Espera",
                # "(RPC) Hospitalización Camas Asignadas",
                # "(RPC) Hospitalización Camas Ocupadas",
                # "(RPC) Cuidados Intermedios Porcentaje Ocupadas",
                # "(RPC) Cuidados Intermedios Lista Espera",
                # "(RPC) Cuidados Intermedios Camas Asignadas",
                # "(RPC) Cuidados Intermedios Camas Ocupadas",
                # "(RPC) UCI Porcentaje Ocupadas",
                # "(RPC) UCI Lista Espera",
                # "(RPC) UCI Camas Asignadas",
                # "(RPC) UCI Camas Ocupadas"
              )
            ),
          ),
          conditionalPanel(
            condition = "input.tabs == 'Hospitalizaciones'",
            checkboxGroupInput(
              "hosp_filter", 
               label = h4("Filtrar"), 
               choices = list(
                 "Altas hopitalarias" = "Altas Hospitalitaria", 
                 "Hospitalizados estables" = "Hospitalizadas Estables", 
                 "Pronostico reservado" = "Hospitalizadas Pronóstico Reservadas"),
               selected = c(
                 "Altas Hospitalitaria", 
                 "Hospitalizadas Estables", 
                 "Hospitalizadas Pronóstico Reservadas"
                 )
              ),
          ),
          conditionalPanel(
            condition = "input.tabs == 'Muertes'",
            checkboxGroupInput(
              "muert_filter", 
              label = h4("Filtrar"), 
              choices = list(
                "Total muertes" = "Total Muertes", 
                "Nuevas muertes" = "Nuevas", 
                "Muertes" = "Muertes",
                "Muertes probables" = "Muertes Probables"
              ),
              selected = c(
                # "Total Muertes", 
                "Nuevas"
                # "Muertes",
                # "Muertes Probables"
              )
            ),
          ),
          conditionalPanel(
            condition = "input.tabs == 'Pruebas positivas'",
            checkboxGroupInput(
              "posit_filter", 
              label = h4("Filtrar"), 
              choices = list(
                "Nuevas positivas" = "Nuevas", 
                "PCR" = "PCR", 
                "Pruebas rapidas" = "Rápidas",
                "Total positivas" = "Total Positivas"
              ),
              selected = c(
                "Nuevas"
                # "PCR", 
                # "Rápidas",
                # "Total Positivas"
              )
            ),
          ),
          conditionalPanel(
            condition = "input.tabs == 'Vacunas arribadas'",
            checkboxGroupInput(
              "vacun_filter", 
              label = h4("Filtrar"), 
              choices = list(
                "Oxford/AstraZeneca" = "Oxford/AstraZeneca", 
                "Pfizer/BioNTech" = "Pfizer/BioNTech", 
                "Sinovac" = "Sinovac"
              ),
              selected = c(
                "Oxford/AstraZeneca", 
                "Pfizer/BioNTech", 
                "Sinovac"
              )
            ),
          ),
          hr(),
          tags$div(
            HTML('<script async defer src="https://buttons.github.io/buttons.js"></script>'),
            HTML("<p>📄 Fuente: <a href='https://github.com/andrab/ecuacovid' target='_blank'>ecuacovid</a></p>"),
            hr(),
            HTML('<a class="github-button" href="https://github.com/vortixhead/estadisticas-covid-ec" data-color-scheme="no-preference: light; light: light; dark: light;" aria-label="Star vortixhead/estadisticas-covid-ec on GitHub">GitHub</a><a class="github-button" href="https://github.com/vortixhead/estadisticas-covid-ec/issues" data-color-scheme="no-preference: light; light: light; dark: light;" data-icon="octicon-issue-opened" aria-label="Issue vortixhead/estadisticas-covid-ec on GitHub">Reportar error</a>'),
            HTML('<br><small>Boris Proaño - 2021</small> <a href="mailto:vortixhead@pm.io" target="_blank">✉️</a>'),
          ),
          # fluidRow(column(4, verbatimTextOutput("rango_fechas")))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tabsetPanel(
            id = "tabs",
            tabPanel("Vacunas aplicadas", br(), plotlyOutput("vacun2Plot")),
            # tabPanel("Vacunas arribadas", br(), plotlyOutput("vacunPlot")),
            tabPanel("Pruebas positivas", br(), plotlyOutput("positPlot")),
            # tabPanel("Camas", br(), plotlyOutput("camasPlot")), 
            tabPanel("Hospitalizaciones", br(), plotlyOutput("hospiPlot")), 
            tabPanel("Muertes", br(), plotlyOutput("muertPlot")) 
          )
        )
          
            
        ),
      
    )
)
