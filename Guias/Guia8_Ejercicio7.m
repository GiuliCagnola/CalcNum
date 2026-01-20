#Guia 8 - Ejercicio 7
#--------------------
%===========================================================
#RESOLUCIÓN DE BRISA
%===========================================================

format long g;
clear all;
clc;
close all;
W1 = 2;
Long = 6;
Laleta = 4;
D = 0.2;
k = 2.04;
H = 6*10^-3;
uw = 200;
uE = 40;

%despues de hacer muchos pasos algebraicos, la expresion de la funcion queda:
p = @(x) 1./Long-x;
q = @(x) 2.*H.*(W1-D./Long-x)./D.*W1.*k;
r = @(x) -q(x)*uE;
f = @(x) [p(x) q(x) r(x)];

inter = [0 Laleta];
ycd = uw;

%ku'+Hu=HuE
rob = [k H H*uE];
L = 3;
[x,u]=dif_fin_rob(f,inter,ycd,rob,L);
for i=1:100
  L=L*2;
  [x,u0]=dif_fin_rob(f,inter,ycd,rob,L);
  u0(end);
  if abs(u(end) - u0(end)) < 1e-5
    u=u0;
    break;
  endif
  u=u0;
endfor
plot(x,u)

%===== b =====
A1 = D*W1;
flujo = k*A1*(u(2) - uw)/(Long/L)
