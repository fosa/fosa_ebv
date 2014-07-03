clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%convert to double
Image = double(Image);

%choose the filters
Sobel = 1;
if Sobel == 1
    DX = [1;2;1] * [-1 0 1];
    DY = DX';
else
    DX = ones(3,1) * [-1 0 1];
    DY = DX';
end

%apply the DX and DY filter
ImageDx = uint8(128+imfilter(Image, DX));
ImageDy = uint8(128+imfilter(Image, DY));