function [c, dv] = DiferenciasDivididasInc(x, y, dv)
  #Calcula por el método de diferencias divididas incrementales
  #Al incluir dv, sirve para polinomios de Hermite
n = length(x);
m = length(dv);
dv(n,n) = 0;
dv(m+1:n,1) = y(m+1:n);
for i = 1:n-1
dv(m-i:n-i,i+1) = ( dv(m-i+1:n-i+1,i)-dv(m-i:n-i,i) )./(x(m:n) - x(m-i:n-i));
end
c = dv(1,:)';
endfunction
