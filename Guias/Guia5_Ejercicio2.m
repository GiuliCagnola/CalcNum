#GUIA 5 - Ejercicio 2
#-------------------
## a) Para los datos de la siguiente tabla, encuentre el polinomio de interpolación en su forma de
##Lagrange PL(x), en su forma de Newton PN (x), y mediante el método de los coeficientes
##indeterminados PCI (x). Luego, reduzca los tres polinomios encontrados a la forma P(x) =
##dx3 + cx2 + bx + a con el fin de demostrar que son idénticos ya que las abcisas son distintas entre sí.
#x = 3 5 7 9
#y = 1.2 1.7 2.0 2.1

##b) Si se aproxima la función f(x) = sin(x) mediante un polinomio interpolante de grado nueve
##que interpola a f(x) en diez puntos del intervalo [0, 1], utilice el resultado sobre el error en
##interpolación polinomial para predecir una cota del error en dicho intervalo.
#-------------------

x = [3 5 7 9];
y = [1.2 1.7 2.0 2.1];
[PL, L] = Lagrange(x,y);
[PN, c, N] = PolIntNewton(x, y);




#Polinomio de coeficientes indeterminados

A=[1 3 9 27; 1 5 25 125; 1 7 49 343; 1 9 81 729]

b=[1.2; 1.7; 2; 2.1]


x=A\b

#Pci(x) = 0.075 + 0.45x - 0.25x^2 + 0x^3

#--------------------
#ejercicio resuelto por el profe
x = [3 5 7 9]'
y = [1.2 1.7 2.0 2.1]'

PL = @(x) (-1/40)*x.^2 + (9/20)*x + (3/40);

PN = @(x) (-0.025)*x.^2+(9/20)*x + (3/40);

PCI = @(x) 0.075 +0.45*x -0.025*x.^2;

%PL = PL(x);
figure(1)
plot(x,y,'*r')
grid on; grid minor;
hold on
% graficado con la funcion ezplot
ezplot(PL,[3,9])
ezplot(PN,[3,9])
ezplot(PCI,[3,9])

% graficado con la funcion plot

%z=linspace(3,9,201);
%PL=PL(z);
%PN=PN(z);
%PCI=PCI(z);

%plot(z,PL,'b-',z,PN,'m-',z,PCI,'g-')
