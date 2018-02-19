
I = imread('redCar.png');
%I = imrotate(I,180)
%graythresh(I)
BW = im2bw(I,0.9999999999999999);
%BW = imbinarize(I);
%BW = imfill(BW,'holes');

BWP = bwperim(BW);
rows = 258;
cols = 763;
B = zeros(rows, cols)
for r = 10:rows
    for c = 1:cols
        if (mod(c,5)==0)
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
%Image_Flip = imrotate(Image_Original,90)';
BW2 = imcomplement(BW3);
%imshow(BW2);
[m,n] = size(BW2)
[g,h] = size(B)
[y, x]=find([BW3])

plot(x,y,'*')
xlim([0 763])
ylim([0 258])
%BW = im2bw(I,graythresh(I));
%BW2 = imfill(BW,'holes');
%imshow('redCar.png');
%carCountour = imcontour(BW,3);
%L = bwlabel(BW);
%imshow(L,[]);
%{
C = zeros(764, 263)
[Cont,h] = contour(BW,1);
x = linspace(0, 763);                                      % X-Range
y = linspace(0, 258);                                      % Y-Range
[X,Y] = meshgrid(x,y);                                      % Create Matrix Arguments

figure(1)
[Cont,h] = contour(BW,1);
grid

Lvls = h.LevelList;
for k1 = 1:length(Lvls)
    idxc{k1} = find(C(1,:) == Lvls(k1));
    Llen{k1} = C(2,idxc{k1});
    conturc{k1,1} = C(:,idxc{k1}(1)+1 : idxc{k1}(1)+1+Llen{k1}(1)-1);
    conturc{k1,2} = C(:,idxc{k1}(2)+1 : idxc{k1}(2)+1+Llen{k1}(2)-1);
end
figure(2)
plot(conturc{3,1}(1,:), conturc{3,1}(2,:))
grid 
%}
%BW3 = im2bw(h,0.9);
%imshow(BW3);