function [x, r_h ,it, t] = Jacobi(A, b, x0, itmax, tol)
    tic(); #arranca a contar el tiempo
     n=length(b); #n toma la longitud de b
     x = x0;
     it=1;
     while(it<=itmax) #lazo while para las iteraciones
          for i=1:n #lazo for desde 1 hasta n con paso 1
               x(i) =(b(i) - A(i,1:i-1)*x0(1:i-1) - A(i,i+1:n)*x0(i+1:n))/A(i,i); #iteración de Jacobi
          endfor
          r_h(it+1) = norm(A*x - b, inf);  #la variable r_h toma la norma de la diferencia entre A*x y b
          if r_h(it+1) < tol #si es menor entonces asumo convergencia
               break;
          endif
          x0 = x; #actualiza el vector de valores
          it++; #aumenta el contador de iteraciones
     endwhile  #finaliza el lazo while
    t=toc(); #finaliza el contador de tiempo
endfunction

