x <- rnorm(5)

#Ciclo en R
for (i in x){
  print(i)
}


print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

#Ciclo con método convencional
for (j in 1:5){
  print(x[j])
}


N <- 100000000
a <- rnorm(N)
b <- rnorm(N)


#Método con vectores 
c <- a * b


#Método convencional
d <- rep(NA, N)


for(i in 1:N){
  d[i] <- a[i] * b[i]
}