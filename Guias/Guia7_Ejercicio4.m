#GUIA 7 - Ejercicio 4
#-------------------
#Analice el comportamiento del error para los métodos de Euler hacia adelante,
#Euler hacia atrás y Crank-Nicholson cuando se resuelve el PVI
#{y'(t) = t*e^(3t) − 2y,  0 <= t <=1
#{y(0) = 0
#cuya solución exacta es y(t) = te^(3t)/5 − e^(3t)/25 + e^(−2t)/25
#Considere los pasos h = 0.2, h = 0.1 y h = 0.05
#Determine si el orden empírico para cada uno de los métodos se corresponde con el teórico
#-------------------
f = @(t, y) t*exp(3*t) - 2*y  % y'
f_exacta = @(t) t.*exp(3.*t)./5 - exp(3.*t)./25 + exp(-2.*t)./25 % Solución analítica
dfy = @(t, y) -2

% h = 0.2 -> L = 5
[tE, yE] = Euler(f, 0, 1, 0, 5)
[tEA, yEA] = EulerAtras(f, dfy, 0, 1, 0, 5, 1000, 1e-6)
[tCN, yCN] = Crank_Nicholson_Newton(f, dfy, 0, 1, 0, 5, 1000, 1e-6)

% Cálculo del error absoluto y relativo entre la solución exacta y la solución numérica aproximada
t_exacta = linspace(0, 1, 100)
y_exacta = f_exacta(t_exacta)

ErrorE_abs = abs(f_exacta(tE) - yE)
ErrorE_rel = abs(f_exacta(tE) - yE) ./ abs(f_exacta(tE))

ErrorEA_abs = abs(f_exacta(tEA) - yEA)
ErrorEA_rel = abs(f_exacta(tEA) - yEA) ./ abs(f_exacta(tEA))

ErrorCN_abs = abs(f_exacta(tCN) - yCN)
ErrorCN_rel = abs(f_exacta(tCN) - yCN) ./ abs(f_exacta(tCN))





