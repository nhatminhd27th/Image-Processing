clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\Screenshot 2024-08-25 110544.png");
img = double(im2gray(img));
subplot(2,1,1);
imshow(uint8(img));
L = 256;
[h,w] = size(img);
img_trans = zeros(h,w);

x1 = 0;
x2 = (2*L/5 + L/5)/2;
x3 = (3*L/5 + 2*L/5)/2;
x4 = L - 1;

y1 = 0 ;
y2 = (2*L/5 + L/5)/2;
y3 = (3*L/5 + 2*L/5)/2;
y4 = L - 1;

% <[r1,s1]
a = x1;
b = x2;
p = y1;
q = y2;
A = (p-q)/(a-b);    
B = p - A*a;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = A*img(idx) + B;

%[r1,s1] -> [r2,s2]
a = x2;
b = x3;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = 4*L/5;

% >[r2,s2]
a = x3;
b = x4;
p = y3;
q = y4;
A = (p-q)/(a-b);
B = p - A*a;
idx = ( img >= a ) & ( img < b );
img_trans(idx) = A*img(idx) + B;

subplot(2,1,2);
imshow(uint8(img_trans));