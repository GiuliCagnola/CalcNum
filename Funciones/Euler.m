function [tE,yE] = Euler(f,a,b,y0,L)
  % Metodo de Euler para resolver
  %    y' = f(t,y) en [a, b]
  %    y(t0) = y0;
  % usando L pasos
  % y0 puede ser vectorial o escalar

  tE = linspace(a, b, L+1)';
  h = (b - a)/L;

 % reservamos un lugar en memoria para yE
  yE = zeros(length(y0), L+1);

  yE(:,1) = y0;
  for n = 1:L
    yE(:,n+1) = yE(:,n) + h*f(tE(n),yE(:,n));
  end

  yE = yE';

endfunction



