#Guía 4 - Ejercicio 5
#--------------------
##La ecuación de estado de un gas (la cual relaciona la presión p, el volumen V y la temperatura T) está dada por
##[p + a(N/V)^2](V − Nb) = kNT
##donde a y b son dos coeficientes que dependen del gas en particular que hayamos considerado, N
##es el n´umero de moléculas que se encuentran en el volumen V y k es la constante de Boltzmann.
##Asumiendo que el gas es dióxido de carbono (CO2), los coeficientes a y b toman los siguientes valores:
##a = 0.401 Pa · m6 y b = 42.7e−6 m3
##Encuentre el volumen que ocupan 1000 moléculas de dicho gas a una temperatura T = 300 K y presión p = 3.5e + 7 Pa
##mediante el método de bisección y el método de Newton, con una tolerancia de 1e − 12
##(la constante de Boltzmann vale k = 1.3806503e − 23 J/K)
#--------------------
a=0.401;
b=42.7e-6;
T=300;
p=3.5e+7;
k = 1.3806503e-23;
N=1000;

f=@(V) (p + a.*(N./V).^2).*(V - N.*b) - k.*N.*T
V=linspace(-0.3,0.3,100);
plot(V,f(V))
hold on
plot([min(V), max(V)], [0, 0], 'k--')
[p,it,r,t] = Biseccion_Lucas(f, 0.03, 0.05, 10000, 1e-12);
disp('raiz utilizando biseccion');
disp(p);

df=@(V)  -2.*a.*N.^2./V.^3.*(V - N.*b) + (p + a.*(N./V).^2) - a.*N.^2./V.^2;
[x,rh,it,t] = NewtonRaphson(f,df,0.1, 10000,1e-12);
disp('raiz utilizando newton raphson');
disp(x);


