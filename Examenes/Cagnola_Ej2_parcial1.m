#GIULIANA CAGNOLA

#Pregunta 2

#Encuentre el valor positivo del parámetro a con un error de 10^-6 tal que la función  z(t) = 0.04*sqrt(a+t)*(1-t)-t*sqrt(3*a) posea un punto fijo en t=0.02
#Se sabe que la función z(t) pasa cerca de w(t) = 0.04*sqrt(19+t)*(1-t)-t*sqrt(57)

w=@(t) 0.04*sqrt(19+t).*(1-t)-t*sqrt(57)
#Grafico la función para ver cómo se comporta
t=linspace(-10,10,100);
plot(t,w(t));
#De las funciones z(t) y w(t) vemos que 19+t=a+t y 57=3a, lo que equivale a a=19 (aproximadamente)

# w(0.02)=0.02 -> mi ecuación para el punto fijo

#z(a) = 0.04*sqrt(a+t)*(1-t)-t*sqrt(3*a) #-> mi función
z2 = @(a) 0.04*sqrt(a+0.02).*(1-0.02) - 0.02*sqrt(3*a) - 0.02; #-> a esta función le tengo que hacer bisección
[p,it,r,t] = Biseccion_Lucas(z2, 18, 20, 10000, 10^-6)
disp('Valor de a:');
disp(p);





