function [df, h] = DiferenciasCentradas(f, x0, hmin, hmax, n)

  #f es la función
  #x0 es el punto en el que quiero calcular la derivada
  #hmin es el tamaño mínimo del paso
  #hmax es el tamaño máximo del paso
  #n es el número de puntos para los cuales se calculará la derivada
  h = linspace(hmin, hmax, n);
  fx0 = f(x0);
  fx1 = f(x0 - h);
  fx2 = f(x0 + h);

  df = (fx2 - fx1) ./ (2 * h);
end
