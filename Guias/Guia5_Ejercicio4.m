#GUIA 5 - Ejercicio 4
#--------------------
##Utilice el método de diferencias divididas de Newton para resolver el siguiente problema de interpolación de Hermite.
##Buscamos el polinomio que ajusta los siguientes valores:
##p(1) = 2, p'(1) = 3, p(2) = 6, p'(2) = 7, p''(2) = 8
#--------------------
##En lugar de solo conocer los valores de la función en los puntos dados, como en la interpolación polinómica estándar,
##en la interpolación de Hermite se conocen tanto los valores de la función como las derivadas en esos puntos.
##En un problema de interpolación de Hermite, se busca encontrar un polinomio que pase por los puntos dados y coincida con las derivadas especificadas en esos puntos.
##Por lo tanto, además de encontrar los coeficientes del polinomio, también se deben calcular coeficientes adicionales para tener en cuenta las derivadas.
#-------------------
x=[1 1 2 2 2];
y=[2 3 6 7 8];
#En interpolación de Hermite se utilizan duplicaciones de puntos para incluir la información de las derivadas
dv=zeros(5,5);
[c, dv] = DiferenciasDivididasInc(x, y, dv)

#--------------------
#ejercicio resuelto por el profe
x = [0 1 3/2 2]'

y = [3 3 13/4 5/3]'

[c, dv] = DiferenciasDivididas(x,y)

[a] = dd(x,y)
[b] = dd_01(x,y)
figure(1)
plot(x,y,'b*');
grid on, grid minor;

PN=@(x) c(1)+c(2).*(x)+c(3).*(x).*(x-1)+c(4).*(x).*(x-1).*(x-3/2);

xx=linspace(0,2,201);
PN=PN(xx);

hold on
plot(xx,PN,'r-');
