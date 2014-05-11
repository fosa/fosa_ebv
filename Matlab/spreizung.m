clear 'all';
close 'all';
%read image
Image = imread('sample.png');
 
%LUT for spreading gray values
LUT_Spread = uint8(([0:255]-50)*2);

%apply LUT
ImageSpread = intlut(Image, LUT_Spread);