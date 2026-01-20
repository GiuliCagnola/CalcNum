function [x,r_h,it,t] = GaussSeidel(A,b,x0,itmax,tol)
 #Condiciones suficientes para la convergencia del método:
 #A debe ser diagonal dominante y simétrica definida positiva
tic();
n = length(b);
x = x0;
it = 0;
while ( it <= itmax )
for i = 1:n
x(i) = (b(i) - A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * x0(i+1:n) ) /A(i,i);
endfor
r_h(it+1) = norm(A*x - b,inf);
if r_h(it+1) < tol
break;
endif
x0 = x;
it = it +1;
endwhile
t = toc();
endfunction

