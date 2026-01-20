function [tCN, yCN] = Crank_Nicholson_Newton(f, dfy, a, b, y0, N, maxit, tol)
  h = (b - a) / N;
  tCN = linspace(a, b, N+1)';
  yCN = zeros(N+1, 1);
  yCN(1) = y0; # Valor inicial del cálculo
  for i = 1:N
    y0 = yCN(i);
    fi = f(tCN(i), yCN(i));
    for it = 1:maxit
      fim1 = f(tCN(i+1), y0);
      dfim1 = dfy(tCN(i+1), y0);
      #Función recursiva en forma implícita.
      g = y0 - yCN(i) - h * 0.5 * (fi + fim1); # Representa la función implícita
      dg = 1 - h * 0.5 * dfim1; # Derivada de la función implícita
      # Ecuación recursiva de Newton (sistema no lineal)
      yCN(i+1) = y0 - g / dg; % Calculamos los ceros de la función implícita con Newton
      if (abs(yCN(i+1) - y0) < tol)
        break;
      end
      y0 = yCN(i+1);
    end
    # Solución del PVI por C-N con iteraciones de Newton
    yCN(i+1) = yCN(i) + (h/2) * (fi + f(tCN(i+1), yCN(i+1)));
    end
endfunction

