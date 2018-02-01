%Task 3
f = @(k) -7-1/(2*k) + (10 + 1/(2*k))*exp(-k);
%The average dT/dt between t=0 and t=1 is -2.5
a = 1/4;
%Value for which dT(0)/dt = -2,5
b = 5/14;
%Value for which dT(1)/dt = -2.5
epsilon = 0.5e-2;
%We need accuracy of two decimals
Nmax = 10;
%Seems resonable
fprintf('%s','Bisection (2 decimals correct):')
[k_b,possible_err,res,n] = bisection(f,a,b,epsilon,Nmax)
% Task 4

%Now fixed point iteration
g = @(k) (2*k*(10 + 1/(2*k))*exp(-k)-1)/14;
k0 = 0.3; %based on result from task 3
epsilon = 0.5e-6;
Nmax = 100;
fprintf('%s','Fixed-point (6decimals correct):')
[k_fpi,n,err] = fixed_point(g,k0,epsilon,Nmax);
k_fpi

% Task 5
epsilon = 0.5e-16; % "Full" precision
t0 = 1; % Seems reasonable: When found, the corpse had cooled by 5 degrees.
%Between 8 and 9, the average pace of cooling was 2.5 degrees per hour.
%This means that at when found, the body had been cooling for less than 2 hours.
% t=1 leaves Sutherland the opportunity the commit the crime.
% When starting at 2.1, (If Sutherland commits the crime before the
% interview) the answer is almost exactly the same. That guess doesn't make
% sense anyway.
k= k_fpi; % This one was the more precise
Nmax = 100;

% defined T and dT
T = @(t) 22+0.5*t-1/(2*k)+(10 + 1/(2*k))*exp(-k*t);
dT = @(t) 0.5-10*k*exp(-k*t)-0.5*exp(-k*t);

T_zero = @(t) T(t)-37;

fprintf('%s','Newton method:')
[tc, res,n] = newton(T_zero,dT,t0,epsilon, Nmax)
C = 10 + 1/(2*k);
T_zero_prime = @(t) k*(1/(2*k)-C*exp(-k*t));
T_zero_prime_prime = @(t) k^2*C*exp(-k*t);
M = 0.5*T_zero_prime_prime(tc)/T_zero_prime(tc)

% Task 6

% Bisection
Nmax = 100;
epsilon = 0.5e-16;
fprintf('%s','Bisection:')
[tc,possible_err,res,n] = bisection(T_zero,-6,0,epsilon,Nmax);
tc
possible_err
n
S = 1/2
% Fixed-point

fprintf('%s','Fixed-point:')
Nmax = 20;
g = @(t) -log((30*k+1-k*t)/(20*k+1))/k;

% Check hypothesis
% g_prime = @(t) 1/(30*k+1-k*t);
% abs(g_prime) < 1 for all t < 0.

[tc,n,err] = fixed_point(g,-1.3,epsilon,Nmax)

% g(t)
%fprintf('%s', '|g_prime(tc)|:')
g_prime = @(t) 1/(30*k+1-k*t);
S = g_prime(tc)
% S is approximate convergence rate for fixed point iteration with g(t)

%Task 8
fprintf('%s','fzero:');
fzero(T_zero,-1,3)