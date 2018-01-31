function [xc, residual,n] = newton(f,df,x0, epsilon, Nmax)
x(1) = x0;
n = 1;
residual = epsilon+1;
while abs(residual) > epsilon && n < Nmax
    x(n+1)= x(n)-f(x(n))/df(x(n));
    n = n + 1;
    residual = f(x(n));
end
xc=x(n);