function [ThreshImage, DiffImage, BackGround] = GleitendesMittelFunct(ImageAct, BackGround, Params)

%make everything double
BackGround = double(BackGround);
ImageAct = double(ImageAct);

%calcuate forground estimate
DiffImage = abs(BackGround-ImageAct);  
%estimate new background as sliding average
BackGround = Params.AvgFactor*BackGround+...
    (1-Params.AvgFactor)*ImageAct;  
    
%calculate the threshold image
ThreshImage = DiffImage > Params.Threshold; 