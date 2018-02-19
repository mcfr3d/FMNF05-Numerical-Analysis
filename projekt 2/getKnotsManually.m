%I = imread('redCar.png');
%I=imrotate(I,180);
%I = flip(I,2);
%imshow(I);
load('pointData\cursorinfo.mat')
A = [cursor_info(1).Position];
X=[A(1)];
Y=[A(2)];

for i =2:21
    B = cursor_info(i).Position;
    X =[X B(1)];
    Y =[Y  B(2)];
    end
    
    
%[x,y] = A;
plot(X,Y,'*')
my_test();