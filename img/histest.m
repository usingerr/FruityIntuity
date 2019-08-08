im = imread('banana.jpg');

red = im(:,:,1);
green = im(:,:,2);
blue = im(:,:,3);

fuck = 3;
%1 is tomato
%2 is from program
%3 is banana
%4 is slightly overripe banana

if fuck == 1
    redLow = 179;
    redHigh = 226;
    greenLow = 0;
    greenHigh = 112;
    blueLow = 24;
    blueHigh = 78;
elseif fuck == 2
    redLow = 85;
    redHigh = 255;
    greenLow = 0;
    greenHigh = 70;
    blueLow = 0;
    blueHigh = 90;
elseif fuck == 3
    redLow = 66;
    redHigh = 250;
    greenLow = 37;
    greenHigh = 224;
    blueLow = 0;
    blueHigh = 203;
elseif fuck == 4
    redLow = 36;
    redHigh = 201;
    greenLow = 11;
    greenHigh = 179;
    blueLow = 0;
    blueHigh = 141;
end
% make sure to do if statement for which fruit

% red bit
redMask = (red >= redLow) & (red <= redHigh);
greenMask = (green >= greenLow) & (green <= greenHigh);
blueMask = (blue >= blueLow) & (blue <= blueHigh);

figure();
subplot(2, 2, 1);
imshow(redMask, []);
subplot(2, 2, 2);
imshow(greenMask, []);
subplot(2, 2, 3);
imshow(blueMask, []);

mask = uint8(redMask & greenMask & blueMask);
subplot(2, 2, 4);
imshow(mask, []);

