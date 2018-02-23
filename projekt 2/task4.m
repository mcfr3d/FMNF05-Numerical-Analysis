tau = 1;
n = 10;
syms f(x);
f(x) = cos(x);
x = linspace(0, pi, n);
y = f(x);
subplot(2,1,1);
plot(x,y);
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])


h(1:n-1) = x(2:n) - x(1:n-1);
[alpha, beta, gamma] = getAlphaBetaGamma(tau,h,y, n);
A = getA(alpha, beta, n)
cond1 = 0;
cond2 = 0;
r = getR(gamma, n, cond1, cond2)
z =A\r        % solve for z


%T(x) = (z(i)*sinh(tau*(x(i+1)-x)) +
%z(i+1)*sinh(tau*(x-x(i))))/(tau^2*sinh(tau*h(i))) + 
%((y(i)-z(i)/(tau^2))(x(i+1)-x)+(y(i+1)-z(i+1)/(tau^2))(x-x(i)))/h(i)


T = @(i,xs) (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);
xs = zeros(10,n-1);
subplot(2,1,2)
hold on
plot(x,y,'.')
for i = 1:n-1
    xs(:,i) = linspace(x(i),x(i+1),10);
    plot(xs(:,i),T(i,xs(:,i)))
end

daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])

%T(i) = @(xs) (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);

