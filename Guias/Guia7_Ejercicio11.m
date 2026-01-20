#GUIA 7 - Ejercicio 11
#-------------------
#Utilice el m´etodo predictor-corrector de Adams para resolver el PVI
#{t^2*y'' − 2t*y' + 2y = t^3*ln(t), 1<= t <= 2
#{y(1) = 1
#{y'(1) = 0
#cuya solución exacta es y(t) = (7/4)t + (1/2)t^3*ln(t) − (3/4)t^3
#Considere el método de RungeKutta de cuarto orden para calcular la solución en los pasos 1, 2 y 3 (el 0 es la condición inicial)
#requeridos por el predictor. Resuelva el problema para los pasos h = 0.2, h = 0.1 y h = 0.05.
#Presente una tabla con los errores máximos obtenidos para cada ecuación y saque conclusiones.
#-------------------

#Planteo del modelo:
#t^2*y'' − 2t*y' + 2y = t^3*ln(t)
#y = y1
#y' = y1' = y2
#y'' = y1'' = y2' = (2/t)*y2 - (2/t^2)*y1 + t*log(t)

f=@(t, y) [y(2, 1);   (2./t).*y(2, 1) - (2./t.^2).*y(1, 1) + t.*log(t)]
y0=[1;0]; #condiciones iniciales

#h=0.2 -> L=5
[tRK4, yRK4] = RungeKutta4(f, 1, 2, y0, 5);
yRK4_1 = yRK4(1)
yRK4_2 = yRK4(2)
yRK4_3 = yRK4(3)

t=1:0.2:2;
yPC = AdamsBashfortMoulton(f,t,y0);

y_exaxta=@(t) (7/4).*t + (1/2).*(t.^3).*log(t) - (3/4).*t.^3
figure(1)
plot(t,yPC(1,:),'r-o')
hold on
plot(t,yRK4(:,1),'b-o')
plot(t,y_exaxta(t),'g-*-')

error = abs (y_exaxta(t) - yPC(1,:))
figure(2)
semilogy(t,Error,'b-*')


