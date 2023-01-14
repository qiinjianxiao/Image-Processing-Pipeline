function reRGB=RGBsat(RGB,r)

[M,N]=size(RGB);
if M~=3
    RGB=RGB';
    N=M;
end
Mcbr=[0.299 0.587 0.114;-0.148,-0.289,0.437;0.615,-0.515,-0.1];
% Mcbr=[0.299 0.587 0.114;  -0.1687 -0.3313 0.5;  0.5 -0.4187 -0.0813];  %YCbCr
YUV=Mcbr*RGB;
gain=[1,r,r]';
gain=repmat(gain,1,N);
YUV=YUV.*gain;
reRGB=Mcbr\YUV;
if M~=3
    reRGB=reRGB';
end
% sRGB=RGBsat_Inv(reRGB,r)
% sYUV=Mcbr*reRGB;
% gain=[1,1/r,1/r]';
% sYUV=sYUV.*gain;
% sreRGB=Mcbr\sYUV;
% fprintf('cece')