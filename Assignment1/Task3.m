% Read the original RGB image
originalImage = imread('image.jpg');

% Convert it to grayscale
grayscaleImage = rgb2gray(originalImage);

% Perform histogram equalization
equalizedImage = histeq(grayscaleImage);

% Display the grayscale image at the top left
subplot(2, 2, 1);
imshow(grayscaleImage);
title('Grayscale Image');

% Display the equalized image at the top right
subplot(2, 2, 2);
imshow(equalizedImage);
title('Equalized Grayscale Image');

% Compute and display the histogram of the grayscale image at the bottom left
subplot(2, 2, 3);
imhist(grayscaleImage);
title('Histogram of Grayscale Image');

% Compute and display the histogram of the equalized image at the bottom right
subplot(2, 2, 4);
imhist(equalizedImage);
title('Histogram of Equalized Grayscale Image');