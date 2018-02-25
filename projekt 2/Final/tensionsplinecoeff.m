%Calculation of tension spline coefficients
%Calculates coefficients of tension spline
%Input: x,y vectors of data points and tau which is the tension value
%Output: vector of coefficients z1,z2,z3...
function coeff=tensionsplinecoeff(x,y,tau,cond1,cond2)
n=length(x);
A=zeros(n,n); % matrix A is nxn
r=zeros(n,1);
for i=1:n-1 % define the deltas
    h(i)= x(i+1)-x(i); 
end
[alpha,beta,gamma]=getAlphaBetaGamma(tau, h, y, n);
for i=2:n-1 % load the A matrix
    A(i,i-1:i+1)=[alpha(i-1) (beta(i-1)+beta(i)) alpha(i)];
    r(i)=gamma(i)-gamma(i-1); % right-hand side
end
% Set endpoint conditions
% Use only one of following conditions:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%A(1,1) = 1; % natural spline conditions
%A(n,n) = 1;
%%%%%%%%%%%%%%%%%%%%
%clamped
yo_prim =cond1;
yn_prim=cond2;
A(1,1)=beta(1);A(1,2)=alpha(1);r(1)=gamma(1)-tau^2*yo_prim; 
A(n,n-1)=alpha(n-1);A(n,n)=beta(n-1);r(n)=tau^2*yn_prim-gamma(n-1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% coeff=zeros(n,1);
% coeff(:,1)=A\r; % solve for Z coefficients
% coeff=coeff(1:n,1);
coeff = A\r;