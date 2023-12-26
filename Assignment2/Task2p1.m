% Loading the image
image = imread('HW2.jpeg');
% Convert the image to grayscale if needed
image = rgb2gray(image);
% Perform 2D Fourier transform
imageFft = fft2(image);
% Create a filter in the frequency domain
% Can adjust the filter shape and size based on your requirements
filter = fspecial('gaussian', size(image), 30);
% Apply the filter in the frequency domain
FilteredImageFft = imageFft .* fftshift(filter);
% Perform the inverse Fourier transform to get the smoothed image
SmoothedImageUsingFrequency = ifft2(FilteredImageFft);
% Define the standard deviation for the Gaussian filter
sigma = 2;
% Apply Gaussian smoothing using spatial domain filtering
SmoothedImageUsingSpatial = imgaussfilt(image, sigma);
% Create a figure to display all four images
figure;
% Create a subplot for the image before smoothing 
subplot(1, 3, 1); 
% Display the original image
imshow(image); 
% Setting a title for the subplot
title('Image before smoothing'); 
% Create a subplot for the smoothed image (frequency domain)
subplot(1, 3, 2); 
 % Display the smoothed image (frequency domain)
imshow(abs(SmoothedImageUsingFrequency), []);
% Setting a title for the subplot
title('Frequency domain'); 
% Create a subplot for the smoothed image (spatial domain)
subplot(1, 3, 3); 
% Display the smoothed image (spatial domain)
imshow(SmoothedImageUsingSpatial); 
% Setting a title for the subplot
title('Spatial domain'); 
