%% MATLAB CW - SN: 17052580
%% Task 2.1
%%

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

% The Gaussian pdf function as described in the coursework specification:
function p = gaussian_pdf(x, u, S)
    p = (1/((2 * pi)^(3 / 2) * sqrt(det(S)))) * exp((-1 / 2) .* ...
    ((x - u).') * inv(S) * (x - u));
end