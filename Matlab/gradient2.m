clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%convert to double
Image = double(Image);

%choose the filters
Sobel = 1;
if Sobel == 1
    DX = fspecial('sobel')';
	DY = fspecial('sobel');
else
    DX = fspecial('prewitt')';
	DY = fspecial('prewitt');
end

%apply the DX and DY filter
ImageDx = imfilter(Image, DX);
ImageDy = imfilter(Image, DY);

%calculate the norm of the derviative
ImageDr = sqrt(ImageDx.^2 + ImageDy.^2);

%determine the angle (atan2 gives back the whole interval ]-pi , pi[ )
Angle = pi+atan2(ImageDy, ImageDx);
%use only those values that are above a given threshold
Angle(ImageDr < threshold) = 0;

%plot
imshow(ImageDr, [0 255]);
imshow(Angle, [0 255]);
map=colormap(jet);
map(1,:) = 0;
colormap(map)
colorbar;