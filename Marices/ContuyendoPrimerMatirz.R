#matrix - matriz
?matrix()

mis_datos <- 1:20
mis_datos

A <- matrix(mis_datos, 4, 5)
A


A[2,3]
A[3,4]


#rbrind()
v1 <- c("a","b","c")
v2 <- c("x","y","z")
v3 <- c(1,2,3)

c <- rbind(v1,v2,v3)
c


#cbind()
D <- cbind(v1,v2,v3)
D
