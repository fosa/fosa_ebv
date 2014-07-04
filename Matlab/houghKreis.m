clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%choose the filters
Sobel = 1;
if Sobel == 1
    DX = fspecial('sobel')';
    DY = fspecial('sobel');
else
    DX = fspecial('prewitt')';
    DY = fspecial('prewitt');
end

%apply the DX and DY filter (use symmetric boundary conditions to avoid
%border effects
ImageDx = imfilter(double(Image), DX, 'symmetric');
ImageDy = imfilter(double(Image), DY, 'symmetric');

%calculate the norm of the derviative
ImageDr = sqrt(ImageDx.*ImageDx+ImageDy.*ImageDy);

UseCanny = 1;
if UseCanny == 1
    %apply a certain threshold
    [EdgeCanny, Threshold] = edge(Image,'canny', [0.0 0.1], 1);
    
    %we use both the indices and the x-y-values of the edges
    Indices = find(EdgeCanny ~= 0);
    [Yw, Xw] = find(EdgeCanny ~= 0);
else
    %we require a threshold; the edges could also be chosen with a Canny edge
    %detection in parallel
    Threshold = 0.3*max(max(ImageDr));
    %we use both the indices and the x-y-values of the edges
    Indices = find(ImageDr > Threshold);
    [Yw, Xw] = find(ImageDr > Threshold);
end

%this is the accumulator image
Acc = zeros(size(Image));
%here the range of radius' is chosen
for Radius = 20:30
    Dx = ImageDx(Indices);
    Dy = ImageDy(Indices);
    Dr = ImageDr(Indices);
    if Invert == 1
        xc = Xw+Radius*Dx./Dr;
        yc = Yw+Radius*Dy./Dr;
    else
        xc = Xw-Radius*Dx./Dr;
        yc = Yw-Radius*Dy./Dr;
    end
    %we construct all indices corresponding to a fixed radius
    Inds = round(yc)+size(Image,1)*(round(xc)-1);
    %map out values out of the image boundary
    Inds = Inds(0 < Inds & Inds < prod(size(Image))); 
    %accumulate
    Acc(Inds) = Acc(Inds)+1; 
end