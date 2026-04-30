#Subconjuntos    -    Subsetting

x <-  c("a","b","c","d","e")
x

x[c(1,5)]
x[1]


juegos
juegos[1:3,6:10]
juegos[,c("2008","2009")]


is.matrix(juegos)
is.matrix(juegos[1,])
juegos[1,1]




#Resolviendo esto
is.matrix(juegos[1,,drop=F])
juegos[1,1,drop=F]