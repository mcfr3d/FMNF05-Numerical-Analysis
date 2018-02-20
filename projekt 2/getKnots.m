function [x,y] = getKnots(I,spacing)
BW = im2bw(I,0.9999999999999999); %Convert to bw
BW = bwareaopen(BW, 50); % Fills holes
BWP = bwperim(BW); % Get the perimeter
B = getKnotsByStripes(BWP,spacing);

BW3=BWP.*B;
BW3=imrotate(BW3,180);
BW3 = flip(BW3,2);
BW2 = imcomplement(BW3);
[y, x]=find([BW3]);
%For grid instead of stripes:
%if (mod(c,spacing)==0 || mod(r,spacing)==0) && c < limitRight
