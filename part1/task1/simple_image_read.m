%% MATLAB CW - SN: 17052580
%% Task 1.1
%%

function [vol, voxdims] = simple_image_read(filename)

% This function reads and stores the information comprising a 3D medical
% image file by assigning the respective intensity values and voxel
% dimensions according to the size of the image stored in the header of the 
% file (used for information purposes only).

% INPUTS: 
% - 'filename' - string variable for the required file to be read by this
% function;

% OUTPUTS: 
% - 'vol' - variable to store the intensity values of the read image;
% - 'voxdims' - variable to store the voxel dimensions of the read image.

% Open the required file with assigned 'read' permission:
    fileID = fopen(filename, 'r');

% Read the first 5 values (header information indicating size of the image) 
% into an array (5 elements, single row) with precision 'uint8' (the source
% data class):
    meta = fread(fileID, [1, 5], 'uint8');
    
% NOTE: the first 3 elements of the 'meta' array indicate the size of the
% matrix storing the intensity values of the respective image ('vol'
% variable), whilst the latter 2 elements - the size of the matrix storing
% the voxel dimensions of the respective image ('voxdims' variable).

% Read and store the intensity values of the respective image in 16-bit
% integer:
    vol = int16(fread(fileID, prod(meta(1, 1:3)), 'int16'));

% Reshape the intensity values into a matrix according to the header info:
    vol = reshape(vol, meta(1, 1:3));
    
% Read and store the voxel dimensions of the respective image in 32-bit 
% floating:
    voxdims = fread(fileID, prod(meta(1, 4:5)), 'float');
   
% Reshape the voxel dimensions into a matrix according to the header info:
    voxdims = reshape(voxdims, meta(1, 4:5));
end