clear all;
path='F:\photo\test\figure\five\nr\*.dng';
files=dir(path);
BL=[];WL=[];maxL=[];
for nn=13:length(files)
    fileName=fullfile(files(nn).folder,files(nn).name);
    RawInfo=imfinfo(fileName);
    blackLevel = RawInfo.SubIFDs{1, 1}.BlackLevel;
    TiffHandle=Tiff(fileName,'r');
    offsets=getTag(TiffHandle,'SubIFD');
    setSubDirectory(TiffHandle,offsets(1));
    white_level=RawInfo.SubIFDs{1, 1}.WhiteLevel;
    cfaImage = double(rawread(fileName));
    maxVa=max(cfaImage(:));
    BL=[BL;blackLevel];
    WL=[WL;white_level];
    maxL=[maxL;maxVa];
end