clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%upper and lower threshold for edge detection (relative to max gradient
%value)
Threshold = [0.0 0.05];
%width of Gaussian
Sigma = 1;
%apply a certain threshold
[EdgeCanny, Threshold] = edge(Image,'canny', Threshold, Sigma);
imshow(EdgeCanny, [0 255]);