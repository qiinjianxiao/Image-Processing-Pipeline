clear all;
img='F:\photo\test\figure\eight\DSC01434.DNG'; 
Info=imfinfo(img); %choose a  image from DSC01019, DSC_0312, DSC_0016z6 or CaptureOneSession0020
TiffHandle=Tiff(img,'r');
offsets=getTag(TiffHandle,'SubIFD');
setSubDirectory(TiffHandle,offsets(1));
CFA=read(TiffHandle);
[h,w]=size(CFA);

bk_lev=Info.SubIFDs{1}.BlackLevel %%%%%%%%%%%%%%%%%%%%%%%
img0=double(CFA-bk_lev(1));
maxV=max(img0(:));
img0=uint16(65536*(img0/maxV));
Img_save='F:\photo\test\figure\eight\color_borad.png';
imwrite(img0,Img_save);
figure;imshow(img0);
