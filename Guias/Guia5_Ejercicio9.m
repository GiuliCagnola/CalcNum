#Guía 5 - Ejercicio 9
#-------------------
semana=[0:6]
cantidad=[432 599 1012 1909 2977 4190 5961]
p1=polyfit(semana,cantidad,1) #polinomio de grado 1


p2=polyfit(semana,cantidad,2)#polinomio de grado 2


#Ajuste por mínimos cuadrados por modelo lineal:
[coef, A, b] = MinimosCuadrados(semana,cantidad,1)

#Ajuste por mínimos cuadrados por modelo lineal:
[coef, A, b] = MinimosCuadrados(semana,cantidad,2)

#--------------------

#Ejercicio resuelto por el profe
# Ej9TP05
clear all
clc
clf
# datos
x = [0 1 2 3 4 5 6]'
y = [432 599 1012 1909 2977 4190 5961]'

xx=linspace(-1,10.5,201);


# interpolamos con lagrange
[PL, L] = Lagrange(x,y);
plag = @(x) polyval(PL,x);

figure(1)
 plot(x,y,'ro', xx,plag(xx),'k')
 grid on
 hold on
 xlabel ('X')
 ylabel('Y')
 legend('datos', 'Lagrange')

# Ajuste de datos

# Lineal

cp = polyfit(x,y,1);
p1 = @(x) polyval(cp,x);

plot(xx,p1(xx),'b')

legend('datos', 'Lagrange', 'Lineal')

# Cuadratico

cp4 = polyfit(x,y,4);
p4 = @(x) polyval(cp4,x);

plot(xx,p4(xx),'g')

legend('datos', 'Lagrange', 'Lineal','Cuadratico')

# Newton
[PN, c, N] = PolIntNewton(x, y);
pnew = @(x) polyval(PN,x);

plot(xx,pnew(xx),'y')
legend('datos', 'Lagrange', 'Lineal','Cuadratico', 'Newton')
y10=14900
ErrLag = norm(y10-plag(10))
ErrNew = norm(y10-pnew(10))
ErrLineal = norm(y10-p1(10))
Error_y10 = norm(y10-p4(10))
ErrorRelativo = abs((y10-p4(10))/y10)
ErrorCuadratico= norm(y - p4(x))
#-------------------
#ejercicio resuelto por el profe de otra manera
# ejercicio 9 otra manera
#Ej9TP05New

clear all
clc
clf
# datos
x = [0 1 2 3 4 5 6]'
y = [432 599 1012 1909 2977 4190 5961]'
y10 = 14900;
n = length(x);
x10 = 10;

xx=linspace(-1,10.5,201);

p6 = polyfit(x, y,6);
p1 = polyfit(x, y,1);
p2 = polyfit(x, y,2);

figure(1)
hold on
plot(xx, polyval(p6,xx),'k',"linewidth",2);
plot(xx, polyval(p1,xx),'b',"linewidth",2);
plot(xx, polyval(p2,xx),'g',"linewidth",2);
plot(x, y,'ro',"linewidth",2);
plot(x10,y10,'*k',"linewidth",2);
grid on;
xlabel ('Mediciones')
ylabel('Cantidad')
legend('p6-grado6', 'p1-Lineal', 'p2-Cuadratico', 'datos')
# Calculo del error cuadratico medio

ecm1 = sum((y - polyval(p1,x)).^2)/n;
ecm2 = sum((y - polyval(p2,x)).^2)/n;
ecm6 = sum((y - polyval(p6,x)).^2)/n;

#--------------------
#jercicio resuelto por el profe de otra manera

# Aproximacion por minimos cuadrados.
# Ej9TP05MC
clear all
clf
clc

 x = [0 1 2 3 4 5 6]
 y = [432 599 1012 1909 2977 4190 5961]

format long
figure(1)
plot(x,y,'r*');
xlabel ('X')
ylabel('Y')
grid on
hold on
%%%%%%%%%%%%%%%%%%%%%
v=0:1:6
###############################
n = length(x)-1
p = polyfit(x,y,n)
z = polyval(p,v);

%figure(2)
plot(v, z, 'm')
