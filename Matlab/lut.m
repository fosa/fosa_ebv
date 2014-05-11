clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%LUT for inverse image
LUT_Inv = uint8([255:-1:0]);

%apply LUT
ImageInv = intlut(Image, LUT_Inv);

%LUT for screener
LUT_Scr = uint8(1.5*[0:255]);

%apply LUT
ImageScr = intlut(Image, LUT_Scr);