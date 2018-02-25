%simple fuction to get our predefinde knots from placing data points on the
%imgage
%Input: file with the struct generated from saving data poitns from image
%GUI
%Output: [x y]  which cointains all X values and Y values
function [x,y] = getPredefinedKnots(file)
load(file);
coordinates = cell2mat({cursor_info.Position}');
x = coordinates(:,1);
y = coordinates(:,2);
