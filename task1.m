%% MATLAB CW - SN: 17052580
%% Task 1 (uses Tasks 1.1 & 1.2)

% This script takes an example image data file and writes the data of the
% image to a binary file using the simple_image_write function. Next, the
% image data is read back from the file using the simple_image_read
% function. Lastly, three random slices from the original volume are 
% generated as separate figures which are ultimately saved as png files.

fname = 'data/example_image.mat';

% Load example image data from a mat file:
data = load('data/example_image.mat');

% Using simple_image_write, write the image data to the file
% data/image.sim:
simple_image_write('data/image.sim', data.vol, data.voxdims);

% Using simple_image_read, read the image data back from the file:
[vol, voxdims] = simple_image_read('data/image.sim');

% Display three random slices from the image and save the figures as png-s:
r = randi([1 30], 3);

for i = 1:3
    picture = vol(:, :, r(i));
    low = min(min(picture));
    high = max(max(picture));
    
% NOTE: Since the intensity values of the pixels comprising the image are
% unknown, we make use of two variables - low and high - to normalise the
% proportions of intensity according to the minimum and maximum pixel
% values of the image. 

    figure, imshow(picture, [low, high]);
    filename = 'figure1_' + string(i) + '.png';
    saveas(gcf, filename);
end