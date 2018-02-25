% n = 10;
% syms f(x);
% f(x) = x+2;
% x = linspace(0, pi, n);
% y = f(x);

I = imread('redCar.png');
[x,y] = getPredefinedKnots('pointData/cursorinfo3.mat')
n = length(x)
tau = 10;

h(1:n-1) = x(2:n) - x(1:n-1);
[alpha, beta, gamma] = getAlphaBetaGamma(tau,h,y, n);
A = getA(alpha, beta, n);
cond1 = 0.02*tau;
cond2 = -0.09*tau;
r = getR(gamma, n, cond1, cond2);
z =A\r;        % solve for z


T = @(i,xs) (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);


imshow(I);
hold on
% plot(x,ones(n,1)*258 - y,'.')
% plot(x,y,'.')
for i = 1:n-1
%     fplot(@(t) 258-T(i,t), [x(i) x(i+1)], 'b');
    fplot(@(t) T(i,t), [x(i) x(i+1)], 'b');
end

daspect([1 1 1])
xlim([0 763])
ylim([0 258])

%T(i) = @(xs) (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);

