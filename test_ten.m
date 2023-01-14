path='F:\photo\test\figure\ten';
files=dir(fullfile(path,'*.dng'));
files_dng=files;
WB=[];
for nn=1:length(files)
    fileName=fullfile(files(nn).folder,files(nn).name);
    RawInfo=imfinfo(fileName);
    blackLevel = RawInfo.SubIFDs{1, 1}.BlackLevel;
    TiffHandle=Tiff(fileName,'r');
    offsets=getTag(TiffHandle,'SubIFD');
    setSubDirectory(TiffHandle,offsets(1));
    wb=RawInfo.AsShotNeutral;
    WB=[WB;wb];
end
region_shear
