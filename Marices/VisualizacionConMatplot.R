#Matplot
?matplot

matplot()

tiros_anotados

t(tiros_anotados)

matplot(t(tiros_anotados/juegos), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=jugadores, col=c(1:4,6), pch=15:18, horiz=F)


matplot(t(tiros_anotados/tiros_intentados), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=jugadores, col=c(1:4,6), pch=15:18, horiz=F)
