#Guía 6 - Ejercicio 7
#-------------------
x=[0:200:1200];
n=length(x);
rho=[4 3.95 3.89 3.80 3.60 3.41 3.30];
Ac=[100 103 106 110 120 133 149.6];
rhoKg=rho/1000;
I=rhoKg.*Ac;

#Cálculo con simpson
[W_S] = SimpsonCompuestoDatos(x,I)

#Cálculo con lagrange
[PL, L] = Lagrange(x,I);
plag=@(x) polyval(PL, x)

W_Spol = SimpsonCompuesto(plag,x(1),x(n),n-1)
#Error relativo
ErrorSimpson=abs(W_Spol - W_S)/W_Spol

#Cálculo con Trapezoidal
I_T = TrapezoidalCompuestaDatos(x,I)

#Cálculo con Octave
Woct=trapz(x, I)

ErrorTrap=abs(Woct-I_T)
