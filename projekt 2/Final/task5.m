%Task 5
%Plots the spline of the function cos(x) which is sampled at 10 equally
%distant points
%We draw six splines with differet tension values and different end
%condition values.
figure
n = 10;
x = linspace(0, pi, n)
y = cos(x)
subplot(3,2,1);
tensionsplineplot(x,y,0,0,0);
title('tau = 0 end cond 0,0');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,2);
tensionsplineplot(x,y,0.3,2,-2);
title('tau = 0.3 end cond 2,-2');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,3);
tensionsplineplot(x,y,1,0,0);
title('tau = 1 end cond 0,0');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,4);
tensionsplineplot(x,y,100,1,-1);
title('tau = 100 end cond 1,-1');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,5);
tensionsplineplot(x,y,10,1,-1);
title('tau = 10 end cond 1, -1');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,6);
tensionsplineplot(x,y,0.3,0,0);
title('tau = 0.3 end cond 0, 0');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])