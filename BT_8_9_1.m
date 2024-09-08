img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast_1d.png");
img = im2gray(img);
subplot(1,2,1)
imshow(uint8(img))

img = double(img);

F = 1/16*[1 2 1; 2 4 2; 1 2 1];
Y = conv2(img,F,"same");

subplot(1,2,2)
imshow(uint8(Y))