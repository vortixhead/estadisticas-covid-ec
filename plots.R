library(zoo)
library(ggplot2)
library(reshape2)


# Plot hospitalizaciones diarias

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
              theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
              scale_x_date(date_labels = "%b %Y")

# formatear fechas en plot
# hospi_plt + scale_x_date(date_breaks = "1 month")

# =====================================================================================================================
# Plot muertes diarias

# cargar bd
muert_dia <- read.csv(
  'https://github.com/andrab/ecuacovid/raw/master/datos_crudos/ecuacovid-muertes_por_dia.csv', 
  header = TRUE, 
  encoding = "UTF-8")

# reestructurar
# converter de wide a long
muert_dia_long <- melt(muert_dia, value.name = 'cantidad') 
# renombrar columna
names(muert_dia_long)[names(muert_dia_long) == "variable"] <- "fecha" 
# convertir columna a fecha
muert_dia_long$fecha <- as.Date(muert_dia_long$fecha, format= 'X%d.%m.%Y') 


# crear plot
muert_plt <- ggplot(muert_dia_long, 
                    aes(
                      x=fecha, 
                      y=cantidad, 
                      group = informacion, 
                      color = informacion)) + 
  geom_line() +
  labs(
    x="Fecha", 
    y="Muertes", 
    title="Muertes diarias", 
    color = 'Leyenda') +
  theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
  scale_x_date(date_labels = "%b %Y")


# ==============================================================================
# Plot positivas diarias

# cargar bd
posit_dia <- read.csv(
  'https://github.com/andrab/ecuacovid/raw/master/datos_crudos/ecuacovid-positivas_por_dia.csv', 
  header = TRUE, 
  encoding = "UTF-8")

# reestructurar
# converter de wide a long
posit_dia_long <- melt(posit_dia, value.name = 'cantidad') 
# renombrar columna
names(posit_dia_long)[names(posit_dia_long) == "variable"] <- "fecha" 
# convertir columna a fecha
posit_dia_long$fecha <- as.Date(posit_dia_long$fecha, format= 'X%d.%m.%Y') 


# crear plot
posit_plt <- ggplot(posit_dia_long, 
                    aes(
                      x=fecha, 
                      y=cantidad, 
                      group = informacion, 
                      color = informacion)) + 
  geom_line() +
  labs(
    x="Fecha", 
    y="Positivas", 
    title="Pruebas positivas diarias", 
    color = 'Leyenda') +
  theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
  scale_x_date(date_labels = "%b %Y")


# ==============================================================================
# Plot vacunas arribadas diarias

# cargar bd
vacun_dia <- read.csv(
  'https://github.com/andrab/ecuacovid/raw/master/datos_crudos/ecuacovid-vacunas_arribadas_por_dia.csv', 
  header = TRUE, 
  encoding = "UTF-8")

# reestructurar
# converter de wide a long
vacun_dia_long <- melt(vacun_dia, value.name = 'cantidad') 
# renombrar columna
names(vacun_dia_long)[names(vacun_dia_long) == "variable"] <- "fecha" 
# convertir columna a fecha
vacun_dia_long$fecha <- as.Date(vacun_dia_long$fecha, format= 'X%d.%m.%Y') 


# crear plot
vacun_plt <- ggplot(vacun_dia_long, 
                    aes(
                      x=fecha, 
                      y=cantidad, 
                      group = fabricante, 
                      color = fabricante)) + 
  geom_line() +
  labs(
    x="Fecha", 
    y="Vacunas", 
    title="Vacunas arribadas diarias", 
    color = 'Fabricante') +
  theme(plot.title = element_text(hjust=0.5, size=20, face="bold")) +
  scale_x_date(date_labels = "%b %Y")




# full_db <- read.csv('./db/datos_crudos/ecuacovid.csv', header = TRUE, encoding = "UTF-8")

