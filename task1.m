%% MATLAB CW - SN: 17052580
%% Task 1 (uses Task 1.1 & Task 1.2)

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

    figure, imshow(picture, [low, high]);
    filename = 'figure1_' + string(i) + '.png';
    saveas(gcf, filename);
end