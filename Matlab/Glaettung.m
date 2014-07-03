clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%convert to double
Image = double(Image);

%apply a filter of size 2x2
ImageFiltered = imfilter(Image,ones(2)/4);
imshow(Image1,[0 255]);