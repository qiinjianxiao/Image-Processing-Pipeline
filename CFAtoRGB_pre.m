function [img,cfaImage0,cfaImage,TMOP]=CFAtoRGB_pre(fileName,DemoMethod,Blocks,iternum,TMOP)
level16=0;
[cfaImage0,temp,cfaImage,TMOP]=WL_WB_shear2(fileName,TMOP);
cfaWB=WB_Hightlight_shear(cfaImage,TMOP);
[imgs,TMOP]=TMO_fore(cfaWB,TMOP,level16);
% img=imgs/255;
pattern=TMOP.pattern;
tic
img=Demosaic(imgs,pattern,DemoMethod,255,Blocks,iternum);
time=toc
TMOP.time=time;
img=img/255;