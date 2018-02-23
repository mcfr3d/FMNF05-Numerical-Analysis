% Alpha_i -> 0 and beta_i -> 0 for any i when tau -> 0.
% When tau > 0, beta_(i-1) + beta_i > alpha_(i-1) + alpha_i for any i
% assuming h_(i-1) <  h_i

% When tau < 0, interesting things happen.


%So, for tau > 0 and h_(i-1) <  h_i, the matrix is strictly diagonally dominant
% For tau = 0, the matrix is empty

n = 4;
tau = 5;
x = 0:1:n;
y = zeros(1,n+1);
h = zeros(1,n);
alpha = zeros(1,n);
beta = zeros(1,n);
gamma = zeros(1,n);
for i = 1:n
    h(i) = x(i+1)-x(i);
    alpha(i) = 1/h(i) - tau/sinh(tau*h(i));
    beta(i) = tau*cosh(tau*h(i))/sinh(tau*h(i)) - 1/h(i);
    gamma(i) = tau^2*(y(i+1)-y(i))/h(i);
end
betas = zeros(1,n);
for i = 1:(n-1)
    betas(i) = beta(i) + beta(i+1);
end
% A = [0 0 0 0 0;
%      alpha(1) betas(1) alpha(2) 0 0;
%      0 alpha(2) betas(2) alpha(3) 0;
%      0 0 alpha(3) betas(3) alpha(4);
%      0 0 0 0 0]

A = zeros(n+1,n+1);
A(1,1) = 1;
for row = 2:n
    A(row,row-1) = alpha(row-1);
    A(row,row) = betas(row-1);
    A(row,row+1) = alpha(row);
end
A(n+1,n+1) = 1;

A

d = det(A)

