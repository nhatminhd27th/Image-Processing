clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\Screenshot 2024-08-25 093851.png");
img = double(im2gray(img));
subplot(2,1,1);
imshow(uint8(img));
L = 256;
[h,w] = size(img);
img_trans = zeros(h,w);

y1 = 0;
y2 = L/8;
y3 = ((L-1) + 3*L/4)/2;
y4 = L - 1;

x1 = 0 ;
x2 = (L/2 + L/4)/2;
x3 = (L/2 + 3*L/4)/2;
x4 = L - 1;

% <[r1,s1]
a = x1;
b = x2;
p = y1;
q = y2;
A1 = (p-q)/(a-b);
B1 = p - A1*a;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = A1*img(idx) + B1;

%[r1,s1] -> [r2,s2]
a = x2;
b = x3;
p = y2;
q = y3;
A2 = (p-q)/(a-b);
B2 = p - A2*a;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = A2*img(idx) + B2;

% >[r2,s2]
a = x3;
b = x4;
p = y3;
q = y4;
A3 = (p-q)/(a-b);
B3 = p - A3*a;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = A3*img(idx) + B3;

subplot(2,1,2);
imshow(uint8(img_trans));