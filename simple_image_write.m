%% MATLAB CW - SN: 17052580
%% Task 1.2

function simple_image_write(filename, vol, voxdims)

% This function writes a 3D medical image to a binary file.

% INPUTS: 
% - 'filename' - string variable for the required file to be written by 
% this function;
% - 'vol' - variable storing the intensity values of the image;
% - 'voxdims' - variable storing the voxel dimensions of the image.

% OUTPUTS: 
% - This function doesn't return any values but it does save a file.

% Open the required file with assigned 'write' permission:
    fileID = fopen(filename, 'w');
    
% Store the header information as size of the image (first 3 elements
% indicate the size of the 'vol' variable storing the intensity values of
% the respective image, last 2 elements - size of the 'voxdims' variable
% storing the voxel dimensions of the respective image:
    fmeta = uint8([size(vol), size(voxdims)]);
    
% Write the header information of the image into the new file:
    fwrite(fileID, fmeta, 'uint8');
    
% Write the intensity values of the image into the new file:
    fwrite(fileID, vol, 'int16');
    
% Write the voxel dimensions of the image into the new file:
    fwrite(fileID, voxdims, 'float');
    
% Close the file to ensure completion:
    fclose(fileID);
end