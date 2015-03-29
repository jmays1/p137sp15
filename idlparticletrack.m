%Jeffrey Mays
%March 8, 2015
%http://site.physics.georgetown.edu/matlab/tutorial.html

%clear MATLAB command window and close figures
clc;
clear all;
close all;

%read .jpg image
a = double(imread('2015031611.jpg'));
%get 2d image
a = a(:,:,1);
%remap image to gray colormap and display
colormap('gray'), imagesc(a(:,:,1));

%obtain light microposts on dark background (remove if this is unnecessary!)
%a = 255-a;
colormap('gray'), imagesc(a);

%apply background subtraction function
b = bpass(a,1,6);

%get location of all peaks (pixels>[middle value])
pk = pkfnd(b,60,10);

%get centroids of posts based on detected peaks
cnt = cntrd(b,pk,10);

%display centroid calculation output in command window
whos cnt
hist(mod(cnt(:,1),1),20);

%plot centroid map
plot(pk(:,1),pk(:,2),'.');

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
arot = imrotate(a,-angle);
imagesc(arot);




%centroids are horizontally aligned, find centroids in the new image
%apply background subtraction function
b = bpass(arot,1,6);

%get location of all peaks (pixels>[middle value])
pk = pkfnd(b,60,10);

%get centroids of posts based on detected peaks
cnt = cntrd(b,pk,10);

%display centroid calculation output in command window
whos cnt
hist(mod(cnt(:,1),1),20);

%plot centroid map
plot(pk(:,1),pk(:,2),'.');


%to correct translational shifts, use imregister to compare shifted picture to a
%fixed reference image
%repeat above process for 






