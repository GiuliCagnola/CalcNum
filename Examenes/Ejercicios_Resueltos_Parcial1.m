#EJERCICIOS DE PARCIALES
--------------------
#Parcial 1 11/05/20 - Pregunta 1

A=[1/2 -1 0; -1 3 -1; 0 -1 2]
b=[7;4;5]
x0=b
tol=10^-8
[xGS,r_h,it,t] = GaussSeidel(A,b,x0,3000,tol)
x = [96; 41; 23] #por GS
it = 112 #por GS

w=1.450 #parametro de relajacion para SOR
x = [96; 41; 23] #por SOR
it = 27 #por SOR

[x, r_h ,it, t] = Jacobi(A, b, x0, 3000, tol)
x = [96; 41; 23] #por Jacobi
--------------------

#Parcial 1 11/05/20 - Pregunta 2

f=@(x) x + e^(-10*x^2)*cos(x)
df=@(x) - e^(-10*x^2)*(sin(x) + 20*x*cos(x) - e^(-10*x^2))
[x,rh,it,t] = NewtonRaphson(f,df,0,2000,10^-6) #no converge
-------------------

#Parcial 1 11/05/20 - Pregunta 3

#El siguiente código resuelve un sistema de ecuaciones lineales por el método de eliminación de Gauss. De las opciones que corrigen el código
function[x] =eliminacionGauss(A,b)
n = length(A);
r = 1:n;
for k=1:n
[~,p] = max(abs(A(k:n,k)));
p = p + k - 1;
r( [k,p] ) = r( [p,k] );
m = A(r(k+1:n),k)/A(k,k);
b(r(k+1:n)) = b(r(k+1:n)) - m*b(k);
A(r(k+1:n),k+1:n) -= A(r(k),k+1:n)*m;
end
x = sustitucionAtras(A,b,r);
endfunction

#Opciones:
a. En línea 5 debería ser:[~,p] = max(abs(A(k,k:n)));
b. En línea 10 debería ser: A(r(k:n),k:n) -= m*A(r(k),k:n)
c. El código no tiene errores
d. En línea 9 debería ser: b(k+1:n) = b(k+1:n) - m*b(k);
e. En línea 10 debería ser: A(r(k+1:n),r(k+1:n)) -= m*A(r(k),r(k+1:n))
f. En línea 10 debería ser: A(k+1:n,k+1:n) -= m*A(k,k+1:n)
g. En línea 10 debería ser: A(r(k+1:n),k+1:n) -= m*A(r(k),k+1:n); #correcta
h. En línea 8 debería ser: m = A(k,r(k+1:n))/A(r(k),k);
i. En línea 9 debería ser: b(r(k+1:n)) = b(r(k+1:n)) + m*b(r(k));
j. En línea 9 debería ser: b(r(k+1:n)) = b(r(k+1:n)) - m*b(r(k)); #correcta
k. En línea 8 debería ser: m = A(r(k+1:n),k)/A(r(k),k); #correcta
l. En línea 5 debería ser: [~,p] = max(abs(A(r(k:n),k))); #correcta
m. En línea 9 debería ser: b(r(k+1:n)) = b(r(k+1:n)) - b(r(k))*m;
n. En línea 8 debería ser: m = A(r(k+1:n),k)/A(r(k),r(k));
o. En línea 5 debería ser: [~,p] = max(abs(A(r(k:n),r(k))));

-------------------
#El siguiente código resuelve un sistema de ecuaciones lineales por el método de eliminación de Gauss. De las opciones que corrigen el código
function[x] =eliminacionGauss(A,b)
n = length(A);
  r = 1:n;
  for k=1:n
    [~,p] = max(abs(A(r(k:n),k)));
    p = p + k - 1;
    r( [k,p] ) = r( [p,k] );
    m = A(r(k+1:n),k)/A(r(k),k);
    b(r(k+1:n)) = b(r(k+1:n)) - m*b(r(k));
    A(r(k+1:n),k+1:n) -= m*A(r(k),k+1:n);
  end
  x = sustitucionAtras(A,b,r);
endfunction

#RTA: El código no tiene errores

--------------------
#El siguiente código resuelve la factorización de Doolittle. De las opciones que corrigen el código
function[M,P] =Doolittle(A)
n = length(A);
r = 1:n;
for k=1:n
[~,p] = max(abs(A(r(k:n),k)));
p = p(1) + k - 1;
r( [k,p] ) = r( [p,k] );
A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
A(r(k+1:n),k+1:n) -= A(r(k+1:n),k)*A(r(k),k+1:n);
endfor
M = A(r,: );
P = eye(n,n)(r,: );
endfunction

#RTA: El código no tiene errores
--------------------
#El siguiente código resuelve la factorización de Doolittle. De las opciones que corrigen el código
function[M,P] =Doolittle(A)
n = length(A);
r = 1:n;
for k=1:n
[~,p] = max(abs(A(k:n,k)));
p = p(1) + k - 1;
r( [k,p] ) = r( [p,k] );
A(k:n,k) = A(k:n,k)/A(k,k);
A(k+1:n,k+1:n) -= A(k+1:n,k)*A(k,k+1:n);
endfor
M = A(r,: );
P = eye(n,n)(r,: );
endfunction

