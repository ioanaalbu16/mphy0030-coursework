% Open the required file with assigned 'read' permission:
    fileID = fopen('data/example_image.mat', 'r');

% Read the first 5 values (header information indicating size of the image) 
% into an array (5 elements, single row) with the precision that the source 
% data class is 'uint8':
    meta = fread(fileID, [1, 5], 'uint8'); 

% Read the intensity values of the respective image 
    vol = int16(fread(fileID, prod(meta(1, 1:3)), 'int16'));
    
    vol = reshape(vol, meta(1, 1:3));
    
    voxdims = fread(fileID, prod(meta(1, 4:5)), 'float');
    
    voxdims = reshape(voxdims, meta(1, 4:5));