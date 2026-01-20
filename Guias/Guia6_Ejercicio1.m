#Guia 6 - Ejercicio 1
#--------------------




% Definición de la función
f = @(x) exp(x) - 2*x^2 + 3*x - 1;

% Punto en el que se desea estimar la derivada
x0 = 0;
##x_int = [-0.1, 0.1];

% Valores de h para probar
h_val = logspace(-11,-1,100);
##h_val = linspace (1e-11,1e-1,100);
##h_val = 0.1;

% Valor real de la primera derivada en x0
real_deriv = exp(x0) - 4*x0 + 3;

% Calcula la estimación de la derivada con diferentes valores de h
est_deriv = zeros(size(h_val));
E_abs = zeros(size(h_val));
E_redon = zeros(size(h_val));

  for i = 1:length(h_val)
      h = h_val(i);

      est_deriv(i) = (f(x0 + h) - f(x0)) / h;
      E_abs(i) = abs(est_deriv(i) - real_deriv);
##      E_redon(i) = E_abs(i)/h;
  end

% Graficar el error absoluto en función de h
loglog(h_val, E_abs, 'o-');
xlabel('Tamaño del paso h');
ylabel('Error absoluto');
title('Error absoluto en la estimación de la derivada');
grid on;
##loglog(h_val, E_abs_tres_ptos, 'o-');

#######################################################################
%Parte b

% Definición de la función segunda derivada
f_seg = @(x) exp(x) - 4;

% Cálculo de la norma infinito de f'' en el intervalo
norm_f_seg = norm(f_seg(x0),inf);

% Cota del error teórico
E_bound = h/2 * norm_f_seg;

% Comprobación de la cota de error

  if E_abs <= E_bound
    disp('Se verifica la cota del error')
  else
    disp ('No se cumple la cota del error')
  end

#######################################################################
%Parte c

est_deriv_tres_ptos = zeros(size(h_val));
E_abs_tres_ptos = zeros(size(h_val));

  for i = 1:length(h_val)
      h = h_val(i);

      est_deriv_tres_ptos(i) = (f(x0 + h) - f(x0 - h)) / (2*h);
      E_abs_tres_ptos(i) = abs(est_deriv_tres_ptos(i) - real_deriv);
  end
