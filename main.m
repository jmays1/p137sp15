%Jeffrey Mays
%150329

%COMMENT FOR GITHUB
%clear MATLAB command window and close figures
clc;
clear all;
close all;

%% 1.) Acquire image of cell on microposts

image_to_read='150329a.jpg';
%length of uncertainty (noise) expressed in pixels
image_noise_length=1;
%length of a typical object expressed in pixels
image_object_length=6;

image=acquire_image(image_to_read, image_noise_length, image_object_length );

%% 2.) Pre-process images
%
% a.) Rotate images so that rows are horizontal
% b.) Register images to correct for translational shifts (if any).
% c.) Specify grid of expected micropost positions enclosing cell

%a.)
%brightness threshold of object (0-255)
min_brightness=60;
%minimum distance between 2 centroids
min_size=10;
%diameter to use in estimating the "exact" center
averaging_diameter=10;
%number of histogram bins
number_of_bins=20;
[image_rotated, pk, cnt, angle ]=rotate_image(image, min_brightness, averaging_diameter, number_of_bins);

%b.) 
%reference image of microposts (use previous image?)
%for now just use a slightly shifted image
image_to_read='2015031611shift.jpg';
%read image
ref_image=acquire_image(image_to_read, image_noise_length, image_object_length );
%need to rotate ref_image
ref_image = imrotate(ref_image,-angle);
%call image alignment function
    %NOTE: needs editing to align using ONLY translation and rotation!
[Rreg, picRegistered]=alignimage(image_rotated,ref_image);

%c.)
%unimplemented






%% 3.) Process image
%a.) Automatically determine deflected and undeflected positions of
%microposts
%b.) Use interpolation on top image to determine undeflected positions
                     
%a.)
%b.) find features in image
%http://www.mathworks.com/help/vision/ref/matchfeatures.html#btatw3a

points1 = detectHarrisFeatures(image_rotated);
points2 = detectHarrisFeatures(ref_image);

[features1, valid_points1] = extractFeatures(image_rotated, points1);
[features2, valid_points2] = extractFeatures(ref_image, points2);

indexPairs = matchFeatures(features1, features2);

matchedPoints1 = valid_points1(indexPairs(:, 1), :);
matchedPoints2 = valid_points2(indexPairs(:, 2), :);
showMatchedFeatures(image_rotated, ref_image, matchedPoints1, matchedPoints2);
%get average length of features
points1=matchedPoints1.Location;
points2=matchedPoints2.Location;

i=1;

while (i < size(points1))
hold on;
vectarrow(points1(i,:),points2(i,:))
i=i+1;
end







                     
                 








