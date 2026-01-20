#GIULIANA CAGNOLA

#Pregunta 3

[M,c,u0] = CrearSistema_P1(40) #Sistema Mu=c
[x,r_h,it,t] = GaussSeidel(M,c,u0,2000,1e-6)#criterio de convergencia norma infinito
it=1906
Tmedia=mean(x) #calcula el promedio de los valores de x
Tmedia= 9.062389691477934


#correcciones
si se subdivide el intervalo en 41 puntos equidistantes entonces
 X0=0 ->j0
 X1=1 ->j40
 x=linspace(0,1,41) armar una recta con dos puntos sucesivos para sacar h
 rtas correctas: 1762 iteraciones y 6.979986 temp en el punto medio T(20)
 la matriz queda de 39x39


 vector de cargas:
 x=linspace(0,1,41)
 h=x(2)-x(1)
 b=zeros(n,1)
 for i=1:n
   b(i)=(h^2)*20.*exp(-10.*(x(i+1)-0.7.^2)
 endfor
 b(1)=b1+5
 b(n)=b(n)+6
