clear;

layout = [2,2];

I = imread('redCar.png');
%[x,y] = getKnots(I,60);
[x,y] = getPredefinedKnots('pointData/cursorinfo.mat');
figure % New figure window
subplot(layout(1),layout(2),1);
imshow(I);
my_test('Original image');
xq = [min(x):max(x)];
s = spline(x,y,xq);
subplot(layout(1),layout(2),2);
plot(x,y,'*');
my_test('Knots');
subplot(layout(1),layout(2),3);
plot(x,y,'*',xq,s);
my_test('Knots and interpolated curve');
subplot(layout(1),layout(2),4);
plot(xq,s);
my_test('Interpolated curve');

%pp = spline(x,y);
%yy = ppval(pp, linspace(0,763,96));
%plot(yy(1,:),yy(2,:),'-b',y(1,2:5),y(2,2:5),'or'), axis equal