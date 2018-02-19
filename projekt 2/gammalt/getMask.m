function mask = getMask(indexedImage)
BWImage = rgb2gray(indexedImage);
mask = BWImage == BWImage(2,2);