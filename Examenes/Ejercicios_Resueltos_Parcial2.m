#Ejercicio tipo parcial 2
#-------------------
#Considere la función f(x) = ln(x^2+1) - e^(x/2)*cos(pi*x)
#a) Cuál es el error cometido en el punto x=4.2 por el spline cúbico sujeto que interpola
#a f en 9 puntos equiespaciados en [-5, 6] (incluidos los extremos)?

##Respuestas: a) 13.385
##b) x = 4.088961382
##máximo= 9.8085


#b) Encuentre con un error absoluto menor a 10^-9 el valor de x para el cual el spline anterior
#alcanza su valor máximo. Decir cuál es ese valor con 5 dígitos correctos
#--------------------
x=linspace(-5,6,9);
f=@(x) log(x.^2+1)-(exp(x./2)).*cos(pi.*x)
df=@(x) (2.*x)/(x.^2+1) - (x./2).*exp(x./2).*cos(pi.*x) + (exp(x./2)).*sin(pi.*x)

y=f(x)

[S, dS]=funcion_spline(x, y, df(-5), df(6))

val_scs = S(4.2)
val_fx = f(4.2)
error = val_scs-val_fx

#item b)
#para buscar el valor mázximo de la función se deben hallar los 0 de la derivada
#en donde gráficamente se ve un máximo


xx=linspace(-5,6,500);
plot(xx,dS(xx));
hold on
plot(xx,S(xx))
[p,it,r,t] = Biseccion_Lucas(dS, 4, 6, 10000, 10^-9)

#--------------------


