tau = 1;
n = 6;
syms f(x);
f(x) = cos(x);
x = linspace(0, pi, n+1);
y = f(x);



h(1:n-1) = x(2:n) - x(1:n-1);
[alpha, beta, gamma] = getAlphaBetaGamma(tau,h,y, n);
A = getA(alpha, beta, n)
r = getR(gamma, n, -1, 1)
z =A\r        % solve for z coefficients



%T(x) = (z(i)*sinh(tau*(x(i+1)-x)) +
%z(i+1)*sinh(tau*(x-x(i))))/(tau^2*sinh(tau*h(i))) + 
%((y(i)-z(i)/(tau^2))(x(i+1)-x)+(y(i+1)-z(i+1)/(tau^2))(x-x(i)))/h(i)

T = zeros(1,n-1);

for i = 1:n-1
    syms Ts(xs);
    Ts(xs) = (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);
    T(i) = @Ts;
end

T