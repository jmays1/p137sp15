function [ image_rotated ] = rotate_image( image,min_brightness, min_size, averaging_diameter, number_of_bins)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


pk = pkfnd(image,min_brightness,min_size);
%get centroids of posts based on detected peaks
cnt = cntrd(image,pk,averaging_diameter);
%display centroid calculation output in command window
hist(mod(cnt(:,1),1),number_of_bins);


%pick corner centroid and closest neighbor
origin=[1 1];
[n,d]=knnsearch(pk,origin,'k',1,'distance','euclidean');

%find the closest neighbor to point found above
[o,e]=knnsearch(pk,pk(n,:),'k',2,'distance','euclidean');

%find angle between these two points
y1=pk(o(:,1),2);
y2=pk(o(:,2),2);
x1=pk(o(:,1),1);
x2=pk(o(:,2),1);
angle=atand((y2-y1)/(x2-x1));

%rotate image by the NEGATIVE of this angle to compensate
image_rotated = imrotate(image,-angle);
%display the color-scaled image
imagesc(image_rotated);
end

