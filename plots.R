library(zoo)
library(ggplot2)
library(reshape2)


# getwd()

# cargar bd
hosp_dia <- read.csv(
            'https://github.com/andrab/ecuacovid/raw/master/datos_crudos/ecuacovid-hospitalizadas_por_dia.csv', 
            header = TRUE, 
            encoding = "UTF-8")

# reestructurar
# converter de wide a long
hosp_dia_long <- melt(hosp_dia, value.name = 'cantidad') 
# renombrar columna
names(hosp_dia_long)[names(hosp_dia_long) == "variable"] <- "fecha" 
# convertir columna a fecha
hosp_dia_long$fecha <- as.Date(hosp_dia_long$fecha, format= 'X%d.%m.%Y') 


# crear plot
hospi_plt <- ggplot(hosp_dia_long, 
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
              theme(plot.title = element_text(hjust=0.5, size=20, face="bold"))

# formatear fechas en plot
hospi_plt + scale_x_date(date_labels = "%b %Y")
# hospi_plt + scale_x_date(date_breaks = "1 month")

# =====================================================================================================================

# full_db <- read.csv('./db/datos_crudos/ecuacovid.csv', header = TRUE, encoding = "UTF-8")

