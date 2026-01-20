#GUIA 5 - Ejercicio 3
#-------------------
## a) Encuentre el polinomio de interpolación de Newton para los siguientes datos utilizando diferencias divididas
##x = 0 1 3/2 2
##y = 3 3 13/4 5/3

#-------------------
x = [0 1 3/2 2];
y = [3 3 13/4 5/3];
[c] = DiferenciasDivididasVec(x,y)
