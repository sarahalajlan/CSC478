% Read the original RGB image
OGimg = imread('image.jpg');

% Convert it to grayscale
result = rgb2gray(OGimg);

% Flip the grayscale image horizontally (can adjust this as needed)
result = flip(result, 2);

% Display the original and modified images side by side
subplot(1, 2, 1);
imshow(OGimg);
title("Before"); % Title for the original image

subplot(1, 2, 2);
imshow(result);
title("After"); % Title for the modified image
