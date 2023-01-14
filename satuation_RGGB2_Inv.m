function cfaSAT=satuation_RGGB2_Inv(CFA,r,pattern)
[M,N,z]=size(CFA);
M2=M/2;N2=N/2;
RGGB=Down_Sampling(CFA,pattern);
RGB=zeros(M2,N2);
RGB(:,:,1)=RGGB(:,:,1);
RGB(:,:,2)=RGGB(:,:,2);
RGB(:,:,3)=RGGB(:,:,4);
G2=RGGB(:,:,3);


% mask=(abs(RGB(:,:,2))>abs(G2));
% imask=(mask==0);
% RGB(:,:,2)=RGB(:,:,2).*mask+G2.*imask;
% G2=G2.*mask+RGB(:,:,2).*imask;
% 
% RGGB(:,:,1:2)=RGB(:,:,1:2);
% RGGB(:,:,3)=G2;
% RGGB(:,:,4)=RGB(:,:,3);
% cfaSAT=Up_Sampling(RGGB,pattern);

mask=(abs(RGB(:,:,2))>=abs(G2));
imask=(mask==0);
tem=RGB;
RGB(:,:,2)=RGB(:,:,2).*mask+G2.*imask;
G2=G2.*mask+tem(:,:,2).*imask;
RGB=reshape(RGB,M2*N2,3)';
reRGB=RGBsat_Inv(RGB,r);
RGB=reshape(RGB',M2,N2,3);
reRGB=reshape(reRGB',M2,N2,3);
pro=reRGB(:,:,2)./RGB(:,:,2);
tem=reRGB;
G2=G2.*pro;
reRGB(:,:,2)=tem(:,:,2).*mask+G2.*imask;
G2=G2.*mask+tem(:,:,2).*imask;


RGGB(:,:,1:2)=reRGB(:,:,1:2);%%change
RGGB(:,:,3)=G2;
RGGB(:,:,4)=reRGB(:,:,3);
cfaSAT=Up_Sampling(RGGB,pattern);
