function [x,y] = getPredefinedKnots(file)
load(file);
coordinates = cell2mat({cursor_info.Position}');
x = coordinates(:,1);
y = coordinates(:,2);
