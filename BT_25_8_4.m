clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\Screenshot 2024-08-25 110544.png");
img = double(im2gray(img));
subplot(2,1,1);
imshow(uint8(img));
L = 256;
[h,w] = size(img);
img_trans = zeros(h,w);

x1 = 0;
x2 = 2*L/5;
x3 = (3*L/5 + 4*L/5)/2;
x4 = L - 1; 

% <[r1,s1]
a = x1;
b = x2;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = 3*L/5;

%[r1,s1] -> [r2,s2]
a = x2;
b = x3;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = L/10;

% >[r2,s2]
a = x3;
b = x4;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = 3*L/5;
subplot(2,1,2);
imshow(uint8(img_trans));