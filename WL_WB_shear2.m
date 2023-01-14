function [cfaImage0,temp,cfaImage,TMOP]=WL_WB_shear2(fileName,TMOP)
RawInfo=imfinfo(fileName);
blackLevel = RawInfo.SubIFDs{1, 1}.BlackLevel;
TiffHandle=Tiff(fileName,'r');
offsets=getTag(TiffHandle,'SubIFD');
setSubDirectory(TiffHandle,offsets(1));

% cfaImage = double(read(TiffHandle));
% Area=RawInfo.SubIFDs{1, 1}.ActiveArea;  
% cfaImage=cfaImage(Area(1)+1:Area(3),Area(2)+1:Area(4));
cfaImage = double(rawread(fileName));


CropSize=RawInfo.SubIFDs{1, 1}.DefaultCropSize;
CropOrigin=RawInfo.SubIFDs{1, 1}.DefaultCropOrigin;
cfaImage=cfaImage(CropOrigin(2)+1:CropOrigin(2)+CropSize(2),CropOrigin(1)+1:CropOrigin(1)+CropSize(1));
cfaImage0=cfaImage;

% white_level=RawInfo.SubIFDs{1, 1}.WhiteLevel;

white_level=RawInfo.SubIFDs{1, 1}.WhiteLevel-blackLevel(1);
white_level=white_level*0.99;
cfaImage = cfaImage - blackLevel(1);
TMOP.blackLevel=blackLevel(1);

temp=cfaImage;
cfaImage(cfaImage<0)=0;
cfaImage(cfaImage>white_level)=white_level;

num=RawInfo.SubIFDs{1, 1}.UnknownTags(2).Value;
pattern=str_model(num);

TMOP.pattern=pattern;
TMOP.white_level=white_level;
% TMOP.AsShotNeutral=[0.6,1,0.6];
TMOP.AsShotNeutral=RawInfo.AsShotNeutral;

