function C = FactorizacionCholesky(A)
  # Comprobar si la matriz A es simétrica y definida positiva
  if (!issymmetric(A) || any(eig(A)<=0))
    error("La matriz A debe ser simétrica y definida positiva");
  endif
  n=size(A,1);
  C = zeros(n,n);
  C(1,1) = sqrt(A(1,1));

  for i=2:n
    C(i,1) = A(i,1)/C(1,1);
  endfor

  for i=2:n-1
    sumCuadrado = 0;
    for s=1:i-1
      sumCuadrado += C(i,s)^2;
    endfor
    C(i,i) = sqrt(A(i,i)-sumCuadrado);

    for j=i+1:n
      producto = 0;
      for s=1:i-1
        producto += C(j,s)*C(i,s);
      endfor
      C(j,i) = ( A(j,i) - producto )/C(i,i);
    endfor
  endfor

  sumCuadrado = 0;
  for s=1:n-1
    sumCuadrado += C(n,s)^2;
  endfor
  C(n,n) = sqrt( A(n,n) - sumCuadrado );
endfunction


