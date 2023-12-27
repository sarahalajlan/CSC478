% Read the image and convert it to a binary image so that we can distinguish the coins from the background.
binaryImage = im2bw(imread('coins.png'));

% Subplot 1: Display the binary image
subplot(2, 3, 1);
imshow(binaryImage);
title('Binary image');

% % Filling in holes within a binary image is a vital step. It enables us to accurately identify and analyze connected components, separate objects from the background, and ensures that objects remain complete for further processing.
filledImage = imfill(binaryImage, 'holes');

% Subplot 2: Display the image after filling holes
subplot(2, 3, 2);
imshow(filledImage);
title('Image after filling holes');

%The 'bwlabel' function is employed to label connected components in the binary image.
% Each labeled region corresponds to a distinct object, and 'numObjects' stores the total count.
% This labeling step is essential for subsequent object-specific analysis and identification.
[labeledImage, numObjects] = bwlabel(double(filledImage));

% The 'regionprops' function is employed to extract specific properties, such as 'Area' (representing object size)
% and 'Centroid' (providing the center of mass coordinates), for each labeled object in the image. 
% These properties are stored in a structure array ('props') and are used later on for object identification.
props = regionprops(labeledImage, 'Area', 'Centroid');

% Initialize counters for coins of Dime and Nickel and show the original image with coin areas
countDime = 0;
countNickel = 0;
subplot(2, 3, 3);
imshow(imread('coins.png'));
title('Image with each coins area');

hold on

% Loop through each coin's properties
for n = 1: size(props, 1)
    centroid = props(n).Centroid; %gets the centroid information of the nth element 
    X = centroid(1); %retrives X coordinates
    Y = centroid(2);%retrives Y coordinates
    
    % Display the size (area) of each coin
    text(X - 20, Y, ['Area:', num2str(props(n).Area)], 'Color' , 'Cyan', 'FontWeight', 'bold');
end

% Subplot 4: Display the image with marked coins. After distinguishing between the two types of coins, I will use the area of the coins to my advantage to differentiate between them.
subplot(2, 3, 4);
imshow(imread('coins.png'));
title('Image with Marked Coins');

for n = 1:size(props, 1)
    centroid = props(n).Centroid;  % gets the centroid information of the nth element 
    X = centroid(1); % retrieves X coordinates
    Y = centroid(2); % retrieves Y coordinates
    
    % Determine if the coin is a Nickel or a Dime based on its area.
    % if its gretaer than 2000 than its a nickle otherwise its a dime
    if props(n).Area > 2000
        text(X - 10, Y, 'N', 'Color', 'blue' , 'FontWeight', 'bold'); % Marks Nickels with blue N
        rectangle('Position', [X - 20, Y - 20, 40, 40], 'EdgeColor', 'b', 'LineWidth', 2); % Add a blue bounding box
        countNickel = countNickel + 1; 
    else
        text(X - 10, Y, 'D', 'Color', 'cyan' , 'FontWeight', 'bold'); % Marks Dimes with cyan D
        rectangle('Position', [X - 20, Y - 20, 40, 40], 'EdgeColor', 'c', 'LineWidth', 2); % Add a light blue bounding box
        countDime = countDime + 1;
    end
end



totalCoins = n; % Get the total number of coins

% Subplot 6: Display the total number of coins, Number of coins for Nickles and Dimes
subplot(2, 3, 6);
imshow(imread('coins.png'));
title(strcat('Number of Coins = ', num2str(totalCoins), '  Nickles = ', num2str(countNickel), '  Dimes = ', num2str(countDime)));
hold off
