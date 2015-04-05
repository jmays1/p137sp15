function [ image ] = acquire_image( image_to_read, image_noise_length, image_object_length )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input: cell_image                      : An image of the ecm dot pattern 
%        filename (soon to be obsolete)  : This is only used to title the figure on which the
%      
%   
%
% Output: 
%
%         Traction : Traction map in nano Newtons(2 column format column 1 corresponds to
%--------------------------------------------------------------------------

%read .jpg image
image = (imread(image_to_read));
%get 2d image
image = image(:,:,1);
%remap image to gray colormap and display
colormap('gray'), imagesc(image(:,:,1));

%obtain light microposts on dark background (remove if this is unnecessary!)
%image = 255-image;
colormap('gray'), imagesc(image);

%apply background subtraction function
image = bpass(image,image_noise_length,image_object_length);

end

