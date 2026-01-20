#GUIA 7 - Ejercicio 10
#-------------------
#Péndulo simple
#Si consideramos un péndulo de brazo rígido de longitud L
#donde no hay fricción ni resistencia del aire, el ángulo y(t) que forma el péndulo con la vertical
#satisface la ecuación diferencial de orden dos
#y''(t) + (9.81/L)*sin y(t). Consideraremos L=9.81
#Resolver esta ecuación numéricamente en el intervalo [0, 20]

#-------------------


t=linspace(0,20,400);
#h=0.05
y=[];
y0=[0.01; 0]; #posición y velocidad

f=@(t,y) [y(2); -sin(y(1))]
[t,U] = RungeKutta4_Sistema(f, 0, 20, y0, 400);

#graficar para ver cómo se comporta

