library(zoo)
library(ggplot2)
library(reshape2)
library(dplyr)
library(RColorBrewer)
library(scales)

Sys.setlocale(category = "LC_ALL", locale = "es_ES")
# ==============================================================================
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

# ==============================================================================
# Plot vacunación

# cargar bd
vacun2_dia <- read.csv(
  'https://github.com/andrab/ecuacovid/raw/master/datos_crudos/vacunas/vacunas.csv', 
  header = TRUE, 
  encoding = "UTF-8")

# reestructurar
# converter de wide a long
vacun2_dia_long <- melt(vacun2_dia, value.name = 'cantidad') 
# renombrar columna
# names(vacun2_dia_long)[names(vacun2_dia_long) == "variable"] <- "fecha" 
# convertir columna a fecha
vacun2_dia_long$fecha <- as.Date(vacun2_dia_long$fecha, format= '%d/%m/%Y') 

# ==============================================================================
# Plot camas

# cargar bd
camas_dia <- read.csv(
  'https://github.com/andrab/ecuacovid/raw/master/datos_crudos/ecuacovid-camas_por_dia.csv', 
  header = TRUE, 
  encoding = "UTF-8")

# reestructurar
# converter de wide a long
camas_dia_long <- melt(camas_dia, value.name = 'cantidad') 
# renombrar columna
names(camas_dia_long)[names(camas_dia_long) == "variable"] <- "fecha" 
# convertir columna a fecha
camas_dia_long$fecha <- as.Date(camas_dia_long$fecha, format= 'X%d.%m.%Y') 

# ==============================================================================

# full_db <- read.csv('./db/datos_crudos/ecuacovid.csv', header = TRUE, encoding = "UTF-8")

