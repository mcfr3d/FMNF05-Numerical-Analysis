% n = 5;
% x = zeros(n);
% y = zeros(n);
% z = zeros(n);
% h = zeros(n);
% alpha = zeros(n);
% beta = zeros(n);
% gamma = zeros(n);
% tau = 1;
% 
% for i = 0:n
%    h(i) = x(i+1)-x(i);
%    alpha(i) = 1/h(i) - tau/(sinh(tau*h(i)));
%    beta(i) = tau*cosh(tau*h(i))/sin(tau*h(i)) - 1/h(i);
%    gamma(i) = tau^2*(y(i+1)-y(i))/h(i);
% end

% A = (alpha(0) beta(0)+beta(1) alpha(1) 0 0 0;
%      0 alpha(1) beta(1)+beta(2) alpha(2) 0 0;
%      0 0 alpha(1) beta(2)+beta(3) alpha(3) 0;
%      0 0 0 alpha(1) beta(3)+beta(4) alpha(4);)

