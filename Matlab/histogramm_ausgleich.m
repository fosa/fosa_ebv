clear 'all';
close 'all';

%read image
Image = imread('sample.png');

[Hist, Val] = imhist(Image);
CumHist = cumsum(Hist)/sum(Hist);

%LUT for histogram equalization
LUT_Equ = uint8(CumHist*255);
%apply LUT
ImageEqu = intlut(Image, LUT_Equ);