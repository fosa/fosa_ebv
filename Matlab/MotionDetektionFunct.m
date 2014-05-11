function [ThreshImage, DiffImage] = MotionDetektionFunct(ImageAct, ImageOld)

global Threshold

%this is the threshold value (chosen manually)
Threshold = 15;

%cast
ImageAct = double(ImageAct);
ImageOld = double(ImageOld);

%calcuate difference image
DiffImage = (255 + ImageAct - ImageOld)/2;

%calculate the threshold image
ThreshImage = (abs(DiffImage-128) > Threshold);

DiffImage = uint8(DiffImage);