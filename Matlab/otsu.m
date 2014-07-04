clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%get graythreshold (value from 0.0 to 1.0)
Threshold = graythresh(Image);

%make binary image
BW =im2bw(Image,Threshold);