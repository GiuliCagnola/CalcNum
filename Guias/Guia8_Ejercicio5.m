#GUIA 8 - Ejercicio 5
#-------------------
##Considere el proceso de difusion en una barra de material homogéneo delongitud L = 3 y conductividad térmica K0 = 1.
##Suponga que la temperatura en el extremo izquierdo es igual a 21 y que el extremo derecho se encuentra aislado.
##Se sabe que sobre la barra actúa una fuente f(x) = 20*sin(5(x − 1)).
##a) Determine, con dos dígitos decimales exactos, la temperatura en el extremo derecho de la barra. Explique cómo lo hizo.
##b) Estime en qué punto de la barra la temperatura es máxima, y qué valor de temperatura alcanza en dicho punto.
#-------------------
fuente=@(x) 20*sin(5*(x - 1))
pR=@(x) 0.*x #proceso reactivo
#u'' = -20*sin(5*(x-1))

#−K0*u''(x) + Cr(x)*u(x) = f(x), 0<=x<=L
#-> K0 es la conductividad térmica
#-> u(x, t) es la temperatura en el punto x de la barra al tiempo t
#-> Cr es el coeficiente de reacción del proceso reactivo

K0=1;
u0=[0,0];

f=@(x) [0.*x  0.*x  -20*sin(5*(x-1)) # tengo que poner 0.*x o zeros(size(x)) para que lo tome como un vector y no como un escalar
[x,y] = DiferenciasFinitasRobin(f, a, b, ycd, rob, L)

#-----------------------------------------------------
#RESOLUCIÓN DEL PROFE
#-----------------------------------------------------
%Ej5_2023TP8.m
%el problema de valores de contorno lineal con
% condicion mixta adapatada a Neumann
% y'' = p(x)y' + q(x)y + r(x) para x en [a,b]
% y(a)=alpha , Ayí(b) + By(b) = C (COND. MIXTA)
% f: funcion columnas con las funciones p,q,r
% PVC calentamiento de una barra de cobre con una fuente. Difusion-reaccion
% Ley de enfriamiento de Newton
% PVC tipo Robin -K0*u'(L) = H(u(L)-ue);
% ARMADO DE LA CONDICION
% Ej: -0.9*u'(3)-15*u(3)= -15*4 ====> [-0.9 -15  -60]

clear all;clc

Largo=3;                   % Longitud de la barra
y0=21;                      % temperatura extremo izquierdo
Hnewton=0;                % Coeficiente convectivo en la frontera
ue=0;                      % Temperatura exterior
K0 = 1;                   % Conductividad termica (depende del material)
fuente=@(x) 20*sin(5*(x-1));    % Fuente de calor "r"
%fuente=@(x) 20*x;
pR = @(x) 0.*x;      % proceso reactivo

f =@(x) [(1/K0)*0.*x  (1/K0)*pR(x)  -(1/K0)*fuente(x)];
%h=0.01;
%L = Largo/h;
L=100;
inter=[0 Largo];
rob=[-K0 0 0];
##[xDFR,yDFR] = dif_fin_rob(f,inter,y0,rob,L);
[x,y] = DiferenciasFinitasRobin(f, 0, Largo, y0, rob, L);
%=============
figure(1)
xx=linspace(0,300,201);
plot(xx,fuente(xx),'r-')
title('Funcion Fuente de calor')
xlabel('posicion: X')
ylabel('Fuente')

figure(2)
plot(x,y,'b-*');
title('Temperatura a la largo de la barra calculada por DFinitas con h=0.1')
xlabel('posicion: X')
ylabel('Temperatura')
grid on;
grid minor

y(end)
max(y)
#-----------------------------------------------------
%Ej5TP8_EX28_7_22.m
% PVC calentamiento de una barra de cobre con una fuente. Difusion-reaccion
% Ley de enfriamiento de Newton
% PVC tipo Robin -K0*u'(L) = H(u(L)-ue);
% -0.9*u'(3)-15*u(3)= -15*4
clear all,clc
Largo=2;                   % Longitud de la barra
y0=6;                      % temperatura extremo izquierdo
Hnewton=15;                % Coeficiente convectivo en la frontera
ue=4;                      % Temperatura exterior
K0=0.57;                   % Conductividad termica (depende del material)
A=0.01;                    % area de la seccion del tubo
rho=2.7;                   % densidad del material c=0.217,
c=0.217;                   % Calor especifico

%fuente=@(x) 5*x.*(5-x);
fuente = @(x) 2*x.*(2-x);   % Fuente de calor "r"
%pR = @(x) (1.05)*x+2;
pR=@(x) 0.1*x.^3+2.5;     % proceso reactivo

%f =@(x) [0.*x (1/K0)*pR(x) -(1/K0)*fuente(x)];
f =@(x) [(0.*x)/K0  pR(x)/K0 -fuente(x)/K0];
h=0.005;
L = Largo/h;
#inter=[0 Largo];
rob=[-0.57 -15 -60];
##[xDFR,yDFR] = dif_fin_rob(f,inter,y0,rob,L);
[x, y] = DiferenciasFinitasRobin(f,0, Largo,y0,rob,L);

figure(1)
plot(x,y,'b-*');
title('Temperatura a la largo de la barra calculada por DFinitas con h=0.1')
xlabel('posicion: X')
ylabel('Temperatura')
grid on; grid minor


% temperatura en el extremo derecho
TempExtDer=y(end);
disp('Temperatura en el extremo derecho:');
disp(TempExtDer)

Flujo_ExtDer=Hnewton*(y(end)-ue);
disp('Flujo Extremo Derecho:');
disp(Flujo_ExtDer)

% punto 3
Coef=A*c*rho;
##Q = Coef*(SimpsonComp(xDFR,yDFR));
Q = SimpsonCompuestoDatos(x,y);
disp('Energia Termica:');
disp(Q)
