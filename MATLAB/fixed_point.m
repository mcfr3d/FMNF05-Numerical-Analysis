% Fixed Point Method
%Computes approximate solution of g(x)=x
%Input: function handle g; initial guess x0,
%,tolerance epsilon and a stopping point for number of iterration Nmax
%Output: Approximate solution "xc", error estimate "error", residual "res"
%and number of completed iterrations n
function [xc,n,err, res] = fixed_point(g, x0, epsilon, Nmax)
x(1) = x0;  %inital values needed to be generated for err condition in while loop
x(2) = g(x0);
x(3) = g(x(2));
n = 2;
err = x(2) - x(1);
while n < Nmax && abs(err) > epsilon 
    n = n + 1;
    x(n)=g(x(n-1));
    g_zeta=(x(n)-x(n-1))/(x(n-1)-x(n-2)); %approximation of g'(z) where z is in the interval [x_n,x]
    err = g_zeta^n * (x(n) - x0);%error estimate
end
xc=x(n);
res = g(xc);