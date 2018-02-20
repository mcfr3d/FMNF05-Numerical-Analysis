function B = getKnotsByStripes(perimeter, spacing)

[rows,cols] = size(perimeter); % Get the dimensions
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
%figure % new figure window
imshow(B);
title('Stripes');