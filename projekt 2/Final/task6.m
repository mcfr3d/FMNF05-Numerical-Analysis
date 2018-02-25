%Task 6
%Draws the splines for all the different sections of the car
%We use a total of 4 different splines for all the different sections
%The splines use the different Tau values and different end conditions.
figure
I = imread('redCar.png');
I = rgb2gray(I); %Convert to greyscale
imshow(I);
brighten(.8);
hold on
[x,y] = getPredefinedKnots('../pointData/roof.mat');
tau=0.1;
[x1,y1] = tensionsplineplot(x,y,tau,0.1,-0.8);
plot(x1,y1,'b', 'linewidth', 2);
[x,y] = getPredefinedKnots('../pointData/undercarriage.mat');
tau=1;
[x1,y1] = tensionsplineplot(x,y,tau,-1,0.6);
plot(x1,y1,'b', 'linewidth', 2);
[x,y] = getPredefinedKnots('../pointData/window_top.mat');
tau=.5;
[x1,y1] = tensionsplineplot(x,y,tau,.5,-1);
plot(x1,y1,'b', 'linewidth', 2);
[x,y] = getPredefinedKnots('../pointData/window_bottom.mat');
tau=.5;
[x1,y1] = tensionsplineplot(x,y,tau,-0.5,-0.1);
plot(x1,y1,'b', 'linewidth', 2);
setRatios('Task 6 + Optional')
