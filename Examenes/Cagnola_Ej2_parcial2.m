#Giuliana Cagnola
#Parcial 2
#Ejercicio 2
#--------------------
# y(x) mide el desplazamiento vertical (hacia abajo)

# Ecuación diferencial M=E*I*k(x)
#k(x) = y''/(1+(y')^2)^(3/2)
#Al aplicar una carga: M(x) = P(L-x)
#Entonces queda
#P(L-x) = E*I*(y''/(1+(y')^2)^(3/2)
#y'' = P(L-x)*(1+(y')^2)^(3/2)/(E*I)

#Sustituciones:
#z1 = y
#z2 = y'
#z1' = z2
#z2' = y'' = P(L-x)*(1+(y')^2)^(3/2)/(E*I) -> ASÍ ESTÁ BIEN



#DATOS:
L=120;
E=2.1*10^6;
I=4250;
P=3000;
z0=[0; 0]; #Condiciones iniciales


f=@(x,z) [z(2); P.*(L-x).*(1+z(2).^2).^(3/2)./(E*I)]
[xRK4, zRK4] = RungeKutta4(f, 0, L, z0, 480);
[valmax, posic]=max(zRK4(:,1)) #todas las filas, columna 1
##valmax = 0.1936
##posic = 121
xRK4(posic)
##ans = 120
plot(xRK4, zRK4(:, 2)) #todas las filas, columna 2
hold on
title('derivada')
grid on
#64,37





#Correcciones
##- Despejar y''
##- Una es el cambio de variable, otra es la ecuación diferencial transformada (siempre se pone así)
##- Donde dice y reemplazo por la primera variable, donde dice y' reemplazo por la segunda variable
##- que sea el primer elemento del vector la función y el segundo la derivada
#- Cualquier pregunta que se refiera a la posición de la viga tengo que ver z(1)
#- Cualquier pregunta que sea sobre la pendiente tengo que hacerla sobre z(2)
# - Para ver el desplazamiento máximo de la viga usar la función [valmax, posicion] = max(z(1)) (idem p desplazam min con min(...)
# y después hago x(posición) para ver cuál es ese valor
#- Graficar la pendiente y ver a partir desde dónde aumenta la pendiente (es 64,...) o usar la función find(...)


#rtas x120 y  / 0,19 / 64,5

#--------------------
#script para un sistema de 2 ecuaciones de 2do orden
z1=x1
z2=x1'
z3=x2
z4=x2'

z1'=x1'=z2
z2'= ecuacion diferencial 1
z3'=x2'=z4
z4'= ecuacion diferencial 2







