clear all;
fileName='F:\photo\test\figure\five\CNRAW_5.dng';
TMOP=struct;
DemoMethod='MLRI';Blocks=256;iternum=10;
TMOP.DemoMethod=DemoMethod;TMOP.Blocks=Blocks;TMOP.iternum=iternum;
[img,cfaImage0,cfaImage,TMOP]=CFAtoRGB_pre(fileName,DemoMethod,Blocks,iternum,TMOP);

cfaImage0(cfaImage0<TMOP.blackLevel)=TMOP.blackLevel;

recfa=cfaImage;
wl_org=TMOP.white_level/0.99+TMOP.blackLevel;
wl_org=uint16(wl_org);
white_level=TMOP.white_level+TMOP.blackLevel;
white_level=uint16(white_level);
di=0.5*(wl_org-white_level);
d=uint16(di);
recfa=uint16(recfa+TMOP.blackLevel);
recfa(recfa==white_level)=(white_level+di);
diff=double(recfa)-cfaImage0;
% diff(diff>0)=0;
dif=abs(diff);
% figure;imshow(dif/max(dif(:)));
RGGB=Down_Sampling(dif,TMOP.pattern);
max(diff(:))
min(diff(:))
[h,w]=find(diff<-0.01);
[h2,w2]=find(diff>0.01);
dif=round(dif);cfaImage0=round(cfaImage0);
pro=dif./cfaImage0;
k=find(pro>0);
t=pro(k);
pre_hist
% figure;imshow(double(diff)/max(double(diff(:))));
% k=2.;xc=0.5;r=1.;
% [image,TMOP]=TMO_pro_Fsac(img,TMOP,k,xc,r);
% % image=flip(permute(image,[2,1,3]),1);
% % figure;imshow(image)
% 
% [filepath,name,ext] = fileparts(fileName);
% tem=['_k',uint8(k*10),'_xc',uint8(xc*10),'_r',uint8(r*10)];
% rename=[name,tem,ext];
% Img_save=fullfile(filepath,rename);
% imwrite(uint16(image*65535),Img_save);

% [re,TMOP]=TMO_pro_Fsac_Inv(image,TMOP,k,xc,r);
% reCFA=CFAtoRGB_pre_Inv(re,TMOP);
% % diff=uint16(abs(reCFA-cfaImage));
% cfaImage2=cfaImage0-TMOP.blackLevel;
% diff=uint16(abs(reCFA-cfaImage2));
% max(diff(:))
% max(abs(reCFA(:)-cfaImage(:)))
% Img_save='D:\CFAtoRGB\save\re.png';
% imwrite(uint16(image*65535),Img_save)