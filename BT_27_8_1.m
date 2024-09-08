clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast_1d.png");
img = double(im2gray(img));
subplot(2,2,1);
imshow(uint8(img));

subplot(2,2,2);
histogram(img);

L = 256;
[h,w] = size(img);

his = zeros(1,L);
pr = zeros(1,L);
s = zeros(1,L);

%----------------------Histogram------------------------
for i = 1:1:L
    his(i) = sum(sum(img == (i - 1)));
end
%stem(his);
%-------------------------------------------------------

%-------------------------------------------------------
for i = 1:1:L
    pr(i) = his(i)/(h*w);
end
%-------------------------------------------------------

%-------------------------------------------------------
for i = 1:1:L
    temp = 0;
    for j = 1:1:i
        temp = temp + pr(j);
    end
    s(i) = (L-1)*temp;
end
%-------------------------------------------------------

[h,w] = size(img);
img_trans1 = zeros(h,w);

%----------------Histogram Equalization-----------------
for i = 0:1:L-1
    idx = (img >= i) & (img < (i+1));
    img_trans1(idx) = s(i+1);
end
idx = img == (L-1);
img_trans1(idx) = s(L);
%-------------------------------------------------------

subplot(2,2,3);
imshow(uint8(img_trans1));

subplot(2,2,4);
histogram(img_trans1);