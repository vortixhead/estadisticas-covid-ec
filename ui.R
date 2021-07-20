#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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
             language = 'es'
             ),
          hr(),
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
                "Total Muertes", 
                "Nuevas", 
                "Muertes",
                "Muertes Probables"
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
                "Nuevas", 
                "PCR", 
                "Rápidas",
                "Total Positivas"
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
            HTML("<p>Fuente: <a href='https://github.com/andrab/ecuacovid'>ecuacovid</a></p>")
          ),
          # verbatimTextOutput("hosp_filter"),
          # fluidRow(column(4, verbatimTextOutput("rango_fechas")))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tabsetPanel(
            id = "tabs",
            tabPanel("Hospitalizaciones", br(), plotOutput("hospiPlot")), 
            tabPanel("Muertes", br(), plotOutput("muertPlot")), 
            tabPanel("Pruebas positivas", br(), plotOutput("positPlot")),
            tabPanel("Vacunas arribadas", br(), plotOutput("vacunPlot"))
          )
        )
          
            
        ),
      
    )
)
