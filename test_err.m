clear all;
path='D:\CFAtoRGB\org_photo\';
name='CNRAW_5';
fileName=[path,name,'.dng'];
TMOP=struct;
DemoMethod='MLRI';Blocks=256;iternum=10;
TMOP.DemoMethod=DemoMethod;TMOP.Blocks=Blocks;TMOP.iternum=iternum;
[temp,img,cfaImage,TMOP]=CFAtoRGB_pre(fileName,DemoMethod,Blocks,iternum,TMOP);
k=2.;xc=0.8;r=1.0;
[image,TMOP]=TMO_pro_Fsac(img,TMOP,k,xc,r);
% image=flip(permute(image,[2,1,3]),1);
figure;imshow(image)
% imwrite(uint8(image*255),[path,name,'.jpg']);
% [re,TMOP]=TMO_pro_Fsac_Inv(image,TMOP,k,xc,r);
% reCFA=CFAtoRGB_pre_Inv(re,TMOP);
% err=reCFA-temp;
% pre=err./temp;
% pre=mean(pre(:));
% max(abs(reCFA(:)-cfaImage(:)))