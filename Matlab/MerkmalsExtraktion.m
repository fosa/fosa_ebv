clear 'all'; close 'all'; format compact;

%read image
Image = imread('sample.png');

%do labeling (use 8 neighbors, the default)
[LabelImage, NumberLabels] = bwlabel(Image);

%do feature extraction 
Prop = regionprops(LabelImage,'Area','Centroid', 'Orientation', 'BoundingBox', 'ConvexHull');
%the result is the structure array Prop, with NumLabels x 1 entries 

for Ind=1:size(Prop,1) 
	%%Area
	Area=Prop(Ind).Area;
	%%Center
    Cent=Prop(Ind).Centroid;
    X=Cent(1);Y=Cent(2);
	%%ConvexHull
	Xv = Prop(Ind).ConvexHull(:,1);
    Yv = Prop(Ind).ConvexHull(:,2);
    line(Xv, Yv, 'LineWidth',1,'Color',[1 0 0]);
	%%Orientation
	Orient = Prop(Ind).Orientation;
	%draw a line through the centroid with given orientation
    Len = sqrt(Prop(Ind).Area);
    Shift = Len*exp(-i*pi*Orient/180);
    line([X-real(Shift) X+real(Shift)], [Y-imag(Shift) Y+imag(Shift)], 'Color', [0 1 0]);
	%%BoundingBox
	BBox = Prop(Ind).BoundingBox;
    %construct the bounding box using line or rectangle
    rectangle('Position', BBox, 'EdgeColor',[0 1 0]);
end