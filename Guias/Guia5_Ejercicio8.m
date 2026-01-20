#GUIA 5 - Ejercicio 8
#-------------------
##Se quiere determinar la trayectoria plana seguida por un brazo robot industrial (idealizado por un punto material) durante un ciclo de trabajo.
##El brazo robot debe satisfacerlas siguientes restricciones: se debe encontrar en reposo en el punto (0, 0) en el instante inicial.
##Luego de 1s se debe encontrar en el punto (2, 4), 1s después debe alcanzar el punto (6, 6) y detenerse allí(primera etapa).
##En una segunda etapa retoma inmediatamente su movimiento y alcanza,luego de otro segundo más el punto (3, 2) para finalmente retornar al origen luego
##de otro segundo más, donde quedará detenido para repetir el ciclo de trabajo.
##
##Encuentre el trazador cúbico sujeto correspondiente y realice las gáficas:
##a) x vs t (etapas 1 y 2 en la misma gráfica)
##b) y vs t (idem anterior)
##c) en el plano xy la trayectoria completa encontrada.
#-------------------

#Primera etapa:
x1=[0, 2, 6]
y1=[0, 4, 6]
[as, bs, cs, ds] = SplineCubicoSujeto(x1, y1, 0, 0)
[an, bn, cn, dn] = SplineCubicoNatural(x1, y1)

