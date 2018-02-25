%Help function for calculation of tension spline coefficients
%Calculates coefficients Alpha, Beta and Gamma of the tension spline
%Input: y vectors of data points, tau which is the tension value
%Input: h which is vector with distnace betwen points, n which is number of
%points
%Output: matrix of coefficients alpha,beta,gamma
function [alpha,beta,gamma] = getAlphaBetaGamma(tau, h, y, n)

alpha = zeros(1,n-1); %create row vectors
beta = zeros(1,n-1);
gamma = zeros(1,n-1);
for i = 1:n-1 % fill the vectors with their value
    alpha(i) = (1/h(i)) - tau/sinh(tau*h(i));
    beta(i) = (tau*cosh(tau*h(i)))/sinh(tau*h(i)) - 1/h(i);
    gamma(i) = (tau^2*(y(i+1)-y(i)))/h(i);
end