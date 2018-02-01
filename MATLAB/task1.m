syms k T(t)
T_office = @(t) 22+0.5*t;
equation = diff(T,t)==(-k)*(T-T_office);
dsolve(equation)
%returns t/2 + (C2*exp(-k*t) - 1)/(2*k) + 22 which is wrong(!)?
 

