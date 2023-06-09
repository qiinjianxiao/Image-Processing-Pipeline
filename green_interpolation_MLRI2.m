function green =  green_interpolation_MLRI2(mosaic,mask,pattern,sigma,maxc)
% mask
imask = (mask == 0);

% raw CFA data
rawq = sum(mosaic, 3);

%%% Calculate Horizontal and Vertical Color Differences %%%
% mask
maskGr = zeros(size(rawq));
maskGb = zeros(size(rawq));
if strcmp(pattern,'grbg')
    maskGr(1:2:size(rawq,1), 1:2:size(rawq,2)) = 1;
    maskGb(2:2:size(rawq,1), 2:2:size(rawq,2)) = 1;
elseif strcmp(pattern,'rggb')
    maskGr(1:2:size(rawq,1), 2:2:size(rawq,2)) = 1;
    maskGb(2:2:size(rawq,1), 1:2:size(rawq,2)) = 1;
elseif strcmp(pattern,'gbrg')
    maskGb(1:2:size(rawq,1), 1:2:size(rawq,2)) = 1;
    maskGr(2:2:size(rawq,1), 2:2:size(rawq,2)) = 1;
elseif strcmp(pattern,'bggr')
    maskGb(1:2:size(rawq,1), 2:2:size(rawq,2)) = 1;
    maskGr(2:2:size(rawq,1), 1:2:size(rawq,2)) = 1;
end

% guide image
Kh = [1/2,0,1/2];
Kv = transpose(Kh);
rawh = imfilter(rawq,Kh,'replicate');
rawv = imfilter(rawq,Kv,'replicate');
Guidegh = mosaic(:,:,2) + rawh .* mask(:,:,1) + rawh .* mask(:,:,3);
Guiderh = mosaic(:,:,1) + rawh .* maskGr;
Guidebh = mosaic(:,:,3) + rawh .* maskGb;
Guidegv = mosaic(:,:,2) + rawv .* mask(:,:,1) + rawv .* mask(:,:,3);
Guiderv = mosaic(:,:,1) + rawv .* maskGb;
Guidebv = mosaic(:,:,3) + rawv .* maskGr;

clear rawh rawv
% tentative image
eps = 0;
h=3;
v=3;
F = [-1,0,2,0,-1];
% horizontal
difR = imfilter(mosaic(:,:,1),F,'replicate');
difGr = imfilter(Guidegh.*mask(:,:,1),F,'replicate');
tentativeRh = guidedfilter1M(Guidegh, mosaic(:,:,1), mask(:,:,1), difGr, difR, mask(:,:,1), h, v, eps);

difGr = imfilter(mosaic(:,:,2).*maskGr,F,'replicate');
difR = imfilter(Guiderh.*maskGr,F,'replicate');
tentativeGrh = guidedfilter1M(Guiderh, mosaic(:,:,2).*maskGr, maskGr, difR, difGr, maskGr, h, v, eps);

difB = imfilter(mosaic(:,:,3),F,'replicate');
difGb = imfilter(Guidegh.*mask(:,:,3),F,'replicate');
tentativeBh = guidedfilter1M(Guidegh, mosaic(:,:,3), mask(:,:,3), difGb, difB, mask(:,:,3), h, v, eps);

difGb = imfilter(mosaic(:,:,2).*maskGb,F,'replicate');
difB = imfilter(Guidebh.*maskGb,F,'replicate');
tentativeGbh = guidedfilter1M(Guidebh, mosaic(:,:,2).*maskGb, maskGb, difB, difGb, maskGb, h, v, eps);

clear Guidegh Guiderh Guidebh
% vertical
F = transpose(F);
difR = imfilter(mosaic(:,:,1),F,'replicate');
difGr = imfilter(Guidegv.*mask(:,:,1),F,'replicate');
tentativeRv = guidedfilter1M(Guidegv, mosaic(:,:,1), mask(:,:,1), difGr, difR, mask(:,:,1), v, h, eps);

difGr = imfilter(mosaic(:,:,2).*maskGb,F,'replicate');
difR = imfilter(Guiderv.*maskGb,F,'replicate');
tentativeGrv = guidedfilter1M(Guiderv, mosaic(:,:,2).*maskGb, maskGb, difR, difGr, maskGb, v, h, eps);

difB = imfilter(mosaic(:,:,3),F,'replicate');
difGb = imfilter(Guidegv.*mask(:,:,3),F,'replicate');
tentativeBv = guidedfilter1M(Guidegv, mosaic(:,:,3), mask(:,:,3), difGb, difB, mask(:,:,3), v, h, eps);

difGb = imfilter(mosaic(:,:,2).*maskGr,F,'replicate');
difB = imfilter(Guidebv.*maskGr,F,'replicate');
tentativeGbv = guidedfilter1M(Guidebv, mosaic(:,:,2).*maskGr, maskGr, difB, difGb, maskGr, v, h, eps);

clear difR difGr difB difGb
% clip 
tentativeGrh = clip(tentativeGrh,0,maxc);
tentativeGrv = clip(tentativeGrv,0,maxc);
tentativeGbh = clip(tentativeGbh,0,maxc);
tentativeGbv = clip(tentativeGbv,0,maxc);
tentativeRh = clip(tentativeRh,0,maxc);
tentativeRv = clip(tentativeRv,0,maxc);
tentativeBh = clip(tentativeBh,0,maxc);
tentativeBv = clip(tentativeBv,0,maxc);

