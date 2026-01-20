function [tRK4, yRK4] = RungeKutta4(f, a, b, y0, L)
    # Metodo de Runge-Kutta de orden 4
    # para resolver
    %    y' = f(t,y)  en [t0,TF]
    % y(t0) = y0
    % Usando L pasos
    % y0 puede ser vectorial o escalar

    tRK4 = linspace(a, b, L+1)';
    h = (b-a)/L;

    % reservamos lugar en memoria para yRK4
    yRK4 = zeros(length(y0), L+1);

    yRK4(:, 1) = y0;

    for n = 1:L
        k1 = h * f(tRK4(n), yRK4(:, n));
        k2 = h * f(tRK4(n) + h/2, yRK4(:, n) + k1/2);
        k3 = h * f(tRK4(n) + h/2, yRK4(:, n) + k2/2);
        k4 = h * f(tRK4(n+1), yRK4(:, n) + k3);

        yRK4(:, n+1) = yRK4(:, n) + (k1 + 2*k2 + 2*k3 + k4)/6;
    end

    yRK4 = yRK4';
endfunction

