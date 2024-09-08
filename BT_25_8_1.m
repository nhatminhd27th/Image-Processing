clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\anh15.jpg");
img = im2gray(img);
subplot(2,3,1);
imshow(img);

img_trans_1 = log(1 + double(img));
subplot(2,3,2);
imshow(uint8(img_trans_1));

img_trans_2 = double(img).^0.5;
subplot(2,3,3);
imshow(uint8(img_trans_2));

img_trans_3 = double(img).^0.8;
subplot(2,3,4);
imshow(uint8(img_trans_3));

img_trans_4 = double(img).^1.5;
subplot(2,3,5);
imshow(uint8(img_trans_4));

img_trans_4 = double(img).^2.5;
subplot(2,3,6);
imshow(uint8(img_trans_4));
