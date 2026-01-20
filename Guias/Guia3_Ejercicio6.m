#Guía 3 - Ejercicio 6
#--------------------
##Resuelva los siguientes sistemas lineales con el método de Gauss-Seidel y analice lo que sucede en cada caso.
##Luego intente resolverlos mediante el método directo de eliminación de Gauss.
##Es necesario aplicar alguna estrategia de pivoteo? Si lo fuera, justifique por qué

##{3x + y + z = 5
##{x + 3y − z = 3
##{3x + y − 5z = −1
##
##{3x + y + z = 5
##{3x + y − 5z = −1
##{x + 3y − z = 3
#--------------------

A1=[3 1 1; 1 3 -1; 3 1 -5]
detA1=det(A1)
b1=[5; 3; -1]
[L1 D1 U1]=DescomponerMatriz(A1);
resp_GS_1 = max(abs(eig(-inv(D1+L1)*U1)))


A2=[3 1 1; 3 1 -5; 1 3 -1]
detA2=det(A2)
b2=[5; -1; 3]
[L2 D2 U2]=DescomponerMatriz(A2);
resp_GS_2 = max(abs(eig(-inv(D2+L2)*U2)))

x0=[0;0;0]

[x1,r_h1,it1,t1] = GaussSeidel(A1,b1,x0,2000,1e-6);
[x2,r_h2,it2,t2] = GaussSeidel(A2,b2,x0,2000,1e-6);

#En el caso de la matriz A2 el radio espectral es >1,
#Por lo tanto no converge por GS

[x1,t1] = gauss(A1,b1)
[x2,t2] = gauss(A2,b2)

#verificamos mediante la solución de octave
x1_oct=A1\b1
x2_oct=A2\b2


