function [x,y] = DisparoLineal(f, a, b, yc, L)

  % Método del disparo lineal que resuelve
  % el problema de valores de contorno lineal
  % usando Runge-Kutta
  % condiciones Dirichlet
  % y'' = p(x)y' + q(x)y + r(x) para x en [a,b]
  % y(a)=alpha , y(b)=beta
  % f: función columnas con las funciones p,q,r
  % L: cantidad de subintervalos

  p = @(x) f(x)(:,1); % todas las filas, columna 1, o sea p(x)
  q = @(x) f(x)(:,2); % todas las filas, columna 2, o sea q(x)
  r = @(x) f(x)(:,3); % todas las filas, columna 3, o sea r(x)

  % construir el sistema
  F = @(x,y) [y(3);
              y(4);
              p(x).*y(3)+q(x).*y(1)+r(x);
              p(x).*y(4)+q(x).*y(2)+r(x)];

  % definir las condiciones iniciales
  y0 = [yc(1); yc(1); 0; 1];
  [x, yd] = RungeKutta4(F, a, b, y0, L);

  lambda = (yc(2) - yd(end,2))./(yd(end,1) - yd(end,2));
  y = lambda.*yd(:,1) + (1 - lambda).*yd(:,2);
end
