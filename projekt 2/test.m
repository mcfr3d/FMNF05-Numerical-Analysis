I = imread('redCar.png');
I=imrotate(I,180);
I = flip(I,2);
imshow(I)


A = [cursor_info(1).Position];
for i =2:21
    B = cursor_info(i).Position;
    A =[A;B(1) B(2)]; 
end
%[x,y] = A;
plot(A,'*')