#Guía 3 - Ejercicio 7
#--------------------

##aij =
##{2i si j=i
##{0.5i si j=i+2 o j=i−2
##{0.25i si j=i+4 o j=i−4
##{0 en otra posicion
#--------------------
n=100;

#forma con lazos anidados
A=zeros(n,n);
for i=1:n
  for j=1:n
    if j==i
      A(i,j)=2*i;
    endif
    if j==i+2 || j==i-2
      A(i,j)=0.5*i;
    endif
    if j==i+4 || j==i-4
      A(i,j)=0.25*i;
    endif
  endfor
endfor

#forma utilizando la función diag(A)
A = zeros(n);
for i = 1:n
  A = A + diag(2*i*ones(1, n-i+1), i-1);
  A = A + diag(0.5*i*ones(1, n-i-1), i+2-1);
  A = A + diag(0.5*i*ones(1, n-i-1), -(i+2-1));
  A = A + diag(0.25*i*ones(1, n-i-3), i+4-1);
  A = A + diag(0.25*i*ones(1, n-i-3), -(i+4-1));
end

