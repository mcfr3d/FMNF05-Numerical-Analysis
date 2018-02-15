% Bisection Method
%Computes approximate solution of f(x)=0
%Input: function handle f; a,b such that f(a)*f(b)<0,
%,tolerance epsilon and a stopping point for number of iterration Nmax
%Output: Approximate solution "c", error estimate "error", residual "res"
%and number of completed itterations n.
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
    if f(c) == 0 %c is a solution, done
        break;
    elseif f(c)*f(a)>0
        a=c;%c and b make the new interval
    elseif f(c)*f(b)>0
        b=c;%a and c make the new interval
    else fprintf('%s','Error!')
        break;
    end
end
error = (b-a)/2;
res = f(c);

