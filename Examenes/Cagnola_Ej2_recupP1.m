#Giuliana Cagnola

#Recuperatorio parcial 1

#Ejercicio 2
#--------------------
#1) Armo la matriz
n=40;
A=zeros(n,n);
for i=1:n
  for j=1:n
    if j==i
      A(i,j)=2*i;
    endif
    if j==i+1  || j==i-1
      A(i,j)=-1;
    endif
  endfor
endfor

b=zeros(n,1);
for i=1:n
  b(i) = 1.5.*i - 6;
endfor

#2) Resuelvo por método directo
[x,t] = gauss(A,b)
x1=x(1)

#3) Resuelvo por métodos iterativos

#Verificar convergencia mediante el radio espectral
[L D U]=DescomponerMatriz(A);
resp_J = max(abs(eig(-inv(D)*(L+U))))
resp_GS = max(abs(eig(-inv(D+L)*U)))
w=1.1;
resp_SOR = max(abs(eig(inv(D+w*L)*((1-w)*D-w*U))))

##resp_J = 0.415830577315624
##resp_GS = 0.1729150690306448
##resp_SOR = 0.1000000000000004

#Como todos los radios espectrales asociados a la matriz de iteración
#son <1, entonces los métodos convergen

x0=zeros(40,1);
[xJ, rhJ ,itJ, tJ] = Jacobi(A, b, x0, 5000, 10^-5);
disp('iteraciones por Jacobi');
disp(itJ);
[xGS,rhGS,itGS,tGS] = GaussSeidel(A,b,x0,5000,10^-5);
disp('iteraciones por Gauss Seidel');
disp(itGS);
[xSOR,itSOR,rSOR,tSOR] = SOR(A, b, x0, 5000, 10^-5, 1.1);
disp('iteraciones por SOR');
disp(itSOR);


#4) w óptimo para SOR
issymmetric(A)
all(eig(A)>0)
#Como A es simétrica y definida positiva podemos usar la fórmula para el cálculo de w
w = 2/(1+sqrt(1-resp_J^2));
disp('Valor de w óptimo para SOR')
disp(w);

