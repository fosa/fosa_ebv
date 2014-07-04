clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

% Detect the edges, the result is a binary image
EdgeCanny = edge(Image, 'canny', [0 0.1], 1);

% Hough transformation, calculate the accumulator Hough
[Hough, Alpha, Rho] = hough(EdgeCanny,'RhoResolution', 2,'Theta',-90:2:89.5);

% Find at most 5 peaks with threshold 15 and minimim distance of 15, 15
% pixel
NumPeaks = 5;
HoughPeaks = houghpeaks(Hough, NumPeaks,'Threshold',5,'NHoodSize',[15,15]);

% Find the lines that correspond to the peaks; fill gabs of 15 pixel and
% suppress all (merged lines) that have a length less than 30 pixel
Lines = houghlines(EdgeCanny, Alpha, Rho, HoughPeaks, 'FillGap', 15, 'MinLength', 50);