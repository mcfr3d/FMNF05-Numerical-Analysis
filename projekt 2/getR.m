function r = getR(gamma, n, cond1, cond2)
%r = zeros(1,n);
r(1) = gamma(1)-cond1;
r(n) = cond2 - gamma(n-1);
r(2:n-1) = gamma(2:n-1) - gamma(1:n-2);
r = r';