#--------------------
#ejercicio resuelto por el profe
#Ej8_TP05.m
clear all, clc; clf;
%DATOS:
x1 = [0,2,6];
y1 = [0,4,6];
t1 = [0,1,2];
x2 = [6,3,0];
y2 = [6,2,0];
t2 = [2,3,4];
% GRAFICA Tiempo vs X
figure (1)
plot(t1,x1,'bo','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10,...
t2,x2,'bo','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10);
grid on
grid minor
xlabel("Tiempo");
ylabel("Posicion en X");
title('Grafica Tiempo vs X');
hold on;

% GRAFICA T vs Y
figure (2);
plot(t1,y1,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10,...
t2,y2,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10);
grid on
grid minor
xlabel("Tiempo");
ylabel("Posicion en Y");
title('Grafica Tiempo vs Y');
hold on;

% GRAFICA X vs Y
figure (3);
plot(x1,y1,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10,...
x2,y2,'o','MarkerEdgeColor','k','MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10);
grid on
grid minor
xlabel("X");
ylabel("Y");
title('Grafica X vs Y');
hold on;

% GRAFICA LAS SPLINES DE LA PRIMERA ETAPA trayectorias azules
% TRAYECTORIA EN X:
[ax,bx,cx,dx] = trazador_cubico_sujeto(t1,x1,0,0)
% Cualquiera de estos tambien andan
%[ax, bx, cx, dx] = trazadorCubSujeto(t1,x1,0,0)
%[ax,bx,cx,dx]=trazadorCubSujetoVS01(t1',x1',[0 0]');
%[ax, bx, cx, dx] = Spline_Cubico_Sujeto(t1, x1, 0, 0);
Mx = [ax,bx,cx,dx]; % Matriz con coeficientes de cada trayectoria

%===============================================================================

% TRAYECTORIA EN Y
[ay,by,cy,dy] = trazador_cubico_sujeto(t1,y1,0,0)
%[ay, by, cy, dy] = Spline_Cubico_Sujeto(t1, y1, 0, 0)
My = [ay,by,cy,dy]; % Matriz con coeficientes de cada trayectoria
n = size(Mx,1);
# Armamos las splines para las dos trayectorias en cada etapa
for i = 1:n
tt = linspace(t1(i),t1(i+1));
xx = Mx(i,1)+Mx(i,2)*(tt-t1(i))+Mx(i,3)*((tt-t1(i)).^2)+Mx(i,4)*((tt-t1(i)).^3);
yy = My(i,1)+My(i,2)*(tt-t1(i))+My(i,3)*((tt-t1(i)).^2)+My(i,4)*((tt-t1(i)).^3);

%===============================================================================

figure (1);
plot(tt,xx,'b-',"linewidth",3);
figure (2);
plot(tt,yy,'b-',"linewidth",3);
figure (3);
plot(xx,yy,'b-',"linewidth",3);
endfor

%===============================================================================
% GRAFICAS LOS SPLINES DE LA SEGUNDA ETAPA trayectorias rojas
[ax,bx,cx,dx] = SplineCubicoSujeto(t2,x2,0,0); # programnado segun el Burden
Mx = [ax',bx',cx',dx']; % Matriz con coeficientes de cada trayectoria
[ay,by,cy,dy] = SplineCubicoSujeto(t2,y2,0,0); # programnado segun el Burden
My = [ay',by',cy',dy']; % Matriz con coeficientes de cada trayectoria
n = size(Mx,1);
# Armamos las splines para las dos trayectorias en cada etapa
for i = 1:n
tt = linspace(t2(i),t2(i+1));
xx = Mx(i,1)+Mx(i,2)*(tt-t2(i))+Mx(i,3)*((tt-t2(i)).^2)+Mx(i,4)*((tt-t2(i)).^3);
yy = My(i,1)+My(i,2)*(tt-t2(i))+My(i,3)*((tt-t2(i)).^2)+My(i,4)*((tt-t2(i)).^3);
figure (1);
plot(tt,xx,'r-',"linewidth",2);
figure (2);
plot(tt,yy,'r-',"linewidth",2);
figure (3);
plot(xx,yy,'r-',"linewidth",2);
endfor

#--------------------
#ejercicio resuelto por el profe de otra manera

% EJERCICIO 8 - TP 5

% Gráfica x en función de t
t=[0,1,2];
x=[0,2,6];
[a,b,c,d]=Cubic_Spline_Clamped(t,x,0,0);

n=length(x);
figure (1)
hold on;
grid on;
title("Grafica x vs t");
xlabel("t");
ylabel("x");

% TRAMO DE IDA EN X
h=t(1):0.001:t(2);
##s0x=inline("a(1)+b(1)*(x-t(1))+c(1)*(x-t(1)).^2+d(1)*(x-t(1)).^3");
s0x = @(x) (a(1)+b(1)*(x-t(1))+c(1)*(x-t(1)).^2+d(1)*(x-t(1)).^3);
plot(h,s0x(h),"r","linewidth",1);

h=t(2):0.001:t(3);
##s1x=inline("a(2)+b(2)*(x-t(2))+c(2)*(x-t(2)).^2+d(2)*(x-t(2)).^3");
s1x = @(x) (a(2)+b(2)*(x-t(2))+c(2)*(x-t(2)).^2+d(2)*(x-t(2)).^3);
plot(h,s1x(h),"g","linewidth",1);


% TRAMO DE VUELTA EN X
t=[2,3,4];
x=[6,3,0];
[a,b,c,d]=Cubic_Spline_Clamped(t,x,0,0);

h=t(1):0.001:t(2);
##s2x=inline("a(1)+b(1)*(x-t(1))+c(1)*(x-t(1)).^2+d(1)*(x-t(1)).^3");
s2x = @(x) (a(1)+b(1)*(x-t(1))+c(1)*(x-t(1)).^2+d(1)*(x-t(1)).^3);
plot(h,s2x(h),"linewidth",1);

h=t(2):0.001:t(3);
##s3x=inline("a(2)+b(2)*(x-t(2))+c(2)*(x-t(2)).^2+d(2)*(x-t(2)).^3");
s3x = @(x) (a(2)+b(2)*(x-t(2))+c(2)*(x-t(2)).^2+d(2)*(x-t(2)).^3);
plot(h,s3x(h),"m","linewidth",1);

legend('S0x(t)','S1x(t)','S2x(t)','S3x(t)');


% Gráfica y en funcion de t
t=[0,1,2];
y=[0,4,6];
[a,b,c,d]=Cubic_Spline_Clamped(t,y,0,0);

n=length(y);
figure(2)
hold on;
grid on;
title("Grafica y vs t");
xlabel("t");
ylabel("y");


% TRAMO DE IDA EN Y
h=t(1):0.001:t(2);
##s0y=inline("a(1)+b(1)*(y-t(1))+c(1)*(y-t(1)).^2+d(1)*(y-t(1)).^3");
s0y = @(y) (a(1)+b(1)*(y-t(1))+c(1)*(y-t(1)).^2+d(1)*(y-t(1)).^3);
plot(h,s0y(h),"r","linewidth",1);

h=t(2):0.001:t(3);
##s1y=inline("a(2)+b(2)*(y-t(2))+c(2)*(y-t(2)).^2+d(2)*(y-t(2)).^3");
s1y = @(y) (a(2)+b(2)*(y-t(2))+c(2)*(y-t(2)).^2+d(2)*(y-t(2)).^3);
plot(h,s1y(h),"g","linewidth",1);


%TRAMO DE VUELTA EN Y
t=[2,3,4];
y=[6,2,0];
[a,b,c,d]=Cubic_Spline_Clamped(t,y,0,0);

h=t(1):0.001:t(2);
##s2y=inline("a(1)+b(1)*(y-t(1))+c(1)*(y-t(1)).^2+d(1)*(y-t(1)).^3");
s2y = @(y) (a(1)+b(1)*(y-t(1))+c(1)*(y-t(1)).^2+d(1)*(y-t(1)).^3);
plot(h,s2y(h),"linewidth",1);

h=t(2):0.001:t(3);
##s3y=inline("a(2)+b(2)*(y-t(2))+c(2)*(y-t(2)).^2+d(2)*(y-t(2)).^3");
s3y = @(y) (a(2)+b(2)*(y-t(2))+c(2)*(y-t(2)).^2+d(2)*(y-t(2)).^3);
plot(h,s3y(h),"m","linewidth",1);

legend('S0y(t)','S1y(t)','S2y(t)','S3y(t)');


% Gráfica de trayectoria
figure (3)
hold on;
title("Grafica x vs y");
xlabel("x(t)");
ylabel("y(t)");

t=0:0.01:1;
imgX=s0x(t);
imgY=s0y(t);
plot(imgX,imgY,"r","linewidth",1);

t=1:0.01:2;
imgX=s1x(t);
imgY=s1y(t);
plot(imgX,imgY,"g","linewidth",1);

t=2:0.01:3;
imgX=s2x(t);
imgY=s2y(t);
plot(imgX,imgY,"linewidth",1);

t=3:0.01:4;
imgX=s3x(t);
imgY=s3y(t);
plot(imgX,imgY,"m","linewidth",1);

legend('S0xy(t)','S1xy(t)','S2xy(t)','S3xy(t)','location', 'northwest');
