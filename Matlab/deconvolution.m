clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%construct the maks
Mask = fspecial('gaussian',7,10);

%sigma of added gaussian noise
V = .000;

%apply noise and blur
BlurredNoisy = imnoise(imfilter(Image,Mask),'gaussian',0, V);

%image buffer for the result
WT = zeros(size(Image));
WT(5:end-4,5:end-4) = 1;

%we assume to now only the size of the mask
InitMask = ones(size(Mask));
%perform deconvolution (P - recovered Mask, J - deblurred Image)
[J P] = deconvblind(double(BlurredNoisy),InitMask, 20,10*sqrt(V),WT);