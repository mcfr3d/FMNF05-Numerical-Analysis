% n = 10;
% syms f(x);
% f(x) = x+2;
% x = linspace(0, pi, n);
% y = f(x);

I = imread('redCar.png');

[x1,y1] = getPredefinedKnots('pointData/roof.mat');
tau = 0.2;
cond1 = 1/5;
cond2 = -1/2;
T1 = tensionSplines(x1, y1, tau, cond1, cond2);
[x2,y2] = getPredefinedKnots('pointData/undercarriage.mat');
tau = 0.4;
cond1 = -1;
cond2 = 1;
T2 = tensionSplines(x2, y2, tau, cond1, cond2);
[x3,y3] = getPredefinedKnots('pointData/window_top.mat');
tau = 0.2;
cond1 = 1;
cond2 = -1;
T3 = tensionSplines(x3, y3, tau, cond1, cond2);
[x4,y4] = getPredefinedKnots('pointData/window_bottom.mat');
tau = 0.2;
cond1 = -1;
cond2 = 0;
T4 = tensionSplines(x4, y4, tau, cond1, cond2);


% imshow(I);
hold on
for i = 1:length(x1)-1
    fplot(@(t) T1(i,t), [x1(i) x1(i+1)], 'b');
end
for i = 1:length(x2)-1
    fplot(@(t) T2(i,t), [x2(i) x2(i+1)], 'b');
end
for i =1:length(x3)-1
    fplot(@(t) T3(i,t), [x3(i) x3(i+1)], 'g');
end
for i =1:length(x4)-1
    fplot(@(t) T4(i,t), [x4(i) x4(i+1)], 'g');
end


daspect([1 1 1])
xlim([0 763])
ylim([0 258])

%T(i) = @(xs) (z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h(i))) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h(i);

