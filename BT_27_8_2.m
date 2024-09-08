clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast1.jpg");

L = 256;
[h,w,d] = size(img);
img_trans = zeros(h,w,d);

for layer = 1:1:d
    img_layer = double(im2gray(img(:,:,layer)));
    img_trans_layer = zeros(h,w);
    his = zeros(1,L);
    pr = zeros(1,L);
    s = zeros(1,L);

    for i = 1:1:L
        his(i) = sum(sum(img_layer == (i - 1)));
    end

    for i = 1:1:L
        pr(i) = his(i)/(h*w);
    end

    for i = 1:1:L
        temp = 0;
        for j = 1:1:i
            temp = temp + pr(j);
        end
        s(i) = (L-1)*temp;
    end

    for i = 0:1:L-1
        idx = (img_layer >= i) & (img_layer < (i+1));
        img_trans_layer(idx) = s(i+1);
    end

    idx = img_layer == (L-1);
    img_trans_layer(idx) = s(L);
    img_trans(:,:,layer) = img_trans_layer;
end

subplot(3,2,1);
imshow(uint8(img));
title('Original');

subplot(3,2,2);
histogram(img);
title('Original histogram');

subplot(3,2,3);
imshow(uint8(img_trans));
title('Equalized');

subplot(3,2,4);
histogram(img_trans);
title('Equalized histogram');

subplot(3,2,5);
imshow(histeq(img));
title('Build-in function');

subplot(3,2,6);
imhist(histeq(img))
title('Build-in function histogram');