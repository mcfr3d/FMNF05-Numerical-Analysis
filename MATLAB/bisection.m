function [c,error,res,n] = bisection(f,a,b,epsilon,Nmax)
% function f
% endpoints a, b
% convergence tolerance epsilon
% maximum number of iterations Nmax
% solution c
% possible error
% residual res
n = 0; % number of iterations
while (b-a)/2>epsilon && n<Nmax
    n = n + 1;
    c = (a+b)/2; % midpoint
    if f(c) == 0
        break;
    elseif f(c)*f(a)>0
        a=c;
    elseif f(c)*f(b)>0
        b=c;
    else fprintf('%s','Error!')
        break;
    end
end
error = (b-a)/2;
res = f(c);

