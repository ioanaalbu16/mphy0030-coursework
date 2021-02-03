% Open the required file with assigned 'write' permission:
    fileID = fopen('data/image.sim', 'w');
    
% Store the header information as size of the image (first 3 elements
% indicate the size of the 'vol' variable storing the intensity values of
% the respective image, last 2 elements - size of the 'voxdims' variable
% storing the voxel dimensions of the respective image:
    fmeta = uint8([size(vol), size(voxdims)]);
    
% Write the header information of the image into new file:
    fwrite(fileID, fmeta, 'uint8');
    
% Write the intensity values of the image into new file:
    fwrite(fileID, vol, 'int16');
    
% Write the voxel dimensions of the image into new file:
    fwrite(fileID, voxdims, 'float');
    
% Close the file to ensure completion:
    fclose(fileID);