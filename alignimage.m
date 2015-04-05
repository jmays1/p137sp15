function [ Rreg, picRegistered ] = alignimage( pic, refpic )
%to correct translational shifts, use imregister to compare shifted picture to a
%fixed reference image
% close all;
% pic=rgb2gray(pic);
% refpic=rgb2gray(refpic);

[optimizer, metric] = imregconfig('multimodal');

[ picRegistered, Rreg] = imregister(refpic, pic, 'affine',optimizer, metric);
imshowpair(refpic, picRegistered,'Scaling','joint');
end

