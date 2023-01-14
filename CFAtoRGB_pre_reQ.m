function img=CFAtoRGB_pre_reQ(cfaImage,TMOP,reQ,nbits,reQmethod)

level16=1;
DemoMethod=TMOP.DemoMethod;Blocks=TMOP.Blocks;iternum=TMOP.iternum;
[cfarQuadr,thred,level]=reQuant(cfaImage,reQ,reQmethod,nbits);
cfaWB=WB_Hightlight_shear(cfarQuadr,TMOP);
[imgs,TMOP]=TMO_fore(cfaWB,TMOP,level16);
pattern=TMOP.pattern;
img=Demosaic(imgs,pattern,DemoMethod,255,Blocks,iternum);
img=img/255;