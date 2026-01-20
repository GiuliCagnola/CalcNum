function w = Woptimo(A, b, x0, maxit, tol)
  aux = 100000;
  w = 0.01;
  for i = 1:0.05:2.0
    [x, it, r, t] = SOR(A, b, x0, maxit, tol, i);
    if it < aux
      w = i;
      aux = it;
    endif
  endfor
endfunction


