#GUIA 7 - Ejercicio 8
#-------------------
#Modelo predador-presa
#Consideremos el modelo
#{x1'(t) = x1*(3 − 0.002*x2)
#{x2'(t) = −x2*(0.5 − 0.0006*x1)

#Calcule numéricamente una solución donde la población inicial de la presa es 1600 y la depredadores es 800,
#considerando el tiempo t en meses. Dibujar la solución, graficando ambas poblaciones con el tiempo,
#y describir el fenómeno representado (utilice un m´etodo que usted considere apropiado, y un intervalo de tiempo que sea representativo de lo que sucede).
#-------------------

##Anulo una de las variables:
##Si x1=0:
##x1'=0
##x2'=-0.5
##por lo tanto, x2 es predador y x1 es presa
##los predadores se extinguen si las presas no existen
##ambas funciones varian en el tiempo, por lo tanto la variación es oscilatoria
##graficar el predador x2 en función de la presa x1
##que pasa cuando se estaciona? hay tanta cantidad de presas y tanta de predadores (ambas constantes).
##Analizar que pasa en ese caso
##el punto de balance se da cuando las velocidades de crecimiento son nulas, es decir, se anulan las derivadas
#--------------------

#x representa al conjunto de predadores y presas

x0=[1600; 800]; # condicion inicial
F= @(t,x) [x(1)*(3-0.002*x(2)); -x(2)*(0.5 - 0.006*x(1))]
[t, y] = RungeKutta4_PVI (f, 0,24, x0, 1000);

x1=x(:,1); % presas
x2=x(:,2); % predadores

figure(1)
% Presas
plot(t,x1,'r-')
hold on
% Predadores
plot(t,x2,'b-')
grid on
grid minor
title('Evolución de las especies')
xlabel('Tiempo (Meses desde el momento inicial)')
ylabel('Cantidad de individuos')
legend('Presa=x1', 'Predador=x2')
hold off

% Curva parametrica de predador-presa
figure(2)
% diagramas de plano de fase
plot(x1,x2,'k-')
grid on
grid minor;
title('Orbita de la solución del sistema predador-presa')
xlabel('Presas (en miles)')
ylabel('Predadores (en miles)')

hold on
plot(x0(1),x0(2),'ko')
% calculo del punto de equilibrio en estado estacionario
% donde no hay crecimiento ni de presas ni de predadores
a=3;b=0.002; c=0.5; d=0.0006;
e1=a/b; e2=c/d;
plot(e1,e2,'g*')
legend('Eje X: Presas; Eje Y:Predadores', 'Cant.Inicial','Estado estacionario')