#RTAS CORRECTAS (verificar con el código de arriba):
#- En la línea 5 debería ser [~,p] = max(abs(A(r(k:n),k)));
#- En la línea 8 debería ser A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
#- En la línea 9 debería ser A(r(k+1:n),k+1:n) -= A(r(k+1:n),k)*A(r(k),k+1:n);

--------------------
#El siguiente código resuelve la factorización de Doolittle. De las opciones que corrigen el código
function[L, U, P]=Doolittle(U)
n = length(U);
L = zeros(n);
r = 1:n;
for k=1:n
[~,p] = max(abs(U(k:n,k)));
p = p(1) + k - 1;
r([k,p]) = r([p,k]);
L(r(k+1:n),k) = U(k+1:n,k) / U(k,k);
U(k:n,r(k+1:n)) -= L(r(k+1:n),k) * U(k:n,r(k));
end
U = U(r,: );
L = L(r,: ) + eye(n);
P = eye(n)(r,: );
endfunction

#RTAS:
#- En línea 6 debería ser [~,p] = max(abs(U(r(k:n),k)));
#- En línea 9 debería ser L(r(k+1:n),k) = U(r(k+1:n),k) / U(r(k),k);
#- En línea 10 debería ser U(r(k+1:n),k:n) -= L(r(k+1:n),k) * U(r(k),k:n);

--------------------

#Parcial 1 11/05/20 - Pregunta 3

f=@(x) sin(x) + cos(1+x.^2) -1
df=@(x) cos(x) -2*x*sen(1+x.^2)
[x,rh,it,t] = NewtonRaphson(f,df,1,2000,1e-6) #converge a la quinta raíz positiva
--------------------
#Parcial 1 09/05/22 - Pregunta 2

f=@(x) x + e^(-10*x^2)*cos(x)
[p, rh, it, t] = Biseccion(f, -10, 10, 3000, 10^-6)
p=-0.3264017
--------------------
#Parcial 1 09/05/22 - Pregunta 3

#-> Considere la función f(x) = sin(x) + cos(1+x^2) -1. Calcule con 10 dígitos correctos el valor de x más cercano a 8 para el cual f alcanza un máximo

#La estrategia es buscar la raíz de la primera derivada de la función,
#que corresponde al punto donde la función cambia de dirección de creciente a decreciente, es decir, un máximo.

f=@(x) sin(x)+cos(1+x^2)-1
df=@(x) cos(x) - 2*x*sin(1+x.^2)
x = linspace(0,10,100)
y=sin(x)+cos(1+x.^2)-1
plot(x,y) #vemos que f hace muchos "picos"
[p, rh, it, t] = Biseccion(df, 7.5, 8.5, 20000, 1e-6)

#Resultados:
p = 8.061403051018715
it = 26
f(p) = -1.021353227141431 #vemos que coincide con la gráfica
df(p) = 5.879999115943058e-07 #es muy cercano a 0, con lo cual es una raiz
--------------------

#Parcial 1 09/05/22 - Pregunta 5

A=[1 2 -2; 1 1 1; 2 2 1]
b=[7;2;5]
x0=b
tol=10^-8
[x,r_h,it,t] = GaussSeidel(A,b,x0,2000,tol) #Gauss Seidel no converge
[x, r_h ,it, t] = Jacobi(A, b, x0, 5000, tol) #Jacobi si converge
x = [1 2 -1] #con Jacobi
it = 2 #con Jacobi

#el parámetro ópimo de SOR es <0.5
#SOR si converge
--------------------
#Parcial 1 11/05/20 - Pregunta 1

A=[1/2 -1 0; -1 3 -1; 0 -1 2]
b=[7;4;5]
x0=b
tol=10^-8
[xGS,r_h,it,t] = GaussSeidel(A,b,x0,3000,tol)
x = [96; 41; 23] #por GS
it = 112 #por GS

w=1.450 #parametro de relajacion para SOR
x = [96; 41; 23] #por SOR
it = 27 #por SOR

[x, r_h ,it, t] = Jacobi(A, b, x0, 3000, tol)
x = [96; 41; 23] #por Jacobi
it = 228
--------------------

#Parcial 1 11/05/20 - Pregunta 2

f=@(x) x + e^(-10*x^2)*cos(x)
df=@(x) - e^(-10*x^2)*(sin(x) + 20*x*cos(x) - e^(-10*x^2))
[x,rh,it,t] = NewtonRaphson(f,df,0,2000,10^-6) #no converge

--------------------
#Parcial 1 04/05/23 - Pregunta 4

-> Considere la función f(x) = sin(x) + cos(1+x^2) -1.
-> Calcule con 10 dígitos correctos la raíz de f más cercana a 8

f=@(x) sin(x) + cos(1+x.^2) -1
[p,it,r,t] = Biseccion_Lucas(f,7.9,8,1000, 1e-10)
p = 7.962210642
--------------------
#Parcial 1 04/05/23 - Pregunta 4

Encuentre el valor positivo del parámetro a(con un error de 10−6) tal que la función
z(t)=0.04*sqrt(a+t)*(1−t)−t*sqrt(3a) posea un punto fijo en t=0.02
Ayuda: Se sabe que la gráfica de la función z(t) pasa cerca de w(t)=0.0419+t−−−−−√(1−t)−t57−−√
