clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%using formula
[M, N] = size(Image);
mu = sum(Image(:))/(M*N)

sd = sum((double(Image(:)) - mu).^2)/(M*N);
sd = sqrt(sd)

%with MATLAB function
mu = mean2(Image)
sd = std2(Image)

%using the histogram
[Count, Value] = imhist(Image);
RelCount = Count/sum(Count);
mu = sum(Value .* RelCount)

sd = sum((Value - mu).^2 .* RelCount);
sd = sqrt(sd)