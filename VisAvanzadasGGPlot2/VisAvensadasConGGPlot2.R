getwd()
setwd("/Users/macbook/Documents/CursoProgramacionR/VisAvanzadasGGPlot2")

peliculas <- read.csv("Ratings_Peliculas.csv", fileEncoding = "latin1")
head(peliculas)

colnames(peliculas) <- c("Peliculas","Género","RaitingCriticos","RaitingAudiencia","PresupuestoMillones","Año")
tail(peliculas)


str(peliculas)
summary(peliculas)


factor(peliculas$Año)


peliculas$Año <- factor(peliculas$Año)
summary(peliculas)
str(peliculas)


# ----------- Estéticas
library(ggplot2)
ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia))

# Generando Geometrías
ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia)) +
  geom_point()

#Agregando color
ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                           color=Género)) +
  geom_point()


#Agregando tamaño  
ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                           color=Género, size=PresupuestoMillones)) +
  geom_point()


#Primer Gráfico


# ---------- Fragicnado con capas

p <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                                color=Género, size=PresupuestoMillones))


# Puntos 
p + geom_point()



#líneas
p + geom_line()


#Multiples capas
p + geom_line() + geom_point() 

# --------- Sobre-escribiendo Estéticas

q <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                                color=Género, size=PresupuestoMillones))
head(peliculas)


#Agregando Geom_Point
q + geom_point()


#Sobre/escibir las estéticas
#Ej. 1
q + geom_point(aes(size=RaitingCriticos))

#Ej. 2
q + geom_point(aes(color=PresupuestoMillones))

#Ej. 3
q + geom_point(aes(x=PresupuestoMillones))


q + geom_point(aes(x=PresupuestoMillones)) + 
  xlab("Presupuesto Millones")

#Ej. 4
q + geom_line() + geom_point()


#Reducir el tamaño de las líneas
q + geom_line(size=1) + geom_point()


#------- Mapear vs Establecer

r <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia))

r + geom_point()


#Agregando color
#1.Mapeando (lo que ya hemos hecho)
r + geom_point(aes(color=Género))

r + geom_point(aes(size=PresupuestoMillones))

#2.Estableciendo
r + geom_point(color="DarkGreen")

r + geom_point(size=10)

#Error
r + geom_point(aes(color="DarkGreen")

r + geom_point(aes(size=10))


# ------------------ Histogramas y Gráficos de Densidad

s <- ggplot(data=peliculas, aes(x=PresupuestoMillones))

s + geom_histogram(binwidth = 10, aes(fill=Género))


#Agregando borde

s + geom_histogram(binwidth = 10, aes(fill=Género), color="Black")

#Tercer Gráfico

# Gráfico de Densidad
s + geom_density(aes(fill=Género), position="stack")



# ------------- Tips para capa inicial

t <- ggplot(data=peliculas, aes(x=RaitingAudiencia))
t + geom_histogram(binwidth = 10, fill="white", color="Blue")


#Otra manera
head(peliculas)
t2 <- ggplot(data = peliculas)
t2 + geom_histogram( aes(x=RaitingAudiencia),
  binwidth = 10, fill="white", color="Blue")

#Cuarto Gráfico
t2 + geom_histogram( aes(x=RaitingCriticos),
                     binwidth = 10, fill="white", color="Blue")


#Quinto gráfico



#Skeleton plot
t3 <- ggplot()
t3



# --------- Transformaciones Estadísticas
?geom_smooth

u <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                                color=Género))

u

u + geom_point() + geom_smooth(fill=NA)


u2 <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                                 color=Género))

u2 + geom_boxplot(size=1.2) + geom_point()

#tip
u2 + geom_boxplot(size=1.2) + geom_jitter()

u2 + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)


# -------- Usando Facetas

v <- ggplot(data=peliculas, aes(x=PresupuestoMillones))
v + geom_histogram(binwidth = 10, aes(fill=Género),
                   color="Black")


# ------- Facetas

v + geom_histogram(binwidth = 10, aes(fill=Género),
                   color="Black") +
  facet_grid(Género~.)



v + geom_histogram(binwidth = 10, aes(fill=Género),
                   color="Black") +
  facet_grid(Género~., scales = "free")



#Diagramas de Dispersión
w <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                                color=Género))

w + geom_point(size=3)
#Facetas
w + geom_point(size=3) + 
  facet_grid(.~Año)



w + geom_point(aes(size=PresupuestoMillones)) + 
  geom_smooth() +
  facet_grid(Género~Año)


#Primer Gráfico

# -------- Coordenadas 

m <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                                     color=Género))

m + geom_point() +
  xlim(50,100) +
  ylim(50,100)


#no simepre va a funcionar bien 
n <- ggplot(data=peliculas, aes(x=PresupuestoMillones))
n + geom_histogram(binwidth = 10, aes(fill=Género), color="Black")


n + geom_histogram(binwidth = 10, aes(fill=Género), color="Black") +
  ylim(0,50)


n + geom_histogram(binwidth = 10, aes(fill=Género), 
                   color="Black") +
  coord_cartesian(ylim = c(0,50))



f <- ggplot(data=peliculas, aes(x=RaitingCriticos, y=RaitingAudiencia,
                                color=Género))

f + geom_point(aes(size=PresupuestoMillones)) + 
  geom_smooth() +
  facet_grid(Género~Año) +
coord_cartesian(ylim = c(0,100))


# ---------- Temas

g <- s <- ggplot(data=peliculas, aes(x=PresupuestoMillones))

h <- geom_histogram(binwidth = 10, aes(fill=Género),
                   color="Black")
h
#Etiqueta de los ejes

h +
  xlab("Presupuesto") +
  ylab("Número de películas")

#Formato de las etiquetas
h +
  xlab("Presupuesto") +
  ylab("Número de películas") +
  theme(
    axis.title.x = element_text(color="Darkgreen", size=20)
    axis.title.x = element_text(color="Red", size=20)
  )

#Formato de las marcas
h +
  xlab("Presupuesto") +
  ylab("Número de películas") +
  theme(
    axis.title.x = element_text(color="Darkgreen", size=20)
    axis.title.x = element_text(color="Red", size=20)
    
    
    axis.text.x = element_text(size=15),
    axis.text.y = element_text(size=15)
  )

?theme


#Formato de la Leyenda
h +
  xlab("Presupuesto") +
  ylab("Número de películas") +
  theme(
    axis.title.x = element_text(color="Darkgreen", size=20)
    axis.title.x = element_text(color="Red", size=20)
    
    
    axis.text.x = element_text(size=15),
    axis.text.y = element_text(size=15)
    
    legend.title = element_text(size=20),
    legend.text = element_text(size=15),
    legend.position = c(0.98,0.98),
    legend.justificacion = c(1,1)
  )


# Titulo del diagrama 
h +
  xlab("Presupuesto") +
  ylab("Número de películas") +
  ggtitle("Distribución del Presupuesto en Películas")+
  theme(
    axis.title.x = element_text(color="Darkgreen", size=20)
    axis.title.x = element_text(color="Red", size=20)
    
    
    axis.text.x = element_text(size=15),
    axis.text.y = element_text(size=15)
    
    legend.title = element_text(size=20),
    legend.text = element_text(size=15),
    legend.position = c(0.98,0.98),
    legend.justificacion = c(1,1),
    
    plot.title = element_text(color="DarkBlue", size=25,
    hjust=0.5)
    )
