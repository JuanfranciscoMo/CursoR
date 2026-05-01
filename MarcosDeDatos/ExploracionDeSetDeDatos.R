?read.csv()


#Método #1: Selecciona el archivo manualmente
datos <- read.csv(file.choose())
datos


#Método #2: Establecer el Directorio de trabajo (Working Directory)
getwd()
setwd()


#Windouws
setwd("C:\\Curso Programacion R")


#Mac
setwd("/Users/macbook/Documents/CursoProgramacionR/MarcosDeDatos")


rm(datos)
datos <- read.csv("Curso+R+-+Seccion+5+-+DatosDemograficos.csv")
datos




# ---------- Explorando tus datos
datos

nrow(datos)
ncol(datos)


head(datos)
tail(datos)


head(datos, 10)



str(datos)
summary(datos)




#--------- Usando el simbolo de $
datos
head(datos)
datos[4,3]

datos[4,"Tasa.Natalidad"]


datos$Tasa.Natalidad
datos[,"Tasa.Natalidad"]

datos$Tasa.Natalidad[4]

str(datos)
levels(datos$Grupo.Ingresos) 


#Operaciopnes Básicas con Marco de Datos
datos[3:9,]
datos[c(4,100),]
is.data.frame(datos[1, ])

datos[,1, drop=F]
is.data.frame(datos[,1, drop=F])

head(datos)
datos$Tasa.Natalidad * datos$Penetracion.Internet

datos$mi_columna <- datos$Tasa.Natalidad * datos$Penetracion.Internet

head(datos)


datos$xyz <- 1:5
head(datos, n=12)


datos$xyz <- NULL
head(datos)

datos$mi_columna <- NULL
head(datos)



## --------------- Filtrando marcos de datos

head(datos)
filtro <- datos$Penetracion.Internet < 2
datos[filtro,]


datos[datos$Tasa.Natalidad > 40,]

datos[datos$Tasa.Natalidad > 40 & datos$Penetracion.Internet < 2,]


datos[datos$Grupo.Ingresos == "Ingreso alto",]

levels(datos$Grupo.Ingresos)


datos[datos$Nombre.Pais == "Malta",]


## ----------  Introducción a qplot

?qplot


qplot(data=datos, x=Penetracion.Internet)
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad)
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, 
      color=I("blue"), size=I(3))
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, 
      geom = "boxplot")



## ----- Visualizando la solicitud
qplot(data=datos, x=Penetracion.Internet, y=Tasa.Natalidad)
qplot(data=datos, x=Penetracion.Internet, y=Tasa.Natalidad, size=I(5))
qplot(data=datos, x=Penetracion.Internet, y=Tasa.Natalidad, 
      size=I(5), color=Grupo.Ingresos)


## ---------- Creando Marcos de Datos (Data Frame)

mi_dataframe <- data.frame(Pais_dataset_p2, Codigo_Pais_dataset_p2,
                           Region_dataset_p2)
head(mi_dataframe)
#colnames(mi_dataframe) <- c("Pais","Codigo","Region")
#head(mi_dataframe)
rm(mi_dataframe)

mi_dataframe <- data.frame(Pais=Pais_dataset_p2, Codigo=Codigo_Pais_dataset_p2,
                           Region=Region_dataset_p2)
head(mi_dataframe)

tail(mi_dataframe)
Summary(mi_dataframe)

## -------- Conbinando Marcos de Datos (merge)
head(datos)
head(mi_dataframe)

 dataframe_combinado <- merge(datos, mi_dataframe, by.x="Codigo.Pais", by.y="Codigo")
head(dataframe_combinado)


dataframe_combinado$Pais <- NULL
tail(dataframe_combinado)




## ---------- Visualizando con qplot (Parte 2)
qplot(data=dataframe_combinado, x=Penetracion.Internet, y=Tasa.Natalidad)
qplot(data=dataframe_combinado, x=Penetracion.Internet, y=Tasa.Natalidad, 
      color=Region)

#Tamaño
qplot(data=dataframe_combinado, x=Penetracion.Internet, y=Tasa.Natalidad, 
      color=Region, size=I(5))

#Figura
qplot(data=dataframe_combinado, x=Penetracion.Internet, y=Tasa.Natalidad, 
      color=Region, size=I(5), shape=I(19), alpha=I(0.5))

#Titulo
qplot(data=dataframe_combinado, x=Penetracion.Internet, y=Tasa.Natalidad, 
      color=Region, size=I(5), shape=I(19), alpha=I(0.5),
      main="Tasa de Natalidad vs Penetración de Internet")