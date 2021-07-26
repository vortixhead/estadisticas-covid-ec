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
                "Hospitalización Asignadas" = "Hospitalización Asignadas", 
                "Hospitalización Ocupadas" = "Hospitalización Ocupadas", 
                "Cuidados Intermedios Asignadas" = "Cuidados Intermedios Asignadas",
                "Cuidados Intermedios Ocupadas" = "Cuidados Intermedios Ocupadas",
                "UCI Asignadas" = "UCI Asignadas",
                "UCI Ocupadas" = "UCI Ocupadas"
              ),
              selected = c(
                "Hospitalización Asignadas",
                "Hospitalización Ocupadas", 
                "Cuidados Intermedios Asignadas",
                "Cuidados Intermedios Ocupadas",
                "UCI Asignadas",
                "UCI Ocupadas"
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
                 "Pronóstico reservado" = "Hospitalizadas Pronóstico Reservadas"),
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
                "Pruebas rápidas" = "Rápidas",
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
            tabPanel("Vacunas arribadas", br(), plotlyOutput("vacunPlot")),
            tabPanel("Pruebas positivas", br(), plotlyOutput("positPlot")),
            tabPanel("Camas", br(), plotlyOutput("camasPlot")), 
            tabPanel("Hospitalizaciones", br(), plotlyOutput("hospiPlot")), 
            tabPanel("Muertes", br(), plotlyOutput("muertPlot")) 
          )
        )
          
            
        ),
      
    )
)
