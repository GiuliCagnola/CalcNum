#GUIA 7 - Ejercicio 2
#-------------------
#Considere el PVI
#{y'(t) = −y(t) + sen(t) + cos(t)
#{y(0) = 0
#Se desea conocer el valor de la variable y al tiempo t = 2.
#Complete la  tabla con la aproximación de y(2) obtenida utilizando los métodos de
#Euler, RK2 y RK4 con los pasos indicados:
#-------------------

f = @(t,y) -y + sin(t) + cos(t);
#Solucion analitica: y(t)=sin(t)
#Tomando a=0, b=5


#h=1/10 -> L=50
[tE, yE] = Euler(f, 0, 5, 0, 50);
yE_2 = yE(2) # yE_2 = 0.1000
[tRK2,yRK2] = RungeKutta2(f, 0, 5, 0, 50);
yRK2_2 = yRK2(2) #yRK2_2 = 0.099742
[tRK4,yRK4] = RungeKutta4(f, 0, 5, 0, 50);
yRK4_2 = yRK4(2) #yRK4_2 = 0.099833

#h=1/20 -> L=100
[tE,yE] = Euler(f,0,5,0,100);
yE_2 = yE(2) # yE_2 = 0.050000
[tRK2,yRK2] = RungeKutta2(f, 0, 5, 0, 100);
yRK2_2 = yRK2(2) #yRK2_2 = 0.049968
[tRK4,yRK4] = RungeKutta4(f, 0, 5, 0, 100);
yRK4_2 = yRK4(2) #yRK4_2 =  0.049979


#Graficación:
y=@(t) sin(t) #Solución exacta del PVI
t=linspace(0,5,100);
y=y(t)
plot(t,y)
hold on
yE1=yE(t)
plot(t,yE1)

#funcion ode45 para calcular automaticamente ecuaciones diferenciales



