function A = getA(alpha, beta, n)

A = zeros(n,n);
for row = 2:n-1
    A(row,row-1:row+1)=[alpha(row-1) beta(row-1)+beta(row) alpha(row)];
end

A(1,1:2) = [beta(1) alpha(1)]; % Clamped spline
A(n,n-1:n) = [alpha(n-1) beta(n-1)];

%A(1,1:2)=[2*dx(1) dx(1)];r(1)=3*(dy(1)/dx(1)-v1);  %clamped
%A(n,n-1:n)=[dx(n-1) 2*dx(n-1)];r(n)=3*(vn-dy(n-1)/dx(n-1));

