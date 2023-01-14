function rgb_dem=ARI_demosaick_ARI(CFA,pattern,maxc,iteration)
[M,N]=size(CFA);
[mosaic,mask]=UpCFA(CFA,pattern);
eps = 1e-10;
% guidede filter window size
h = 5;
v = 5;
% green interpolation
green = green_interpolation_ARI(mosaic, mask, pattern, eps,iteration);
green = clip(green, 0, maxc);
% red and blue interpolation
red  =  red_interpolation_ARI(green, mosaic, mask, h, v, eps,maxc);
blue = blue_interpolation_ARI(green, mosaic, mask, h, v, eps,maxc);
red = clip(red, 0, maxc);
blue = clip(blue, 0, maxc);
% result image
rgb_dem = zeros(M,N,3);
rgb_dem(:,:,1) = red;
rgb_dem(:,:,2) = green;
rgb_dem(:,:,3) = blue;
rgb_dem=max(rgb_dem,0);