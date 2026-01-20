#Guia 4 - Ejercicio 4
#--------------------
#Use el método de Newton para aproximar con una exactitud de 10^−4 el valor de x que en la gráfica de y = x^2
#produce el punto más cercano a (1, 0). Ayuda: Reduzca al mínimo [d(x)]^2 donde d es la función distancia de la gráfica al punto.
#--------------------

f=@(x) x.^2;
x=linspace(0,2,200);
plot(x, f(x))
hold on

#función distancia: d = sqrt((x2-x1)^2 + (y2-y1)^2)
#tomando y1=x^2, y2=0

d=@(x) sqrt((1-x).^2 + x.^4) #función distancia
[p,it,r,t] = Biseccion_Lucas(d, 0, 2, 5000, 10^-4);

plot(x,d(x))

