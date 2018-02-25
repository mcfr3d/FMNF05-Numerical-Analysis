%Code for task 1
%Uses Matlabs spline function to generate a splie from our points
%it prints the spline over the care to show how it traces the edge
figure
I = imread('redCar.png');
imshow(I);
hold on
title('Task 1');
[x,y] = getPredefinedKnots('../pointData/roof.mat');
xq = [min(x):max(x)];
s = spline(x,y,xq);
plot(x,y,'o', xq, s);