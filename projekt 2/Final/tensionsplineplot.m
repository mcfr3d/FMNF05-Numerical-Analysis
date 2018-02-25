%Tension spline plot
%Computes and plots tension spline from data points
%Input: x,y vectors of data points
%Input: Tau value which is the tension value
%Input: optioal input of end condition values cond1 and cond2
%will be set to default 0,0 otherwise
%Output: x1, y1 spline values at plotted points
function [x1,y1]=tensionsplineplot(x,y,tau,cond1,cond2)
 if ~exist('cond1','var')
     % fourth parameter does not exist, so default it to 0
      cond1 = 0;
 end
  if ~exist('cond2','var')
     % fifth parameter does not exist, so default it to 0
      cond2 = 0;
 end
k= 100; %number k of plotted points per segment
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
plot(x1,y1,'b');
