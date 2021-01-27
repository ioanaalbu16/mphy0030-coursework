fname = 'data/example_image.mat';

data = load('data/example_image.mat');

simple_image_write('data/image.sim', data.vol, data.voxdims);
[vol, voxdims] = simple_image_read('data/image.sim');
r = randi([1 30], 3);

for i = 1:3
    picture = vol(:, :, r(i));
    low = min(min(picture));
    high = max(max(picture));

    figure, imshow(picture, [low, high]);
    filename = 'figure1_' + string(i) + '.png';
    saveas(gcf, filename);
end