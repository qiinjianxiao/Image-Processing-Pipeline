function red = red_interpolation_RI(green, mosaic, mask, h, v, eps)

% R interpolation
tentativeR = guidedfilterR(green, mosaic(:,:,1), mask(:,:,1), h, v, eps);
residualR = ( mosaic(:,:,1) - tentativeR ) .* mask(:,:,1);
H = [1/4,1/2,1/4;1/2,1,1/2;1/4,1/2,1/4];
residualR = imfilter(residualR, H, 'replicate');
red = residualR + tentativeR;

imask = (mask == 0);
red=red.*imask(:,:,1) + mosaic(:,:,1);
end




