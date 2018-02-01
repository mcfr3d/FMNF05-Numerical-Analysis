% Fixed Point Method
%Computes approximate solution of f(x)=0
%Input: function handle "f"; function handle for diff f "df",initial guessx0,
%,tolerance epsilon and a stopping point for number of iterration Nmax
%Output: Approximate solution "xc", residual "residueal"
%and number of completed iterrations n
function [xc, residual,n] = newton(f,df,x0, epsilon, Nmax)
x(1) = x0;
n = 1;
residual = epsilon+1;
while abs(residual) > epsilon && n < Nmax %using residual as error estimate
    x(n+1)= x(n)-f(x(n))/df(x(n));
    n = n + 1;
    residual = f(x(n));
end
xc=x(n);