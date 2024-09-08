A = [255 255 255 255; 255 255 255 255; 255 255 255 255; 255 255 255 255]
[h,w] = size(A);
B = zeros(h,w)
for i=1:1:h

    for j = 1:1:w
        
        if(mod(i,2) ~= 0 && mod(j,2) ~= 0)

            B(i,j) = A(i,j);

        end

    end

end