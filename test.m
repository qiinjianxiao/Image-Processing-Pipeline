clear all;
fileName='F:\photo\test\figure\nine\CNRAW_5_k20_xc50_r10.dng';
TMOP=struct;
DemoMethod='MLRI';Blocks=256;iternum=10;
TMOP.DemoMethod=DemoMethod;TMOP.Blocks=Blocks;TMOP.iternum=iternum;
[img,cfaImage0,cfaImage,TMOP]=CFAtoRGB_pre(fileName,DemoMethod,Blocks,iternum,TMOP);
% imwrite(uint16(img*65535),'F:\photo\test\figure\nine\org1_fu.png');
k=3.;xc=0.2;r=1.0;
[image,TMOP]=TMO_pro_Fsac(img,TMOP,k,xc,r);
image=flip(permute(image,[2,1,3]),1);
% figure;imshow(image)
imwrite(uint16(img*65535),'F:\photo\test\figure\nine\org1_k20_xc20_r10.png');

[filepath,name,ext] = fileparts(fileName);
tem=['_k',num2str(uint8(k*10)),'_xc',num2str(uint8(xc*10)),'_r',num2str(uint8(r*10))];
rename=[name,tem,'.png'];
Img_save=fullfile(filepath,rename);
imwrite(uint16(image*65535),Img_save);

% [re,TMOP]=TMO_pro_Fsac_Inv(image,TMOP,k,xc,r);
% reCFA=CFAtoRGB_pre_Inv(re,TMOP);
% % diff=uint16(abs(reCFA-cfaImage));
% cfaImage2=cfaImage0-TMOP.blackLevel;
% diff=uint16(abs(reCFA-cfaImage2));
% max(diff(:))
% max(abs(reCFA(:)-cfaImage(:)))
% Img_save='D:\CFAtoRGB\save\re.png';
% imwrite(uint16(image*65535),Img_save)