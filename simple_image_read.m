function [vol, voxdims] = simple_image_read(filename)
    fileID = fopen(filename, 'r');
    meta = fread(fileID, [1, 5], 'uint8');
    vol = int16(fread(fileID, prod(meta(1, 1:3)), 'int16'));
    vol = reshape(vol, meta(1, 1:3));
    voxdims = fread(fileID, prod(meta(1, 4:5)), 'float');
    voxdims = reshape(voxdims, meta(1, 4:5));
end