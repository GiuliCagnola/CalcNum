#GUIA 8 - Ejercicios 2 y 3
#-------------------
##Dado el PVC
##{y'' = −(2/x)*y' + (2/x^2)*y + sin(ln(x))/(x^2), 1 ≤ x ≤ 2
##{y(1) = 1
##{y(2) = 2
##cuya solución exacta está dada por
##y = c1*x +c2*/(x^2)−(3/10)*sin(ln(x)) −(1/10)*cos(ln(x))
##donde c2 =1/70[8 − 12 sin(ln(2)) − 4 cos(ln(2))] y c1 =11/10− c2

##Aplique el algoritmo del disparo lineal y de diferencias finitas de dirichlet con h = 0.1 y h = 0.01 para hallar la solución aproximada
##Calcule el error cometido y el orden empírico del método. Saque conclusiones.
#-------------------

#f=@(x) [p(x)  q(x)  r(x)]
f=@(x) [-2./x     2./(x.^2)     sin(log(x))./(x.^2)]
yc=[1 2];

c2 = 1/70*(8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = 11/10 - c2;
f_exacta=@(x) c1.*x + c2./(x.^2) - (3/10).*sin(log(x)) - (1/10).*cos(log(x));

#h = 0.1 -> L = 10
[x1, y1] = DisparoLineal(f, 1, 2, yc, 10);
[x2, y2] = DiferenciasFinitasDirichlet(f,1,2,yc,10);
figure(1)
plot(x1, y1, '*-')
hold on
plot(x2, y2, 'o-')
title('solución con h=0.1')

#h = 0.1 -> L = 100
[x3, y3] = DisparoLineal(f, 1, 2, yc, 100);
[x4, y4] = DiferenciasFinitasDirichlet(f, 1, 2, yc, 100);
figure(2)
plot(x3, y3, '*-')
hold on
plot(x4, y4, 'o-')
title('solución con h=0.01')

figure(3)
x=linspace(1,2,100);
plot(x, f_exacta(x),'--')
hold on
title('solución exacta')

