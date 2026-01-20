#Guía 3 - Ejercicio 4
#--------------------
##¿Podría indicar si el método de SOR va a converger para el siguiente sistema lineal?
##¿Qué valores debería adoptar el parámetro de relajación? Si concluye que SOR converge, aplíquelo
##y estime numéricamente el valor óptimo del parámetro ω. Luego resuélvalo con el método de
##Gauss Seidel, compare con los resultados de SOR y saque conclusiones.
##¿Cuál es la relación entre los dos métodos?
#--------------------
A=[10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5]
b=[6;25;-11;-11]
x0=[0;0;0;0]

#Resolucion por metodo SOR
w = Woptimo(A, b, x0, 10000, 1e-6) #si w está entre 0 y 2 entonces converge para el método
[L D U]=DescomponerMatriz(A);
resp_SOR = max(abs(eig(inv(D+w*L)*((1-w)*D-w*U)))) #si resp_SOR <1 entonces converge para el método
[xSOR,r_hSOR,itSOR,tSOR] = SOR(A,b,x0,10000,1e-6,w);


#Resolucion por metodo Gauss Seidel
resp_GS = max(abs(eig(-inv(D+L)*U)))
[xGS,r_hGS,itGS,tGS] = GaussSeidel(A,b,x0,10000,1e-6);

#Los métodos SOR y GS tienen una coincidencia de 6 cifras significativas,
#provenientes de la tolerancia propuesta



xOct=A\b


