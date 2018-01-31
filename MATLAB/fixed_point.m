function [xc,n] = fixed_point(g, x0, epsilon, Nmax)
x(1) = x0;
n = 1;
while n < Nmax && abs(x(n)-g(x(n))) > epsilon
    n = n + 1;
    x(n)=g(x(n-1));
end
xc=x(n);
%possible_err = 