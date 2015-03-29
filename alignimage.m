function [ Rreg ] = alignimage( pic, refpic )
%to correct translational shifts, use imregister to compare shifted picture to a
%fixed reference image
close all;
pic=rgb2gray(pic);
refpic=rgb2gray(refpic);
imshow(pic);
figure;
imshow(refpic);
figure;

[optimizer, metric] = imregconfig('multimodal');

[ picRegistered, Rreg] = imregister(pic, refpic, 'similarity',optimizer, metric);
imshowpair(refpic, picRegistered,'Scaling','joint');

figure;
imshow(picRegistered);
x=1;
end

