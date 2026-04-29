mi_primer_vector <- c(5,9,48,592)
mi_primer_vector

is.numeric(mi_primer_vector)
is.integer(mi_primer_vector)
is.double(mi_primer_vector)


v2 <- c(5L,9L,48L,592L)
is.numeric(v2)
is.integer(v2)
is.double(v2)


v3 <- c("f","4h2","Hola")
is.character(v3)
is.numeric(v3)


#No se pueden cobinar tipos de datos dentro de un vector 

v4 <- c("f","4h2","Hola",6)


# secuence - secuencia - 1:15 - seq()
seq(1,15,2)
1:15


z1 <- seq(1,15,4)
z1


#replicate - repetir - rep()
d1 <- rep(4,70)
d1


d2 <- rep("n",20)
d2


d3 <- rep(z1,4)
d3