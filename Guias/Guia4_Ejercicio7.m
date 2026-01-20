#Guia 4 - Ejercicio 7
#--------------------

 E = @(t) ((t+1/3).^3+1/3).*e.^(-t)
 Ea = @(t) ((t+1/3).^3+1/3).*e.^(-t)-1.5  #E(t)=1.5 -> E(t)-1.5=0
 dE = @(t) (e.^(-t).*(3.*(t+1/3).^2-(t+1/3).^3-1/3))
 d3E = @(t) e.^(-t).*(6-1/3-18.*(t+1/3)+9.*(t+1/3).^2-(t+1/3).^3);
 #Grafica de E(t) y su primera derivada E'(t)
t=linspace(0,10,100);
plot(t,E(t))
hold on
plot(t,Ea(t),'m')
plot(t,dE(t),'r')
y=@(t) t.*0
grid minor
plot(t,y(t),'y')

#veo que las raíces aproximan a 2 y a 4
p0=1;
disp('El instante de tiempo donde se da la máxima tasa de crecimiento instantánea es:');
[pC, r_hC, itC, tC] = newtonRaphson(d2E, d3E, p0, maxit, tol);
pC
disp('El número de iteraciones realizadas para determinarlo:');
itC
