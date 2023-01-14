% clear all
path='E:\new_code_data\download\camera-pipeline-nonUI-master\test\raw\DSC_0053.tiff';
Img=imread(path);
pattern='RGGB';
%%8288*5520

% G=Img(:,:,2);
% maxG=double(max(G(:)));
% te=(16384-400);
% te=te*0.500367;
% ga=2.2;
% te=te^(1/ga);
% scale=maxG/(te);
% Img=double(Img/scale);
% Img(:,:,1)=Img(:,:,1).^(ga);
% Img(:,:,2)=Img(:,:,2).^(ga);
% Img(:,:,3)=Img(:,:,3).^(ga);
% %1.000000 0.500367 0.703152
% Img(:,:,2)=(1/0.500367)*Img(:,:,2);
% Img(:,:,3)=(1/0.703152)*Img(:,:,3);
% CFA=Downsampling(Img,pattern)+400;
G=Img(:,:,2);
maxG=double(max(G(:)));
te=(16384-400);
te=te*0.500367;
ga=2.2;
te=te^(1/ga);
scale=maxG/(te);
Img=double(Img/scale);
Img(:,:,1)=Img(:,:,1).^(ga);
Img(:,:,2)=Img(:,:,2).^(ga);
Img(:,:,3)=Img(:,:,3).^(ga);
%1.000000 0.500367 0.703152
Img(:,:,2)=(1/0.500367)*Img(:,:,2);
Img(:,:,3)=(1/0.703152)*Img(:,:,3);
CFA=Downsampling(Img,pattern)+400;

fileName=[path(1:end-4),'dng'];
RawInfo=imfinfo(fileName);
blackLevel = RawInfo.SubIFDs{1, 1}.BlackLevel;
TiffHandle=Tiff(fileName,'r');
offsets=getTag(TiffHandle,'SubIFD');
setSubDirectory(TiffHandle,offsets(1));
cfaImage = double(rawread(fileName));
CropSize=RawInfo.SubIFDs{1, 1}.DefaultCropSize;
CropOrigin=RawInfo.SubIFDs{1, 1}.DefaultCropOrigin;
% cfaImage=cfaImage(CropOrigin(2)+1:CropOrigin(2)+CropSize(2),CropOrigin(1)+1:CropOrigin(1)+CropSize(1));
d=CFAo-cfaImage;
[m,n]=size(d);
RGB=zeros(uint16(m/2),uint16(n/2));
gd=(d-min(d(:)))/(max(d(:))-min(d(:)));
RGB(:,:,1)=gd(1:2:end,1:2:end);
RGB(:,:,2)=gd(2:2:end,1:2:end);
RGB(:,:,3)=gd(2:2:end,2:2:end);
figure; imshow(RGB);