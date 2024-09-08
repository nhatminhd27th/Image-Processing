clc;clear;
% concatenate 16 photos
folder = 'C:\Users\OS\OneDrive\Documentos\ImageProcessing';
files= dir ([folder '\*.jpg']);

H = 300; W = 450;
I = zeros (4*H, 4*W, 3);
for row = 1 : 4
    for col = 1 : 4
        order = (row-1)*4 + col;
        filenumber = 16 - order + 1;
        filename = [folder '\' files(filenumber).name];
        img = imread(filename);
        img = imresize (img, [H W]);
        I( (row-1)*H+1 : row*H , (col-1)*W+1 : col*W , :) = img;
    end
end
imshow(uint8(I))
