#GUIA 7 - Ejercicio 7
#-------------------
#La trayectoria de una partícula que se mueve en el plano x1-x2 está dada por la curva (x1(t), x2(t)),
#donde las funciones x1(t) y x2(t) son la solución del sistema de ecuaciones diferenciales
#{x1'(t) = −tx2(t)
#{x2'(t) = tx1(t) − tx2(t)

#1) Resuelva este sistema en el intervalo [0, 20] con el método de Euler utilizando paso h = 0.05 y

#2)grafique la trayectoria de la partícula, sabiendo que en tiempo t = 0 se encontraba en el punto P0=(1, −1).

#3)Utilice el método de Runge-Kutta 4 con paso h=0.1 para determinar la posición de la partícula y su rapidez a los tres segundos

#4)¿Cuántos dígitos correctos tienen los resultados del ítem anterior? Explique cómo lo determinó.

#5)Recuerde que la longitud de la trayectoria de la partícula durante los T primerossegundos está dada por la integral de 0 a T de sqrt(x1'^2 + x2'^2).
#Calcule la distancia recorrida por la partícula durante los primeros tres segundos. Explique como lo hizo.

#-------------------

f=@(t, x) [-t.*x(2); t.*x(1) - t.*x(2)] #Lo armo como un vector
#pongo x(2) y x(1) en vez de x2 y x1 porque los asocio con la columna 2 y con la columna 1 respectivamente

#h=0.5 -> L=40
P0 = [1;-1]; # Punto de partida
[x,w] = EulerAdelante_multipaso(f,0,20,P0,40) #1)

#Graficación 2)
figure(1);
plot(x(1,:), x(2,:), "linewidth", 2);

#h=0.1 -> L=200
[tRK4, yRK4] = RungeKutta4(f, 0, 20, P0, 200) #3)





