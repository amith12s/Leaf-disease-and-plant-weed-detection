clc 
clear all 
close all
[x,map]=imread('D:\FALL SEMESTER 2021-2022 --- 7th SEM\TARP\Project\images\IMG_3438.jpg'); 
g=rgb2gray(x);
[a,b]=size(g); 
figure() 
imshow(x);
title('original image'); 
figure()
imshow(g);
title('gray scale image');
% image binarisation 
bw=im2bw(g,map,0.5); 
figure()
imshow(bw);
title('Image Binarisation');
%image filtering
k = medfilt2(bw);
bw2 = bwareaopen(k, 350); figure()
imshow(bw2); title('filtered image');
%area thresholding
lb = 10;
ub = 1245453;
Iout = xor(bwareaopen(bw,lb), bwareaopen(bw,ub)); figure()
imshow(Iout);
title('Area Thresholding');
%identifying weed
J=Iout;
[B,L] = bwboundaries(J, 'noholes'); 
figure()
imshow(J); 
hold on;
for k = 1:length(B),boundary = B{k}; 
    plot(boundary(:,2),boundary(:,1),'r','LineWidth',2);
end 
Totalareaofweed=bwarea(Iout);
[rows, columns ,numberOfColorChannels] = size(x); Totalareaofimage=rows*columns;
figure() 
subplot(3,2,1) 
imshow(x); 
title('original image') 
subplot(3,2,2) 
imshow(g); 
title('gray scaling') 
subplot(3,2,3) 
imshow(bw);
title('Binarised image')
subplot(3,2,4) 
imshow(bw2); 
title('Filtered image') 
subplot(3,2,5) 
imshow(Iout);
title('Area Thresholding') 
subplot(3,2,6) 
imshow(J);
title('weed identified'); 
hold on;
for k = 1:length(B),boundary = B{k}; 
    plot(boundary(:,2),boundary(:,1),'r','LineWidth',2);
end