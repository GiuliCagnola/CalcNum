##function [a,b,c,d]= SplineCubicoNatural(x,f)
####  a,b,c,d son vectores que en la j-esima componente tienen los coeficientes correspondientes al polinomio del tramo-j
####S(x) = Sj(x) = aj + bj*(x − xj) + cj*(x − xj)^2 + dj*(x − xj)^3,  xj ≤ x ≤ xj+1
###x es el vector con las coordenadas de los nodos y f es el vector con los valores de la función f en los correspondientes nodos
##  n=length(x);
##  for i=1:n
##  a(i)=f(x(i));
##  endfor
##  for i = 1:n-1
##  h(i)=x(i+1)-x(i);
##  endfor
##for i =2 :n-1
## alfa(i)=(((3/h(i))*(a(i+1)-a(i)))-((3/h(i-1))*(a(i)-a(i-1))));
##endfor
##l(1)=1; u(1)=0; z(1)=0;
##for i =2 :n-1
##l(i)=2*(x(i+1)-x(i-1))-h(i-1)*u(i-1) ;
##u(i)=h(i)/l(i);
##z(i)=((alfa(i)-(h(i-1)*z(i-1)))/l(i));
##endfor
##l(n)=1;z(n)=0;c(n)=0;
##for j =(n-1):-1:1
##c(j)=(z(j)-(u(j)*c(j+1)));
##
##b(j)=(((a(j+1)-a(j))/h(j)) -((h(j)*(c(j+1)+(2*c(j))))/3));
##d(j)=((c(j+1)-c(j))/(3*h(j)));
##endfor
##a = f(1:n-1);
##
##c = c(1:n-1);
##endfunction

#-----------
function [a, b, c, d] = SplineCubicoNatural(x, y)
# Pasamos un arreglo de puntos x e y
# Es una funcion para el calculo de una Spline Cubica Natural, es decir con
# derivadas segundas nulas.
# S(x) = Sj(x) = aj + bj(x-xj) + cj(x-xj)^2 + dj(x-xj)^3 para xj <= x <= xj+1;
# S''(x1) = 0  , S''(xn+1) = 0
n = length(x);

v = zeros(n,1);
c = v;
# calculamos los h de cada Spline.
h(1:n-1) = x(2:n) - x(1:n-1); # sin usar el lazo

# paso 2 calcula los terminos independientes
v(2:n-1) = 3*((y(3:n) - y(2:n-1) )./h(2:n-1)...
 - (y(2:n-1) - y(1:n-2))./h(1:n-2));


l = ones(n,1);
u = zeros(n,1);
z = zeros(n,1);


for i = 2:n-1
  l(i) = 2 * ( x(i+1) - x(i-1) ) - h(i-1) * u(i-1);
  u(i) = h(i)/l(i);
  z(i) = ( v(i) - h(i-1) * z(i-1) ) / l(i);
endfor



for i = n-1:-1:1
  c(i) = z(i) - u(i) * c(i+1);

  b(i) = ( y(i+1)-y(i) ) / h(i) - h(i) * ( c(i+1) + 2 * c(i) ) / 3;

  d(i) = ( c(i+1) - c(i) ) / ( 3*h(i) );
endfor

  a = y(1:n-1);
  c = c(1:n-1)';
endfunction
