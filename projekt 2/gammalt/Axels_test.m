clear;
% Read image
indexedImage = imread('redCar.png');
% Get mask
mask = getMask(indexedImage);
% Set grid spacing
spacing = 10;
% Get image width
[height, width] = size(mask);
% Number of knots to be created
Nknots = floor(width/spacing);
%Array for holding the coordinates of the knots
knots = zeros(2,Nknots);
% For "each" column, go down until a black pixel is found
for i= 1:Nknots
    col = i*spacing;
    knots(1, i) = col;
    row = 1;
    while mask(row,col) == 1 && row < height
        row = row + 1;
    end
    knots(2, i) = row;
end

plot(knots(2,:),'*');
