% Read the original RGB image
OGimag = imread('image.jpg');

% Convert it to grayscale
result = rgb2gray(OGimag);

% Create a copy of the grayscale image
result2 = result;

% Thresholding: Set pixels with intensity less than 50 to 0 (black)
result2(result < 50) = 0;

% Thresholding: Set pixels with intensity greater than 150 to 255 (white)
result2(result > 150) = 255;

% Display the original and modified images side by side
subplot(1, 2, 1);
imshow(OGimag);
title('Before'); % Title for the original image

subplot(1, 2, 2);
imshow(result2);
title('After'); % Title for the modified image
