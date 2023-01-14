function cfaSAT=satuation_RGGB2(CFA,r,pattern)
[M,N,z]=size(CFA);
M2=M/2;N2=N/2;
RGGB=Down_Sampling(CFA,pattern);
RGB1=zeros(M2,N2);
RGB2=zeros(M2,N2);
RGB1(:,:,1)=RGGB(:,:,1);
RGB1(:,:,2)=RGGB(:,:,2);
RGB1(:,:,3)=RGGB(:,:,4);

RGB2(:,:,1)=RGGB(:,:,1);
RGB2(:,:,2)=RGGB(:,:,3);
RGB2(:,:,3)=RGGB(:,:,4);
% 
% [img,G2,mask_forg]=ComY_RGB2YUV(RGB1,RGB2,r);
% imask=(mask_forg==0);
% RGGB(:,:,1)=img(:,:,1);
% RGGB(:,:,2)=img(:,:,2).*mask_forg+G2.*imask;
% RGGB(:,:,3)=G2.*mask_forg+img(:,:,2).*imask;
% RGGB(:,:,4)=img(:,:,3);
% cfaSAT=Up_Sampling(RGGB,pattern);
mask=(RGB1(:,:,2)>=RGB2(:,:,2));
imask=(mask==0);
reRGB1=RGBsat(reshape(RGB1,M2*N2,3)',r);
reRGB2=RGBsat(reshape(RGB2,M2*N2,3)',r);
reRGB1=reshape(reRGB1',M2,N2,3);
reRGB2=reshape(reRGB2',M2,N2,3);
pro1=reRGB1(:,:,2)./RGB1(:,:,2);
pro2=reRGB2(:,:,2)./RGB2(:,:,2);

RGGB(:,:,1)=reRGB1(:,:,1).*mask+reRGB2(:,:,1).*imask;
RGGB(:,:,2)=reRGB1(:,:,2).*mask+pro2.*RGB1(:,:,2).*imask;
RGGB(:,:,3)=pro1.*RGB2(:,:,2).*mask+reRGB2(:,:,2).*imask;
mask_eq=(abs(RGGB(:,:,3)-RGGB(:,:,2))>1e-12);
imask_eq=(mask_eq==0);
RGGB(:,:,3)=RGGB(:,:,3).*mask_eq+RGGB(:,:,2).*imask_eq;
RGGB(:,:,4)=reRGB1(:,:,3).*mask+reRGB2(:,:,3).*imask;
cfaSAT=Up_Sampling(RGGB,pattern);

% mask1=(abs(RGGB(:,:,2))>=abs(RGGB(:,:,3)));
% max(abs(mask(:)-mask1(:)))