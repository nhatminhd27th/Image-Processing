clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast.jpg");
img = double(im2gray(img));
subplot(1,4,1)
imshow(uint8(img))
title('Original');

F = 1/16*[1 2 1; 2 4 2; 1 2 1];
G = 1/4*[1 2 1];

Y1 = conv2(img,F,"same");
subplot(1,4,2);
imshow(uint8(Y1));
title('Y1');

Y2 = conv2(img,G,"same");
subplot(1,4,3);
imshow(uint8(Y2));
title('Y2');

Y3 = conv2(Y2,G',"same");
subplot(1,4,4);
imshow(uint8(Y3));
title('Y3');