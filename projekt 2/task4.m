% n = 10;
% syms f(x);
% f(x) = x+2;
% x = linspace(0, pi, n);
% y = f(x);

I = imread('redCar.png');

[x1,y1] = getPredefinedKnots('pointData/cursorinfo4.mat');
tau = 0.4;
%cond1 = 0.02*tau;
%cond2 = -0.09*tau;
cond1 = 1/5;
cond2 = -0.006;
T1 = tensionSplines(x1, y1, tau, cond1, cond2);
[x2,y2] = getPredefinedKnots('pointData/undercarriage.mat');
tau = 0.2;
cond1 = 0.02*tau;
cond2 = -0.09*tau;
T2 = tensionSplines(x2, y2, tau, cond1, cond2);


imshow(I);
hold on
% plot(x,ones(ns,1)*258 - y,'.')
% plot(x,y,'.')
for i = 1:length(x1)-1
%     fplot(@(t) 258-T1(i,t), [x1(i) x1(i+1)], 'b');
    fplot(@(t) T1(i,t), [x1(i) x1(i+1)], 'b');
end
for i = 1:length(x2)-1
%     fplot(@(t) 258-T2(i,t), [x2(i) x2(i+1)], 'b');
    fplot(@(t) T2(i,t), [x2(i) x2(i+1)], 'g');
end


daspect([1 1 1])
xlim([0 763])
ylim([0 258])

%T(i) = @(xs) (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);

