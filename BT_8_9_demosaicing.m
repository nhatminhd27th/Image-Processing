clc; clear;
img = imread("C:\Users\OS\OneDrive\Documentos\ImageProcessing\lowcontrast.jpg");
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

subplot(1,3,1)
imshow(img)
title('Original Image')

[h,w,d] = size(img);

RBayer = zeros(h,w);
GBayer = zeros(h,w);
BBayer = zeros(h,w);

FRB = [1 2 1; 2 4 2; 1 2 1]/4;
FG = [0 1 0; 1 4 1; 0 1 0]/4;

for i=1:1:h
    for j = 1:1:w
        if(mod(i,2) ~= 0 && mod(j,2) ~= 0)
            RBayer(i,j) = R(i,j);
        end
        if(mod(j,2) ~= 0)
            if(mod(i,2) == 0)
                GBayer(i,j) = G(i,j);
            end
        else
            if(mod(i,2) ~= 0)
                GBayer(i,j) = G(i,j);
            end
        end
        if(mod(i,2) == 0 && mod(j,2) == 0)
            BBayer(i,j) = B(i,j);
        end
    end
end

bayerIMG = zeros(h,w,d);
bayerIMG(:,:,1) = RBayer;
bayerIMG(:,:,2) = GBayer;
bayerIMG(:,:,3) = BBayer;
subplot(1,3,2)
imshow(uint8(bayerIMG))
title(' Bayer CFA pattern')

reconstructedIMG = zeros(h,w,d);
reconstructedIMG(:,:,1) = conv2(RBayer,FRB,'same');
reconstructedIMG(:,:,2) = conv2(GBayer,FG,'same');
reconstructedIMG(:,:,3) = conv2(BBayer,FRB,'same');
subplot(1,3,3)
imshow(uint8(reconstructedIMG))
title('Reconstructed Image')