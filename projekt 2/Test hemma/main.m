
indexedImage = imread('redCar.png');
mask = indexedImage == indexedImage(2, 2);
mask = bwareafilt(mask, 1);
mask = bwareafilt(~mask, 1);