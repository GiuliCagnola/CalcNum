##function [t, w] = EulerAtras(f, dfy, a, b, y0, N, maxit, tol)
##  h = (b-a)/N;
##  t = [a:h:b]';
##  w = zeros(1,N+1)';
##  w(1) = y0;
##  for i=1:N
##    w0 = w(i);
##  endfor
##  for it=1:maxit
##    fm1 = f(t(i+1),w(i+1));
##    dfm1 = dfy(t(i+1),w(i+1));
##    g = w0 - w(i) - h*fm1;
##    dg = 1 - h*dfm1;
##    w(i+1) = w0 - g/dg;
##      if (abs(w(i+1)-w0) < tol)
##         break;
##      endif
##    w0 = w(i+1);
##    endfor
##    w(i+1) = w(i) + h*f(t(i+1),w(i+1));
##  endfor
##endfunction

function [tEA, yEA] = EulerAtras(f, dfy, a, b, y0, N, maxit, tol)
  #dfy es la derivada parcial de la función f respecto de la variable y
    h = (b - a) / N;
    tEA = (a:h:b)';
    yEA = zeros(N+1, 1);
    yEA(1) = y0;

    for i = 1:N
        y0 = yEA(i);
        for it = 1:maxit
            fm1 = f(tEA(i+1), yEA(i+1));
            dfm1 = dfy(tEA(i+1), yEA(i+1));
            g = y0 - yEA(i) - h * fm1;
            dg = 1 - h * dfm1;
            yEA(i+1) = y0 - g / dg;

            if (abs(yEA(i+1) - y0) < tol)
                break;
            end

            y0 = yEA(i+1);
        end
        yEA(i+1) = yEA(i) + h * f(tEA(i+1), yEA(i+1));
    end
end

