clear 'all';
close 'all';
%read image
Image = imread('sample.png');
 
%LUT for gamma correcture
LUT_Gamma = uint8(255*([0:255]/255).^0.5);

%apply LUT
ImageGammad = intlut(Image, LUT_Gamma);