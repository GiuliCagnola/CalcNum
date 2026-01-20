#GUIA 5 - Ejercicio 5
#-------------------
##Un trazador cúbico natural S(x) en [0, 2] está definido por
##S(x) = {S0(x) = 1 + 2x − x^3, si 0 ≤ x < 1
##       {S1(x) = 2 + b(x − 1) + c(x − 1)^2 + d(x − 1)^3, si 1 ≤ x ≤ 2
##Obtenga b, c y d
#-------------------
##Para obtener los coeficientes b, c y d del trazador cúbico natural S(x)
##es necesario encontrar las condiciones de continuidad y suavidad en el punto de empalme x = 1

#Establecer las condiciones de continuidad de la función en x=1
#S0(1) = S1(1)
# 2 = 2

#Establecer las condiciones de continuida de la derivada 1era en x=1
#S0'(x) = 2-3x^2 -> S0'(1)=-1
#S1'(x) = b + 2c*(x-1) + 3d*(x-1)^2 -> S1'(1)=b
#Por lo tanto, b=-1

#Establecer las condiciones de continuida de la derivada 2da en x=1
#S0''(x) = -6x -> S0''(1)=-6
#S1''(x) = 2c + 6d(x-1) -> S1'')1)=2c
#Por lo tanto, c=-3

#Busco el valor de d conociendo b y c y sabiendo que S1(1)=2





x=[0 1 2] #el intervalo para x
y=[1 2 2] #los valores que toma S
[a,b,c,d]= SplineCubicoNatural(x,y)

S0=@(x) 1+2.*x - x.^3
x0=linspace(0,1,100);
x1=linspace(1,2,100);

plot(x0, S0(x))
hold on

