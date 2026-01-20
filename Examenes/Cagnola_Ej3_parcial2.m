#Giuliana Cagnola
#Parcial 2
#Ejercicio 3
#--------------------

f=@(x) 2.5 + x.*cos(2.*x);
df=@(x) cos(2.*x) - x.*sin(2.*x);
F = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);
ft = @(t) t + 1;
Q=CuadraturaGauss_c(F,0,3,20,3);
#Verifico con la función quad de octave
Qoct = quad(F,0,3);
error=abs(Qoct-Q)
