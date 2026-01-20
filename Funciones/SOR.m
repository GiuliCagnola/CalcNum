function [x,it,r,t] = SOR(A, b, x0, maxit, tol, w)
  tic();
  n=length(A(1,:));
  x=x0; % x0 almacena el x de la iteracion anterior
  it=0;
  while (it < maxit)
    for i=1:n
      x(i) = (1-w)*x(i) + w*((b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i));
    endfor

    r(it+1) = norm(A*x-b,inf);  %residuo
    if r(it+1) < tol
      break;
    endif

    x0=x;
    it++;
  endwhile

  t=toc();
endfunction

