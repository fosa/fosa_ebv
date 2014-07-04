function Threshold = OwnOtsu(Image)


%determine image histogram
[Hist, Vals]=imhist(Image);

%normalize it
Hist = Hist/sum(Hist);


%define mean
Mean = Hist.*[0:255]';

%apply Otsu's method
Thresh = [];
%loop over grey values
for Ind = 1:255
    %proability for class 0
    w0 = sum(Hist(1:Ind));
    %proability for class 1
    w1 = sum(Hist(Ind+1:end));
    %mean for class 0
    m0 = sum(Mean(1:Ind))/w0;
    %mean for class 1
    m1 = sum(Mean(Ind+1:end))/w1;
    %store the intra-class probability for this threshold
    Thresh = [Thresh, w0*w1*(m0-m1)^2];
end

%find the maximum value
[MaxThresh, MaxVal]=max(Thresh);
%have to subtract one because we used the index of [0 255]
Threshold = MaxVal-1;