clear Guidegv Guiderv Guidebv
% residual
residualGrh = ( mosaic(:,:,2) - tentativeGrh ) .* maskGr;
residualGbh = ( mosaic(:,:,2) - tentativeGbh ) .* maskGb;
residualRh = ( mosaic(:,:,1) - tentativeRh ) .* mask(:,:,1);
residualBh = ( mosaic(:,:,3) - tentativeBh ) .* mask(:,:,3);
residualGrv = ( mosaic(:,:,2) - tentativeGrv ) .* maskGb;
residualGbv = ( mosaic(:,:,2) - tentativeGbv ) .* maskGr;
residualRv = ( mosaic(:,:,1) - tentativeRv ) .* mask(:,:,1);
residualBv = ( mosaic(:,:,3) - tentativeBv ) .* mask(:,:,3);

% residual linear interpolation
Kh = [1/2,0,1/2];
residualGrh = imfilter(residualGrh,Kh,'replicate');
residualGbh = imfilter(residualGbh,Kh,'replicate');
residualRh = imfilter(residualRh,Kh,'replicate');
residualBh = imfilter(residualBh,Kh,'replicate');
Kv = transpose(Kh);
residualGrv = imfilter(residualGrv,Kv,'replicate');
residualGbv = imfilter(residualGbv,Kv,'replicate');
residualRv = imfilter(residualRv,Kv,'replicate');
residualBv = imfilter(residualBv,Kv,'replicate');

% add tentative image
Grh = ( tentativeGrh + residualGrh ) .* mask(:,:,1);
Gbh = ( tentativeGbh + residualGbh ) .* mask(:,:,3);
Rh = ( tentativeRh + residualRh ) .* maskGr;
Bh = ( tentativeBh + residualBh ) .* maskGb;
Grv = ( tentativeGrv + residualGrv ) .* mask(:,:,1);
Gbv = ( tentativeGbv + residualGbv ) .* mask(:,:,3);
Rv = ( tentativeRv + residualRv ) .* maskGb;
Bv = ( tentativeBv + residualBv ) .* maskGr;

clear maskGr maskGb
clear tentativeGrh tentativeGbh tentativeRh tentativeBh
clear tentativeGrv tentativeGbv tentativeRv tentativeBv
clear residualGrh residualGbh residualRh residualBh
clear residualGrv residualGbv residualRv residualBv

% clip
Grh = clip(Grh,0,maxc);
Grv = clip(Grv,0,maxc);
Gbh = clip(Gbh,0,maxc);
Gbv = clip(Gbv,0,maxc);
Rh = clip(Rh,0,maxc);
Rv = clip(Rv,0,maxc);
Bh = clip(Bh,0,maxc);
Bv = clip(Bv,0,maxc);


clear tentativeRh tentativeBh tentativeGbh tentativeGrh  
clear tentativeRv tentativeBv tentativeGbv 
% vertical and horizontal color difference 
difh = mosaic(:,:,2) + Grh + Gbh - mosaic(:,:,1) - mosaic(:,:,3) - Rh -Bh;
difv = mosaic(:,:,2) + Grv + Gbv - mosaic(:,:,1) - mosaic(:,:,3) - Rv -Bv;

%%% Combine Vertical and Horizontal Color Differences %%%
% color difference gradient
Kh = [1,0,-1];
Kv = transpose(Kh);
difh2 = abs(imfilter(difh,Kh,'replicate'));
difv2 = abs(imfilter(difv,Kv,'replicate'));

% directional weight
K = ones(3,3);
wh = imfilter(difh2,K,'replicate');
wv = imfilter(difv2,K,'replicate'); 
Kw = [1,0,0]; 
Ke = [0,0,1];
Ks = transpose(Ke); 
Kn = transpose(Kw);
Ww = imfilter(wh,Kw,'replicate');
We = imfilter(wh,Ke,'replicate');
Wn = imfilter(wv,Kn,'replicate');
Ws = imfilter(wv,Ks,'replicate');
Ww = 1./(power(Ww,2) + 1E-2);
We = 1./(power(We,2) + 1E-2);
Ws = 1./(power(Ws,2) + 1E-2);
Wn = 1./(power(Wn,2) + 1E-2);

% combine directional color difference
h = fspecial('gaussian', [1,9], sigma);
Ke = [0,0,0,0,1,1,1,1,1] .* h; 
Kw = [1,1,1,1,1,0,0,0,0] .* h;
Ke = Ke / sum(Ke,2);   %sum(x,2)以矩阵x的每一行为对象，对一行内的数字求和。
Kw = Kw / sum(Kw,2);
Ks = transpose(Ke);     %转置
Kn = transpose(Kw);
difn = imfilter(difv,Kn,'replicate');
difs = imfilter(difv,Ks,'replicate');
difw = imfilter(difh,Kw,'replicate');
dife = imfilter(difh,Ke,'replicate');
Wt = Ww+We+Wn+Ws;
dif = (Wn.*difn + Ws.*difs + Ww.*difw + We.*dife) ./ Wt;
green = dif + rawq;
green = green .* imask(:,:,2) + rawq .* mask(:,:,2);
end
