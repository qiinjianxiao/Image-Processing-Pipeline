function red = red_interpolation_MLRI(green, mosaic, mask, maxc)
% parameters for guided upsampling
h = 5;
v = 5;
eps = 0;
imask = ( mask == 0 );

% Laplacian
F = [ 0, 0,-1, 0, 0;
      0, 0, 0, 0, 0;
     -1, 0, 4, 0,-1;
      0, 0, 0, 0, 0;
      0, 0,-1, 0, 0];
lap_red = imfilter(mosaic(:,:,1), F, 'replicate');
lap_green = imfilter(green.*mask(:,:,1), F, 'replicate');

% R interpolation
tentativeR = guidedfilter1M(green, mosaic(:,:,1), mask(:,:,1), lap_green, lap_red, mask(:,:,1), h, v, eps);
tentativeR = clip(tentativeR,0,maxc);
residualR = mask(:,:,1).*(mosaic(:,:,1)-tentativeR);
% Bilinear interpoaltion
H = [1/4, 1/2, 1/4;
     1/2,  1 , 1/2;
     1/4, 1/2, 1/4];
residualR = imfilter(residualR, H, 'replicate');
red = residualR + tentativeR;
red = red.*imask(:,:,1) + mosaic(:,:,1);
end
