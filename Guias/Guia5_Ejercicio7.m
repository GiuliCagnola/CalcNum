#GUIA 5 - Ejercicio 7
#-------------------
##Encuentre el trazador cúbico sujeto S(x) definido en el intervalo [1, 3] tal que
##S(x) = {S0(x) = a0 + b0(x − 1) + c0(x − 1)^2 + d0(x − 1)^3, si 1 ≤ x < 2
##       {S1(x) = a1 + b1(x − 2) + c1(x − 2)^2 + d1(x − 2)^3, si 2 ≤ x ≤ 3
##       {f(1) = 0
##       {f(2) = 4
##       {f(3) = 22/3
##       {f'(1) = 3
##       {f'(3) = 3
#-------------------

x=[1, 2, 3] #valores que toma x
y=[0, 4, 22/3] #valores que toma y=f(x)

[a, b, c, d] = SplineCubicoSujeto(x, y, 3, 3)
