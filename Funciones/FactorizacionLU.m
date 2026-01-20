function [LU,P] = FactorizacionLU(A)
  n=length(A(1,:));
  r=1:n;
  tolerancia = 1e-9;
  for k=1:n-1
    [pmax,p] = max(abs(A(r(k:n),k))); %el max entre Aik, con i=k,k+1,...,n en el orden de r

    if(pmax<tolerancia)
      display("todos chiquitos");
    endif

    p=p + k-1;
    if(p~=k)
      r([p k])=r([k p]);  %permutacion
    endif

    %L y U
    A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);                            %L para todo lo que esta debajo de Akk
    A(r(k+1:n),k+1:n) = A(r(k+1:n),k+1:n)-A(r(k+1:n),k)*A(r(k),k+1:n);  %U para todo lo que esta a la derecha de Akk
  endfor

  LU=A(r(:),:)
  P=eye(n)(r,:)
endfunction
