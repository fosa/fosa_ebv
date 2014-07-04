clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%apply a median filter
ImageMedian = medfilt2(ImageNoise, [3 3]);
ImageMedian = ordfilt2(ImageNoise, 5, ones(3,3));

%apply a min filter
ImageMin = ordfilt2(ImageNoise, 1, ones(3,3));

%apply a max filter
ImageMax = ordfilt2(ImageNoise, 9, ones(3,3));