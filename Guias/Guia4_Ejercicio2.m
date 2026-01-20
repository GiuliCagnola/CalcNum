#Guia 4 - Ejercicio 2
#--------------------
##La ecuación x^3 + 4x^2 −10 = 0 tiene una raíz única en [1, 2].
##Dadas las siguientes funciones g1 y g2, proporcione los resultados del método de iteración de punto fijo  para ambas funciones,
##considerando p0 = 1.5, tol = 1e−3 y como criterio de convergencia |pn − pn−1| < tol.
##Analice los resultados según el teorema correspondiente.

##x = g1(x) = 1/2*sqrt(10 − x^3)
##x = g2(x) = sqrt(10/(4+x))
#--------------------

g1=@(x) 1/2*sqrt(10 - x.^3)
g2=@(x) sqrt(10/(4+x))


[p1,it1,r1,t1] = PuntoFijo (g1,1.5,1e-3,1000);
[p2,it2,r2,t2] = PuntoFijo (g2,1.5,1e-3,1000);

disp('Resultado de punto fijo para g1')
disp(p1)
disp('Resultado de punto fijo para g2')
disp(p2)

#RTA: si g1(x) y g2(x) son funciones continuas en el intervalo [1, 2] y cumplen |g1'(x)| < 1 y |g2'(x)| < 1 para x en [1, 2],
#entonces el método de iteración de punto fijo converge a una solución única en el intervalo.
#En este caso, los resultados obtenidos cumplen con las condiciones requeridas, y por lo tanto,
#las aproximaciones encontradas son soluciones válidas


