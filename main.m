%Jeffrey Mays
%150329


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
image_rotated=rotate_image( image,min_brightness, min_size, ...
                         averaging_diameter, number_of_bins);












                     
                 








