clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast.jpg");
img = double(im2gray(img));
subplot(1,5,1)
imshow(uint8(img))
title('Original');

F = ones(3,3)/3^2;
Y = conv2(img,F,"same");

subplot(1,5,2)
imshow(uint8(Y))
title('K = 3');

F = ones(5,5)/5^2;
Y = conv2(img,F,"same");

subplot(1,5,3)
imshow(uint8(Y))
title('K = 5');

F = ones(9,9)/9^2;
Y = conv2(img,F,"same");

subplot(1,5,4)
imshow(uint8(Y))
title('K = 7');

F = ones(13,13)/13^2;
Y = conv2(img,F,"same");

subplot(1,5,5)
imshow(uint8(Y))
title('K = 13');
