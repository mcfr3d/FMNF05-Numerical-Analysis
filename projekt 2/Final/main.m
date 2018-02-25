%x=[0 1 2 3 4 5];
%y=[3 1 4 1 2 0];
%tau=1;
%tensionsplineplot(x,y,tau);
%hold on
%tau=1;
%tensionsplineplot(x,y,tau);


%Task 5
figure
n = 10;
x = linspace(0, pi, n);
y = cos(x);
subplot(3,2,1);
tensionsplineplot(x,y,0);
daspect([1 1 1])
xlim([0 pi])
ylim([-1.2 1.2])
subplot(3,2,2);
tensionsplineplot(x,y,0.3);
daspect([1 1 1])
xlim([0 pi])
ylim([-1.2 1.2])
subplot(3,2,3);
tensionsplineplot(x,y,1);
daspect([1 1 1])
xlim([0 pi])
ylim([-1.2 1.2])
subplot(3,2,4);
tensionsplineplot(x,y,3);
daspect([1 1 1])
xlim([0 pi])
ylim([-1.2 1.2])
subplot(3,2,5);
tensionsplineplot(x,y,10);
daspect([1 1 1])
xlim([0 pi])
ylim([-1.2 1.2])


figure
I = imread('redCar.png');
[x,y] = getPredefinedKnots('pointData/cursorinfo3.mat');
tau=0.1;
tensionsplineplot(x,y,tau,111,10);
setRatios('plot')
