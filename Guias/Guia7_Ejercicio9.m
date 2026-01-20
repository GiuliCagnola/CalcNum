#GUIA 7 - Ejercicio 9
#-------------------
#Considere PVI de orden 3
#{y''' + 4y'' + 5y' + 2y = −4sen(t) − 2cos(t)
#{y(0)=1
#{y'(0)=0
#y´´(0)=-1

#Reescriba el problema como un sistema de EDO de primer orden, con sus respectivos valores iniciales.
#Grafique la solución y obtenga el valor de la variable y en t = 2.5, con 6 dígitos exactos.
#Indique cuántas veces se anula la función y' en el intervalo [0, 15].

t=0:0.25:25;
y0=[1; 0 ;-1] #condiciones iniciales
f=@(t,y) [y(2);    y(3);    4*y(3) + 5*y(2) + 2*y(1) + 4*sin(t) + 2*cos(t)]
#          eq1  // eq2 //           eq3

##y'=z1
##z'=y''-> z'=u
##z''=y'''-> u'=z''

#y=[y1; y2; y3]

[tRK4m, yRK4m] = RungeKuttaMultipaso(f,0,15,y0, 300);
y25 = yRK4m(1,end) #valor de y al tiempo t=2.5



