#Guía 4 - Ejercicio 1
#--------------------
f=@(x) 3*(x+1).*(x-0.5).*(x-1)

#f(x) = (3x^2-3)*(x-0.5)
#f(x) = 3x^3 - 3/2*x^2 -3x + 3/2


x=linspace(-2, 1.5, 100);
plot(x, f(x))
hold on
plot([min(x), max(x)], [0, 0], 'k--') #graficamente vemos que hay 3 raíces

[p,it,r,t] = Biseccion_Lucas(f, -2, 1.5, 4, 1e-3)

#verifico con la función roots() de octave
p=[3 3/2 -3 3/2]
r_oct = roots(p)

#--------------------
##Obtenga una cota para el número de iteraciones que se requieren para alcanzar una aproximación con una exactitud de 10−3
##a la solución de x^3 + x − 4 = 0 que se encuentra en el intervalo [1,4].
##Obtenga una aproximación de la raíz con esta exactitud mediante el m´etodo de la bisección.
#--------------------
#n >= log2((b - a) / tol)
#-> n es el número de iteraciones
#-> a y b son los extremos del intervalo
#->tol es la tolerancia permitida asociada a la cantidad de cifras significativas

n=log2((4-1)/10^(-3))
#n=11.5507

f=@(x) x.^3+x-4

[p2,it2,r2,t2] = Biseccion_Lucas(f, 1, 4, 100, 10.^(-3))

#RTA: Con una tolerancia de 10^-3 se obutvo p2=1.3786 en 12 iteraciones
