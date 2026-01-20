function [t,y] = RungeKutta3(f, a, b, y0, L)
% Metodo de Runge-Kutta de orden 3
% para resolver
%    y' = f(t,y)  en [t0,TF]
% y(t0) = y0
% Usando L pasos
% y0 puede ser vectorial o escalar

t = linspace(a, b,L+1)';
h = (b-a)/L;

% reservamos lugar en memoria para y
y = zeros( length(y0), L+1 );

y(:,1) = y0;

for n=1:L
  k1 = h * f(t(n)  , y(:,n));
  k2 = h * f(t(n)+h/2, y(:,n)+(k1/2));
  k3 = h * f(t(n)+h, y(:,n)- k1+ 2*k2);

  y(:,n+1) = y(:,n) + (1/6)*(k1 + 4*k2 + k3);
end
y=y';
