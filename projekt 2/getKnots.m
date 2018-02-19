
I = imread('redCar.png');
BW = im2bw(I,0.9999999999999999);
BW = bwareaopen(BW, 50);
BWP = bwperim(BW);
[rows,cols] = size(BW)
B = zeros(rows, cols)
for r = 10:rows
    for c = 1:cols
        if (mod(c,15)==0)
            B(r,c)=1;
        if (r>=150)
            B(r,c)=0;
        end
        end
    end
end         
BW3=BWP.*B;
BW3=imrotate(BW3,180);
BW3 = flip(BW3,2);
BW2 = imcomplement(BW3);
[y, x]=find([BW3])
plot(x,y,'*')
xlim([0 763])
ylim([0 258])
