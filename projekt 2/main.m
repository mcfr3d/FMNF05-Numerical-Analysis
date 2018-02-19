clear;
[x,y] = getKnots('redCar.png',20);
%plot(x,y,'*')
my_test();

xq = [min(x):max(x)];
s = spline(x,y,xq);
subplot(4,1,2);
plot(x,y);
my_test();
subplot(4,1,3);
plot(x,y,xq,s);
my_test();
subplot(4,1,4);
plot(xq,s);
my_test();

%pp = spline(x,y);
%yy = ppval(pp, linspace(0,763,96));
%plot(yy(1,:),yy(2,:),'-b',y(1,2:5),y(2,2:5),'or'), axis equal