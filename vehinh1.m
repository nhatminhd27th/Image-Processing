clear;clc;
flag = zeros(600,800,3);
flag(250:350,200:600,1)=1;
flag(100:500,350:450,1)=1;
flag(:,:,2)=1;
imshow(flag);
