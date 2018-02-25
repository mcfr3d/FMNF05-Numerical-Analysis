figure
I = imread('redCar.png');
imshow(I);
hold on
title('Task 1');
[x,y] = getPredefinedKnots('../pointData/roof.mat');
xq = [min(x):max(x)];
s = spline(x,y,xq);
plot(x,y,'o', xq, s);