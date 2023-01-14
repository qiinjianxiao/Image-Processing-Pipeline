function reCFA=WL_WB_Inv(cfaWB,TMOP)
[M,N]=size(cfaWB);
white_level=TMOP.white_level;
pattern=TMOP.pattern;
mask=CFA_white_Mask(cfaWB,white_level,pattern);
imask=(mask==0);
CFA=cfaWB.*imask+white_level*mask;
rewhiteBalance=TMOP.AsShotNeutral;
rewhiteBalance=rawpattern(rewhiteBalance,pattern);
rewhiteBalance = repmat(rewhiteBalance,M/2,N/2);
reCFA=CFA.* rewhiteBalance;