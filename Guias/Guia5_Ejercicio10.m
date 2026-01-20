#Guía 5 - Ejercicio 10
 x=[-1 0 1 2]
 y=[-1.1 -0.4 -0.9 -2.7]
 ly=log(-y)
  [coef, A, b] = MinimosCuadrados(x, ly, 2)

  --> coef = [](0x1)
A =
    4    2    6
    2    6    8
    6    8   18

b =
   0.066911
   1.785833
   3.962957

   r2=@(x) -exp(coef(1).*x.^2 + coef(2).*x + coef(3))

#------------------
#ejercicio hecho por el profe

%EjParcial parecido al 10 del TP5
#Ej10TP5
clear all
clc
x = [-1:2]'
y = [-1.1 -0.4 -0.9 -2.7]'

c = polyfit(x,log(-y),2) # polinomio de ajuste de orden cuadratico.
# y = -exp(ax^2+bx+c); lo poemos de esta manera para generar un
# polinomio con el exponente: log(-y) = ax^2 + bx+c;

f = @(x) -exp(polyval(c,x));

# lo vemos graficamente:
xx = linspace(-1.5,2.5,201);
plot(x,y,'o',xx,f(xx))
grid on

# Medimos el error

errf = norm(y - f(x)) # error cuadratico usando la funcion norm
ErrRelat = (f(0) + 0.4)/(-0.4)
# error realtivo en el punto 0
