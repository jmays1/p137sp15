function [ partitions ] = grouprows( cnt )

%groups posts into rows
%INPUT: cnt - Centroid map of image
%OUTPUT:partitions - row groups of image

%find horizontal "neighbor"
counter=1;

while counter <= length(cnt)
%get magnitude and angle of each point from origin
[THETA(counter),RHO(counter)] = cart2pol(cnt(counter,1),cnt(counter,2));
counter=counter+1;
end

%reset counter
counter=1;

%sort by magnitude t



partitions=THETA;
end

