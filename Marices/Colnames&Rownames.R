

#Vectores con nombre

Carlos <- 1:5
Carlos

names(Carlos) <- c("a","b","c","d","e")
Carlos

Carlos["d"]

#Limpiar nombres
names(Carlos) <- NULL
Carlos


#Nombrando dimensiones de matrices 
vector_temporal <- rep(c("a","B","zZ"),each=3)
vector_temporal


Parra <- matrix(vector_temporal, 3, 3)
Parra

rownames(Parra) <- c("Perro", "Flor", "Coco")
Parra

colnames(Parra) <- c("x","y","z")
Parra

Parra[2,3]
Parra["Flor","z"] <- 5
Parra


rownames(Parra)
rownames(Parra) <- NULL
Parra 