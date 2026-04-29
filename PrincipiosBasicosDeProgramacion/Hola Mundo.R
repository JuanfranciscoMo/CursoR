#Hola Mundo
"Hola Mundo"
#------------
#Primer ejercicio

mis_datos <- read.csv(file.choose())

install.packages("ggplot2")

ggplot(data=mis_datos[mis_datos$quilates<2.5,], 

       aes(x=quilates, y=precio, color = claridad)) +
  geom_point(alpha=0.1) +
  geom_smooth

#----------
#Tipos de datos
#integer
x <- 2L
typeof(x)

#double
y <- 2.4
typeof(y)

#complex
z <- 3 + 2i
typeof(z)


#character
a <- "h"
typeof(a)


#logical
q1 <- T
typeof(q1)

q2 <- F
typeof(q2)
