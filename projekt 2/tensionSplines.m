function T = tensionSplines(x, y, tau, cond1, cond2)
n = length(x);

h(1:n-1) = x(2:n) - x(1:n-1);
[alpha, beta, gamma] = getAlphaBetaGamma(tau,h,y, n);
A = getA(alpha, beta, n);
r = getR(gamma, n, tau, cond1, cond2);
z =A\r;        % solve for z
T = @(i,xs) (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);