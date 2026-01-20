##function [x, rh, t] = PuntoFijo(g, x0, itmax, tol)
##  tic();
##  it = 0;
##  while it < itmax
##    x = g(x0);
##    rh(it+1) = abs(x - x0);
##    %rh(it) = max(abs([fp,p-a]))
##    if rh(it+1) < tol #|p_n - p_n-1|<tol -> error absoluto
##      break;
##    endif
##    x0 = x;
##    it++;
##  endwhile
##  t = toc();
##endfunction

function [p,it,r,t] = PuntoFijo (f,p0,tolerancia,maxit)
  tic();

  it=1;
  while it < maxit
    p = f(p0);

    r(it) = p-p0;
    if abs(p-p0) < tolerancia
      break;
    endif

    p0 = p;
    it = it + 1;
  endwhile

  if it == maxit
    disp("no se encontro punto fijo en maxit iteraciones");
  endif

  t = toc();
endfunction
