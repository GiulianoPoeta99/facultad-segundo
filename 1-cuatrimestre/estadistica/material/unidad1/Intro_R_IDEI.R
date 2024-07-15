###################################################
#                 Primeros pasos en R             #
#                    UNTDF-IDEI                   #
#                   Estadistica I                 #
#      Docentes: Erica Schlaps-Samanta Dodino     #
###################################################


# R base: FUNDAMENTAL

## Que es R? Historia e Introduccion: https://www.youtube.com/watch?v=Ejd0zZEedGI
## Instalacion de R y RStudio: https://www.youtube.com/watch?v=D9Bp11iZssc

#que objetos hay definidos
ls()
#borrar todos los objetos definidos
rm(list=ls())

################ TP1 - Ejercicio 2 #####################

######## Tabla de frecuencia de una vía ########
## Tabla de frecuencias absolutas para los niveles de la variable conformidad con el trabajo

respuestas<-c('De Acuerdo', 'En Desacuerdo', 'De Acuerdo', 'De Acuerdo',
            'En Desacuerdo', 'Indeciso', 'De Acuerdo','En Desacuerdo',
            'De Acuerdo','En Desacuerdo','De Acuerdo', 'En Desacuerdo',
            'En Desacuerdo','En Desacuerdo','Indeciso', 'De Acuerdo',
            'De Acuerdo','Muy de Acuerdo', 'Indeciso','Muy en Desacuerdo',
            'Indeciso','Indeciso','Indeciso','Indeciso','Muy de Acuerdo',
            'Indeciso','Muy de Acuerdo','De Acuerdo','En Desacuerdo',
            'En Desacuerdo')

# crear tabla
FO<-table(respuestas)
FO

## Tabla de frecuencias relativas
# La función prop.table se utiliza para crear tablas de frecuencia relativa 
# a partir de tablas de frecuencia absoluta:

# Frecuencia relativa de una vía

FR<-prop.table(x=FO)
FR

# Frecuencia relativa porcentual
FR100<-prop.table(x=FO)*100
FR100


# Freciencia relativa acumulada

FRc<-cumsum(FR)
FRc

# Freciencia relativa acumulada porcentual

FRc100<-cumsum(FR)*100
FRc100

# unimos todas las frecuencias estimadas en una sola tabla:

tabla.frecuencias<-cbind(FO,FR,FR100,FRc100) #por columnas
tabla.frecuencias

tabla.frecuencias2<-rbind(FO,FR,FR100,FRc100) #por filas
tabla.frecuencias2


#Exportar la tabla

setwd("C:/Users/User/Documents/UNTDF/Estadistica 1erCuatri UNTDF")
write.csv(tabla.frecuencias,"TP1_pregunta2b.csv")


## Graficar ###

#Torta con frecuencias observadas

pie(FO,col = rainbow(length(FO)))

?pie

# Grafico barras

plot(x = FO, main = "Gráfico de Respuestas",
     xlab = "Tiempo", ylab = "Frecuencia de respuestas", 
     col = c("royalblue", "seagreen", "purple", "grey", "yellow")) 
# Para explorar:
# lista de los nombres de colores válidos en R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf



#####################  TP 1 - Ejercicio 4 #######################

# New Project
# Tambien podemos cargar datos desde txt o csv
setwd("C:/Users/User/Documents/UNTDF/Estadistica 1erCuatri UNTDF")
datos <- read.csv("TP1_pregunta4.csv",header=T,sep=",",dec=".")

#veo datos
datos
head(datos)#primera parte
names(datos)#nombres de columnas
str(datos)#estructura, n casos, tipo variables...

datos2 <- read.csv("TP1_pregunta4_2.csv",header=T,sep=",",dec=".")

str(datos2)

#tipo de datos:
class(datos2$Tiempo)
#puedo refedinirlo
datos2$Tiempo <- as.numeric(datos2$Tiempo)

#reviso
class(datos2$Tiempo)
levels(datos2$Tiempo)

#otra informacion
range(datos2$Tiempo)#rango de valores, min-max
mean(datos2$Tiempo)#media aritmetica
median(datos2$Tiempo)#mediana
mad(datos2$Tiempo)#desviación absoluta mediana


# Explorar graficamente como se comporta la variable Tiempo:
# Histograma

hist(datos2$Tiempo)#grafico histograma (toma sturges por default)
hist(datos2$Tiempo, freq = FALSE)# para graficar por densidad
hist(x = datos2$Tiempo, main = "Histograma de Tiempo- Método Sturges", 
     xlab = "Tiempo", ylab = "Frecuencia",
     col = "purple")

# Si queremos definir los cortes nosotrxs, debemos agregar el argumento "breaks"

par(mfrow = c(1, 1))
hist(datos2$Tiempo, freq = FALSE,
     breaks=seq(2,20,23), main="amplitudes dif.", col="pink")

#####################  TP 1 - Ejercicio 3 #######################

# Ahora exploremos como modificar el numero de barras en un histograma usando los datos del Ejercicio 3


esperanza_vida<-c(2066,564,2584,604,1009,737,1429,
                  852,1137,520,1560,701,605,1379,
                  497,2778,1429,582,454,3032)

setwd("C:/Users/User/Documents/UNTDF/Estadistica 1erCuatri UNTDF")
datos3 <- read.csv("TP1_pregunta3.csv",header=T,sep=",",dec=".")

range(datos3$esperanza_vida)#rango de valores, min-max
mean(datos3$esperanza_vida)#media aritmetica
median(datos3$esperanza_vida)#mediana
mad(datos3$esperanza_vida)#desviación absoluta mediana


par(mfrow = c(1, 3))# comando para graficar 3 figuras juntas

hist(x = esperanza_vida, main = "Método Sturges", 
     xlab = "Esperanza de Vida", ylab = "Frecuencia",
     col = "purple")

hist(x = esperanza_vida, main = "Pocas clases", 
     xlab = "Esperanza de Vida", ylab = "Frecuencia", breaks = 3,
     col = "lightblue")

hist(x = esperanza_vida, main = "Muchas clases", 
     xlab = "Esperanza de Vida", ylab = "Frecuencia", breaks = 50,
     col = "darkgreen")



par(mfrow = c(1, 1))

hist(esperanza_vida,xlim = c(0,3500),
     breaks=seq(450,1000,3500), main="amplitudes dif.", col="pink")
hist(esperanza_vida,xlim = c(0,3500),
     breaks=10, main="amplitudes dif.", col="pink")


## Otros graficos ###

# Tallo y hoja

stem(esperanza_vida)
stem(esperanza_vida, scale = 2)# si queremos modificar la cantidad de intervalos, agregamos el argumento "scale"



# Boxlot

boxplot(esperanza_vida)

# Boxplot para una única variable con ggplot2 
# ggplot2 necesita que usemos un data frame, por eso en este caso necesitamos llamar a la tabla datos3

#install.packages("ggplot2")
library(ggplot2)

ggplot(datos3, aes(x =0 , y = esperanza_vida)) + 
  geom_boxplot()


