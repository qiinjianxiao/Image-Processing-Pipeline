reQmethod='quadratic';nbits=3;reQ=6;%%exponential  quadratic linear  reQ==2--new
img=CFAtoRGB_pre_reQ(cfaImage,TMOP,reQ,nbits,reQmethod);
k=3.;xc=0.5;r=1.;
[image,TMOP]=TMO_pro_Fsac(img,TMOP,k,xc,r);
image=flip(permute(image,[2,1,3]),1);
figure;imshow(image)