function rgb_dem=ARI_demosaick_MLRI(CFA,pattern,maxc)
[M,N]=size(CFA);
[mosaic,mask]=UpCFA(CFA,pattern);
% guidede filter window size
sigma = 1.4;
% green interpolation
green = green_interpolation_MLRI2(mosaic, mask, pattern, sigma,maxc);
green = clip(green,0,maxc);
% red and blue interpolation
red  =  red_interpolation_MLRI(green, mosaic, mask, maxc);
blue = blue_interpolation_MLRI(green, mosaic, mask,maxc);
red = clip(red,0,maxc);
blue = clip(blue,0,maxc);

% result image
rgb_dem = zeros(M,N,3);
rgb_dem(:,:,1) = red;
rgb_dem(:,:,2) = green;
rgb_dem(:,:,3) = blue;
rgb_dem(rgb_dem<0)=0;