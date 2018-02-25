%Tension spline plot
%Computes and plots tension spline from data points
%Input: x,y vectors of data points
%Output: x1, y1 spline values at plotted points
function [x1,y1]=tensionsplineplot(x,y,tau,cond1,cond2)
 if ~exist('cond1','var')
     % third parameter does not exist, so default it to something
      cond1 = 0;
 end
  if ~exist('cond2','var')
     % third parameter does not exist, so default it to something
      cond2 = 0;
 end
k= 1000; %number k of plotted points per segment
n=length(x);
z=tensionsplinecoeff(x,y,tau,cond1,cond2);
x1=[]; y1=[];
for i=1:n-1
xs=linspace(x(i),x(i+1),k+1);
h=x(i+1)-x(i);
dx=xs-x(i);
dx2=x(i+1)-xs;
ys=z(i).*sinh(tau.*dx2); % evaluate parts of the equation each line so its easier to read
ys=ys+z(i+1).*sinh(tau.*dx);
ys=ys./(tau^2.*sinh(tau.*h));
ys=ys+((((y(i)-z(i)/(tau^2)).*dx2)+((y(i+1)-z(i+1)/(tau^2)).*dx))/h);
x1=[x1; xs(1:k)']; y1=[y1;ys(1:k)'];
end
x1=[x1; x(end)];y1=[y1;y(end)];
plot(x,y,'o',x1,y1)


%ys=z(i)*sinh(tau*dx2); % evaluate using nested multiplication
%ys=ys+z(i+1).*sinh(tau*dx);
%ys=ys./(tau^2*sinh(tau*h));
%ys=ys+((y(i)-z(i)/(tau^2))*dx2+(y(i+1)-z(i+1)/(tau^2))*dx)/h;
%ys=(z(i)*sinh(tau*(x(i+1)-xs)) + z(i+1)*sinh(tau*(xs-x(i))))/(tau^2*sinh(tau*h)) + ((y(i)-z(i)/(tau^2))*(x(i+1)-xs)+(y(i+1)-z(i+1)/(tau^2))*(xs-x(i)))/h;