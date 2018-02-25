%x=[0 1 2 3 4 5];
%y=[3 1 4 1 2 0];
%tau=1;
%tensionsplineplot(x,y,tau);
%hold on
%tau=1;
%tensionsplineplot(x,y,tau);

I = imread('redCar.png');
[x,y] = getPredefinedKnots('pointData/cursorinfo3.mat');
tau=0.1;
tensionsplineplot(x,y,tau);
setRatios('plot')