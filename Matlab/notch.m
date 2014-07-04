clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');
%shortcut
ImgS = size(Image);

SizeFFT = 256;

%do fft calculation
Image_FFT = fft2(Image, SizeFFT, SizeFFT);

%use imtool to find the positions of the frequencies 
%imtool(log(abs(fftshift(Image_FFT))),[]);

NotchPos = [102, 107, 143, 95, 170, 116, 160, 151,114, 165, ...
    90, 143, 140, 185, 118, 70]';

%apply the filter 
Filter  = NotchFilter( size(Image_FFT), NotchPos, 6*ones(1,length(NotchPos)) );

%do the inverse fft
ImageIfft = abs(ifft2(Image_FFT.*fftshift(Filter)));
%chose only the relevant part
ImageFilt = ImageIfft(1:ImgS(1), 1:ImgS(2));
