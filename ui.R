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
          dateRangeInput("rango_fechas", 
                         label = h4("Rango de fecha"),
                         start = '2020-03-13',
                         min = '2020-03-13',
                         language = 'es'
                         ),
          hr(),
          tags$div(
            HTML("<p>Fuente: <a href='https://github.com/andrab/ecuacovid'>ecuacovid</a></p>")
          )
          # fluidRow(column(4, verbatimTextOutput("rango_fechas")))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tabsetPanel(
            tabPanel("Hospitalizaciones", plotOutput("hospiPlot")), 
            tabPanel("Muertes", plotOutput("muertPlot")), 
            tabPanel("Positivos", plotOutput("positPlot")),
            tabPanel("Vacunas arribadas",  plotOutput("vacunPlot"))
          )
        )
          
            
        ),
      
    )
)
