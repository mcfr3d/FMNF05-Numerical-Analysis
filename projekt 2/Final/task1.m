figure
I = imread('redCar.png');
imshow(I);
hold on
title('Task 1');
[x,y] = getKnots(I,40);
xq = [min(x):max(x)];
s = spline(x,y,xq);
plot(x,ones(length(y),1)*258 - y,'o', xq, ones(1,length(s))*258 - s);