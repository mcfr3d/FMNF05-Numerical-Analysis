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

% Task 4

%Now fixed point iteration
g = @(k) (2*k*(10 + 1/(2*k))*exp(-k)-1)/14;
k0 = 0.3;
epsilon = 1e-24;
Nmax = 100;

k_fpi = fixed_point(g,k0,epsilon,Nmax);

% Task 5
epsilon = 1e-20; % "Full" precision
t0 = 1; % Seems reasonable: When found, the corpse had cooled by 5 degrees.
%Between 8 and 9, the average pace of cooling was 2.5 degrees per hour.
%This means that at when found, the body had been cooling for less than 2 hours.
% t=1 leaves Sutherland the opportunity the commit the crime.
% When starting at 2.1, (If Sutherland commits the crime before the
% interview) the answer is almost exactly the same. That guess doesn't make
% sense anyway.
k= k_fpi % This one was the more precise
Nmax = 100;

% defined T and dT
T = @(t) 22+0.5*t-1/(2*k)+(10 + 1/(2*k))*exp(-k*t);
dT = @(t) 0.5-10*k*exp(-k*t)-0.5*exp(-k*t);

T_zero = @(t) T(t)-37;

fprintf('%s','Newton method:')
[tc, res,n] = newton(T_zero,dT,t0,epsilon, Nmax);
tc
n

% Task 6

% Bisection
Nmax = 100;
epsilon = 1e-18;
fprintf('%s','Bisection:')
[tc,possible_err,res,n] = bisection(T_zero,-6,0,epsilon,Nmax);
tc
n

% Fixed-point
fprintf('%s','Fixed-point:')
Nmax = 20;
T_fp = @(t) -log((30*k+1-k*t)/(20*k+1))/k;

% T_fp_diff = @(t) 1/(30*k+1-k*t);
% fplot(g, [-6 0])
% abs(T_fp_diff) < 1 for all t < 0.


[tc,n] = fixed_point(T_fp,-1.3,epsilon,Nmax);
tc
n