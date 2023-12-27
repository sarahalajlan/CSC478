% The input image will be saved into the variable "Input."
Input = imread('riceTest.png');

% Creating a figure so I can display all figures in one window.
figure;

% Showing the image before any processing steps.
subplot(2, 3, 1);
imshow(Input);
title('Image before processing');

% Converting the image from RGB to grayscale.
Input2Gray = rgb2gray(Input);

% Showing the converted image.
subplot(2, 3, 2);
imshow(Input2Gray);
title('Grayscale image:');

% Calculate the mode gray level using hist and max. It basically returns the most frequent intensity value. I can either do it manually or use the mode function, which will automatically bring the mode gray level of the image. So, I can replace these three lines with mode = mode(Input2Gray(:)).
[counts, grayLevels] = imhist(Input2Gray); % It returns two arrays: one for the number of pixels in each intensity level and one where we store the different intensity levels.
[~, index] = max(counts); % It returns the index of the intensity level that has the most number of pixels.
mode = grayLevels(index); % Retrieves the intensity level using the index we obtained from the array count.

% Showing the image with its mode gray level.
subplot(2, 3, 3);
imshow(Input2Gray);
hold on;
plot(size(Input2Gray, 2) / 2, size(Input2Gray, 1) / 2, 'r*'); % Mark the center.
title(['Grayscale image with mode: ', num2str(mode)]);
hold off;

% Create a binary mask that highlights pixels with intensity values deviating from the mode of the image by a small margin of 2. 
% This mask combines two arrays of intensity values: one for values lower than the mode minus 2, and another for values higher than the mode plus 2. 
% The purpose of this operation is to identify and capture pixels that are close to the mode but not exactly at the mode. 
% The resulting mask will split the image into two regions: pixels close to the mode (within a margin of 2) will be in white, and the mode itself (representing the background) will be in black.
mask = (Input2Gray < mode - 2) | (Input2Gray > mode + 2);

% Showing the binary mask.
subplot(2, 3, 4);
imshow(mask);
title('Binary mask');

% Performing erosion to separate touching objects using imerode.
SE = strel('disk', 5); % Creates a disk-shaped structuring element where 5 is the radius. I have tried different structures and different radius, and a disk with a radius of 5 gave the best results.
mask = imerode(mask, SE); % Performs the erosion where it uses the structuring element as a template that slides over the binary mask.

% Label connected components in the mask using bwconncomp
cc = bwconncomp(mask); %It searches and labels the connected components, then saves the information of the connected components in the structure cc.
numOfObjects = cc.NumObjects; % It gets the number of the connected components.

% Showing the image before all the processing steps with the number of objects in the image.
subplot(2, 3, 6);
imshow(Input);
title(['Number of objects: ', num2str(numOfObjects)]);
