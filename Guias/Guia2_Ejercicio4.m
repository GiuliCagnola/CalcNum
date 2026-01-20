#Guía 2 - Ejercicio 4

#Sustitución hacia atrás
A = [1 -1 2 -1; 0 2 -1 1; 0 0 -1 -1; 0 0 0 2]
b=[8; 6; -4; 4]
x1 = Sust_Atras(A,b) #x1 = [9 3 2 2]

#Sustitución hacia adelante
B = A.' #transpuesta de A
x2 = SustitucionAdelante(B,b) #x2 = [8 7 13 9]

Realice el conteo analítico de operaciones involucradas tanto en la sustitución hacia adelante
como en la sustitución hacia atrás y responda cuál es la complejidad de los algoritmos.

- suma y resta: n^2 operaciones
- multiplicación y división: n^2/2 operaciones
#Cuanto menor sea la complejidad de un algoritmo, más eficiente será para tamaños de entrada grandes

