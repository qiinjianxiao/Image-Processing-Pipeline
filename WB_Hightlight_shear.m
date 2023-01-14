function cfaWB=WB_Hightlight_shear(cfaImage,TMOP)

[M,N]=size(cfaImage);
pattern=TMOP.pattern;
white_level=TMOP.white_level;
whiteBalance=1.0./TMOP.AsShotNeutral;
% maxW=max(whiteBalance(:));
% whiteBalance=whiteBalance/maxW;

whiteBalance=rawpattern(whiteBalance,pattern);
whiteBalance = repmat(whiteBalance,M/2,N/2);
cfaWB = cfaImage .* whiteBalance;
masks=CFA_white_Mask(cfaWB,white_level,pattern);
cfaWB=Nearby_avg_Up4(cfaWB,masks,pattern);