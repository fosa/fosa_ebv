clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%calculate DFT (keep size of image)
Image_FFT = abs(fft2(Image));

%use fftshift to center the DFT
Image_ShiftFFT = fftshift(Image_FFT);

%caluclate the inverse fft
Inv_FFT = abs(ifft2(Image_ShiftFFT));