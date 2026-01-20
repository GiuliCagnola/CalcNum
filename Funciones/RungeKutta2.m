function [t,y] = RungeKutta2(f, a, b, y0, L)
% Metodo de Runge-Kutta de orden 2
% para resolver
%    y' = f(t,y)  en [a,b]
% y(t0) = y0
% Usando L pasos
% y0 puede ser vectorial o escalar

t = linspace(a,b,L+1)';
h = (b-a)/L;

% reservamos lugar en memoria para y
y = zeros( length(y0), L+1 );

y(:,1) = y0;

for n=1:L
  k1 = h * f(t(n)  , y(:,n));
  k2 = h * f(t(n+1), y(:,n)+k1);

  y(:,n+1) = y(:,n) + (k1 + k2)/2;
end
y=y';
