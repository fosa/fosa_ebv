clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%apply Hanning window
Hann = hann(ImgS(1))*hann(ImgS(2))';
Image_FFT_Ham = fft2(double(Image).*Hann);
imshow(log(abs(fftshift(Image_FFT_Ham))),[]);