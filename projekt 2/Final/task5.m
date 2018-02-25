%Task 5
figure
n = 10;
x = linspace(0, pi, n)
y = cos(x)
subplot(3,2,1);
tensionsplineplot(x,y,0);
title('tau = 0');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,2);
tensionsplineplot(x,y,0.3);
title('tau = 0.3');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,3);
tensionsplineplot(x,y,1);
title('tau = 1');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,4);
tensionsplineplot(x,y,3);
title('tau = 3');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])
subplot(3,2,5);
tensionsplineplot(x,y,10);
title('tau = 10');
daspect([1 1 1])
xlim([0 pi])
ylim([-1 1])