function reRGB=RGBsat_Inv(RGB,r)

[M,N]=size(RGB);
if M~=3
    RGB=RGB';
    N=M;
end
Mcbr=[0.299 0.587 0.114;  -0.1687 -0.3313 0.5;  0.5 -0.4187 -0.0813];  %YCbCr
YUV=Mcbr*RGB;
gain=[1,1/r,1/r]';
gain=repmat(gain,1,N);
YUV=YUV.*gain;
reRGB=Mcbr\YUV;
if M~=3
    reRGB=reRGB';
end