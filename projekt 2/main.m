filename = 'points.csv';
Array = csvread(filename);
row1 = Array(1, :);
row2 = Array(2, :);
for index = 1:130
    row2(index) = 100-row2(index);
end

%axis([0 130 0 130]);
%plot(row1,row2);

x = row1;
y = row2;
sp=spline(x,y); % this creates the spline structure
[breaks,coeff,L,K]=unmkpp(sp); % "unmakes" (shows) structure
