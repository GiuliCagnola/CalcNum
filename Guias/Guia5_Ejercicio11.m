#Guía 5 -  Ejercicio 11
#--------------------

% carga de datos
t = [4 8 12 16 20 24]';
y = [1590 1320 1000 900 650 560]';

% modelo de concentración es del tipo c(t) =b*exp(-kt)
% es decir sigue una ley exponencial.

% Incognitas b y k
% llamaremos h la funcion que aproxima los datos segun el modelo

% vamos a usar el metodo de linealizacion de los datos.
% para ello necesitamos calcular el log(y)

lc = [log(y(1)) log(y(2)) log(y(3)) log(y(4)) log(y(5))]';

Tk=t;
Yk=lc;
N = length(Tk);
TYk=[Tk(1)*Yk(1) Tk(1)*Yk(1) Tk(2)*Yk(2) Tk(3)*Yk(3) Tk(4)*Yk(4) Tk(5)*Yk(5)]';

% llamamos: B=log(b);
% formamos los pares (Tk,Yk)

co1=sum(Tk.^2);
co2=sum(Tk);
co3=sum(TYk);
co4=sum(Yk);

M=[-co1 co2; -co2 N]
f=[co3 co4]'

a=M\f;

b=exp(a(2))

h=@(t) b.*exp(-a(1).*t);

tt=linspace(4,25,201);

plot(t,y,'ok',tt,h(tt),'-b')
grid on; grid minor;
