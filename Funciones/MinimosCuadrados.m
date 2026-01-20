function [coef, A, b] = MinimosCuadrados(x, y, grado)

  A = zeros(grado+1);
  b = zeros(grado+1,1);
  for k=0:grado
    A(1,k+1) = sum(x.^k);
  endfor
  b(1) = sum(y);
  for k=1:grado
    A(k+1,1:grado) = A(k,2:grado+1);
    A(k+1,grado+1) = sum(x.^(k+grado));
    b(k+1) = sum(y.*x.^k);
  endfor
  coef = A\b;
  coef = coef(end:-1:1);
endfunction

