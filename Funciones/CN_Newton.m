function [x, w] = CN_Newton(f, dfy, a, b, y0, n, maxit, tol)
  #Implementa el método de Crank-Nicholson cond interaciones de Newton
  #f es la función
  #dfy es la derivada parcial de f respecto de y
  #a es el valor inicial del intervalo
  #b es el valor final del intervalo
  #y0 es la condición inicial
  #n es la cantidad de pasos

  h = (b-a)/n;
  x = [a:h:b];
  w = zeros(1,n+1);
  w(1) = y0;
  for i=1:n
    w0 = w(i);
  endfor
  f = f(x(i),w(i));
  for it = 1:maxit
    fm1 = f(x(i+1),w0);
  endfor
  dfm1 = dfy(x(i+1),w0);
  g = w0 - w(i) - h*0.5*(f + fm1);
  dg = 1 - h*0.5*dfm1;
  w(i+1) = w0 - g/dg;
  if (abs(w(i+1)-w0) < tol)
    break;
    endif
  endif
  w0 = w(i+1);
endfor
w(i+1) = w(i) + h/2*( f + f(x(i+1),w(i+1)));
endfor
endfunction
