clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast.jpg");
img = double(im2gray(img));
subplot(1,4,1)
imshow(uint8(img))
title('Original');

K = 6;
F = ones(K,K)/K^2;
G = ones(1,K)/K;

%K*K phep nhan, K*K - 1 phep cong

tic
Y1 = conv2(img,F,"same");
% subplot(1,4,2);
% imshow(uint8(Y1));
% title('Y1');
toc

%K phep nhan, K - 1 phep cong, lam 2 lan tuc la K*2 phep nhan, (K-1)*2 phep
%cong

tic
Y2 = conv2(img,G,"same");
% subplot(1,4,3);
% imshow(uint8(Y2));
% title('Y2');

Y3 = conv2(Y2,G',"same");
% subplot(1,4,4);
% imshow(uint8(Y3));
% title('Y3');
toc