function [x,y] = getKnots(fileName,spacing)
I = imread(fileName);
subplot(4,1,1);
imshow(I);
BW = im2bw(I,0.9999999999999999); %Convert to bw
BW = bwareaopen(BW, 50); % Fills holes
BWP = bwperim(BW); % Get the contour
[rows,cols] = size(BW); % Get the dimensions
B = zeros(rows, cols); % Create matrix filled with zeroes
limitUnder = 170;
limitRight = 750;
for r = 2:rows
    for c = 2:cols
        if (mod(c,spacing)==0) && c < limitRight
            B(r,c)=1;
        if (r>=limitUnder)
            B(r,c)=0;
        end
        end
    end
end
%subplot(3,1,3);
%imshow(B);
BW3=BWP.*B;
BW3=imrotate(BW3,180);
BW3 = flip(BW3,2);
BW2 = imcomplement(BW3);
[y, x]=find([BW3]);
%For grid instead of stripes:
%if (mod(c,spacing)==0 || mod(r,spacing)==0) && c < limitRight
