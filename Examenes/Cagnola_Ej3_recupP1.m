#Giuliana Cagnola

#Recuperatorio parcial 1

#Ejercicio 3
#--------------------
P=@(x) 230.*x.^4 + 18.*x.^3 + 9.*x.^2 -221.*x -9
x=linspace(-0.5,1.5,500);
plot(x,P(x),'r')
hold on
plot([min(x), max(x)], [0, 0], 'k--')

[p1,it1,r1,t1] = Biseccion(P, -0.5, 1.5, 1000, 1e-6);
[p2,it2,r2,t2] = Biseccion(P, -0.05, -0.03, 1000, 1e-6);
disp('raiz positiva de P(x)');
disp(p1);
disp('raiz negativa de P(x)');
disp(p2);

#verifico con la función roots de octave
coef=[230 18 9 -221 -9]
raices = roots(coef)

valmin = min(P(x));
disp('valor mínimo de P(x)');
disp(valmin);

dP=@(x) 4*230.*x.^3 + 3*18.*x.^2 + 2*9.*x -221
plot(x,dP(x),'y')
[p3,it3,r3,t3] = Biseccion(dP, 0.4, 0.8, 1000, 1e-6);
P(p3) #se verifica que P(p3) = valmin

#despejo x de P(x) para formar la ecuación x=g(x)
g=@(x) (230/221).*x.^4 + (18/21).*x.^3 + (9/221).*x.^2 + 9/221
[p,it,r,t] = PuntoFijo (g,-0.05,1e-6,10000);

#se vefica que g(p)=p





