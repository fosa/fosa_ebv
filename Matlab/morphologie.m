clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%define the structure element
StrucElem = strel('rectangle',[2 2]);

%do a dilation (result is binary)
ImageDil = imdilate(Image, StrucElem);

%do an erosion (result is binary)
ImageErode = imerode(Image, StrucElem);

%do a closure
ImageClose = imclose(Image, StrucElem);

%do an opening
ImageOpen = imopen(Image,StrucElem);