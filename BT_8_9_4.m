clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast.jpg");
img = double(im2gray(img));
subplot(1,2,1)
imshow(uint8(img))
title('Original');

F = [1 1 1; 1 -8 1; 1 1 1];

Y = conv2(img,F,"same");
subplot(1,2,2);
imshow(uint8(Y));
title('Y');