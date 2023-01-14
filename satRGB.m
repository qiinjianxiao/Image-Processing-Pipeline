function imgR=satRGB(img,r)
ru=r;rv=r;
[M,N,z]=size(img);

Mcbr=[0.299 0.587 0.114;  -0.1687 -0.3313 0.5;  0.5 -0.4187 -0.0813];  %YCbCr
YUV=reshape(img,M*N,3)';   YUV=Mcbr*YUV;

YUV(1,:)=YUV(1,:);
YUV(2,:)=YUV(2,:)*ru;
YUV(3,:)=YUV(3,:)*rv;
imgR=Mcbr\YUV;
imgR=reshape(imgR',M,N,3);
