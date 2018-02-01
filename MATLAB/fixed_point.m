function [xc,n,err, res] = fixed_point(g, x0, epsilon, Nmax)
x(1) = x0;
x(2) = g(x0);
x(3) = g(x(2));
n = 2;
err = x(2) - x(1);
while n < Nmax && abs(err) > epsilon 
    n = n + 1;
    x(n)=g(x(n-1));
    g_zeta=(x(n)-x(n-1))/(x(n-1)-x(n-2));
    err = g_zeta^n * (x(n) - x0);
end
xc=x(n);
res = g(xc);