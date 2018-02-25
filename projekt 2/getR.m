function r = getR(gamma, n, tau, cond1, cond2)
r = zeros(1,n);
r(2:n-1) = gamma(2:n-1) - gamma(1:n-2);


r(1) = gamma(1)-tau^2*cond1; % Clamped spline
r(n) = tau^2*cond2 - gamma(n-1);

r = r';