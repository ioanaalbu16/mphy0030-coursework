function simple_image_write(filename, vol, voxdims)
    fileID = fopen(filename, 'w');
    fmeta = uint8([size(vol), size(voxdims)]);
    fwrite(fileID, fmeta, 'uint8');
    fwrite(fileID, vol, 'int16');
    fwrite(fileID, voxdims, 'float');
    fclose(fileID);
end