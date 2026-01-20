function [x,t] = gauss(A,b)
tic();
n=length(b);
x=b*0;
for i=1:1:n
m=A(i+1:n,i)/A(i,i);
A(i+1:n,i:n)=A(i+1:n,i:n)-m*A(i,i:n);
b(i+1:n)=b(i+1:n)-m*b(i);
endfor
[x]=Sust_Atras(A,b);
t = toc();
endfunction


