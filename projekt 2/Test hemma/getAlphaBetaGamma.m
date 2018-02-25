function [alpha,beta,gamma] = getAlphaBetaGamma(tau, h, y, n)

alpha = zeros(1,n-1);
beta = zeros(1,n-1);
gamma = zeros(1,n-1);
for i = 1:n-1
    alpha(i) = (1/h(i)) - tau/sinh(tau*h(i));
    beta(i) = (tau*cosh(tau*h(i)))/sinh(tau*h(i)) - 1/h(i);
    gamma(i) = (tau^2*(y(i+1)-y(i)))/h(i);
end