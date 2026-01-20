#Guia 4  Ejercicio 3
#--------------------
##Calcular todas las races positivas de funcion f(x) = sen(x)+ cos(1+x^2)−1 que son menores que 5, con 10 digitos correctos.
##Para ello utilice los metodos de biseccion, Newton y secante.
##¿Cuantas iteraciones fueron necesarias en cada caso? ¿Que método le parece mas conveniente y por qué?
##Piense en algunas ventajas y desventajas de los mismos.
#--------------------

f=@(x) sin(x)+ cos(1+x.^2)-1;
x=linspace(0,6,500);
plot(x,f(x))
hold on
plot([min(x), max(x)], [0, 0], 'k--')
#Gráficamente vemos que hay 2 raíces en el intervalo [0, 5]

#BISECCIÓN
[p1,it1,r1,t1] = Biseccion_Lucas(f, 1.85, 2, 10000, 1e-10);
[p2,it2,r2,t2] = Biseccion_Lucas(f, 2.45, 2.6, 10000, 1e-10);
disp('Resolucion por metodo de biseccion');
disp('raiz 1:');
disp(p1);
disp('raiz 2:');
disp(p2);
disp('cantidad de iteraciones necesarias:');
disp(it1);
disp(it2);

#NEWTON
df=@(x) cos(x) -sin(1+x.^2).*2.*x;
[x1,rh1,it1,t1] = NewtonRaphson(f,df,1.9, 10000,1e-10);
[x2,rh2,it2,t2] = NewtonRaphson(f,df,2.53, 10000,1e-10);
disp('Resolucion por metodo de newton raphson');
disp('raiz 1:');
disp(x1);
disp('raiz 2:');
disp(x2);
disp('cantidad de iteraciones necesarias:');
disp(it1);
disp(it2);

#SECANTE
[x1, rh1, it1, t1] = Secante(f, 1.85, 2, 10000, 1e-10);
[x1, rh1, it1, t1] = Secante(f, 2.45, 2.6, 10000, 1e-10);
disp('Resolucion por metodo de secante');
disp('raiz 1:');
disp(x1);
disp('raiz 2:');
disp(x2);
disp('cantidad de iteraciones necesarias:');
disp(it1);
disp(it2);
