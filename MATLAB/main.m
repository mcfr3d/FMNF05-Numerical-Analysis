f = @(k) -7-1/(2*k) + (10 + 1/(2*k))*exp(-k);
%The average dT/dt between t=0 and t=1 is -2.5
a = 1/4;
%Value for which dT(0)/dt = -2,5
b = 5/14;
%Value for which dT(1)/dt = -2.5
epsilon = 1e-3;
%We need accuracy of two decimals
Nmax = 10;
%Seems resonable

[k_b,possible_err,res] = bisection(f,a,b,epsilon,Nmax);

%Now fixed point iteration
g = @(k) (2*k*(10 + 1/(2*k))*exp(-k)-1)/14;
k0 = 0.3;
epsilon = 1e-24;
Nmax = 100;
k_fpi = fixed_point(g,k0,epsilon,Nmax);

k_b
k_fpi

T = @(t,k) 22+0.5*t-1/(2*k)+(10 + 1/(2*k))*exp(-k*t);

T(-1.35,k_fpi)