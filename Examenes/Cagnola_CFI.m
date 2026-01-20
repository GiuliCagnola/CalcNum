#Giuliana Cagnola

#Recuperatorio CFI

#--------------------
#PVC
#{y''= 2x/(1-x^2)*y' -42/(1-x^2)
#y(-1)=1
#y(1)=1


p=@(x) (2.*x)./(1-x.^2);
q=@(x) (-42)./(1-x.^2);
r=@(x) 0.*x;

f=@(x) [p(x)     q(x)     r(x)]
yc=[1 1];
a=-1;
b=1;
L=100*2*2*2*2*2*2*2*2; #esto es para ir aumentando la cantidad de subintervalos

#ir duplicando el L hasta obtener los decimales exactos
[x y] = DiferenciasFinitasDirichlet(f, a, b, yc, L);
#[x y] = dif_fin_dir(f, [a b], yc, L);
plot(x, y) #graficamente vemos que está cerca de -0,312
hold on
plot([min(x), max(x)], [0, 0], 'k--')

y0=y(L/2);
disp('valor de y en x=0');
disp('y0');

#--------------------
[coef, A, b] = MinimosCuadrados(x, y, 6);
##coef =
##
##   1.443749862379807e+01
##  -1.064712117008244e-11
##  -1.968749784291692e+01
##   9.434597177431572e-12
##   6.562499174125771e+00
##  -7.661211697258931e-13
##  -3.124999549466401e-01

a0=coef(7)
a1=coef(6)
a2=coef(5)
a3=coef(4)
a4=coef(3)
a5=coef(2)
a6=coef(1)

poly=@(x) a6.*x.^6 + a5.*x.^5 + a4.*x.^4 + a3.*x.^3 + a2.*x.^2 + a1.*x + a0
figure(2)
xx=linspace(-1,1,10000);
plot(xx, poly(xx))

#--------------------
#Raíz menor
[p1,it1,r1,t1] = Biseccion(poly, 0.2, 0.26, 5000, 1e-8);
#Raíz del medio
[p2,it2,r2,t2] = Biseccion(poly, 0.64, 0.7, 5000, 1e-8);
#Raíz mayor
[p3,it3,r3,t3] = Biseccion(poly, 0.9, 0.94, 5000, 1e-8);
disp('raiz menor');
disp(p1);
disp('raiz del medio');
disp(p2);
disp('raiz mayor');
disp(p3);



