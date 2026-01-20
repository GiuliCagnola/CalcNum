#Guía 8 - Ejercicio 4
#------------------
##PVC
##{y'' = −(2/x)*y' + (2/x^2)*y + sin(ln(x))/(x^2), 1 ≤ x ≤ 2
##{y(1) = 1
##{y(2) = 2

#Solución exacta
##y = c1*x +c2*/(x^2)−(3/10)*sin(log(x)) −(1/10)*cos(log(x))
##donde c2 =1/70[8 − 12 sin(log(2)) − 4 cos(log(2))] y c1 =11/10− c2
#--------------------

# Dado que la condición de frontera se aplica en x=2 se necesita determinar A, B y C en ese punto
# Condición de frontera mixta: Ay'(2) + By(2) = C
# Condiciones de frontera y(2)=2, y'(2)=f'(2),
# donde f'(2) es la derivada de la solución exacta en x = 2

# teniendo en cuenta que y(2)=2 sustituyo en la solución exacta
# 2 = c1.*x + c2./(2.^2) − (3/10).*sin(log(2)) − (1/10).*cos(log(x))

#C se calcula sustituyendo x = 2 en la solución exacta y utilizando los valores de c1 y c2 obtenidos de las condiciones de contorno.

#C es 6 + c2/2 + (3/5)*sin(log(2)) + (1/5)*cos(log(2)).

c2 = 1/70*(8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = 11/10 - c2;

y=@(x) c1.*x + c2./(x.^2) - (3/10).*sin(log(x)) - (1/10).*cos(log(x))
dy=@(x) c1 - 2.*c2./(x.^3) + (3/10).*cos(log(x))./(x) + (1/10).*sin(log(x))./x
y_2 = y(2)
dy_2 = dy(2)


#h=(b-a)/L
h=1/10;
y_2 = 2
##A = 1 + (h/2) * p(b)
##B = -2 + h^2 * q(b)
##C = (h/2) * p(b) - 1

A = 1 + (h/2).*2
B = -2 + h.^2 * q(b)
C = (h/2) * p(b) -

%===========================================================
#RESOLUCIÓN DE BRISA
%===========================================================


f = @(x) [-2./x 2./x.^2 sin(log(x))./x.^2];
%y(1)=1 y(2)=2
inter = [1 2];
ycd = 1;
%b = 2
rob = [0 1 2];
L = 10;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L)
figure(1)
plot(x,y,'-m')
hold on

%ycd es alpha, el valor de la funcion en y(a)
%rob es el vector que tiene A, B y C.
%L es b-a/h; como h = 0.1 y h=0.01,en est4e caso tengo que hacer
%L = 10 y L=100

L = 100;
[x,y]=dif_fin_rob(f,inter,ycd,rob,L)
plot(x,y,'-g')
