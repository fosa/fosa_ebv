clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%convert to double
Image = double(Image);

%define the filter
Beta = 0.5;
Mask = [0 0 0; 0 1 0; 0 0 0] + Beta * [0 -1 0; -1 4 -1; 0 -1 0];

%apply the filter
ImageEnh = uint8(imfilter(Image, Mask));