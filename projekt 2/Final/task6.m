figure
I = imread('redCar.png');
I = rgb2gray(I); %Convert to bw
imshow(I);
brighten(.8);
hold on
[x,y] = getPredefinedKnots('../pointData/roof.mat');
tau=0.1;
[x1,y1] = tensionsplineplot(x,y,tau,0.1,-0.8);
% plot(x1,258*ones(length(y1),1) - y1,'b', 'linewidth', 2);
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
