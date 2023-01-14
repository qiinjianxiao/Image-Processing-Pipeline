function [img,TMOP]=TMO_pro_Fsac(im,TMOP,k,xc,r)
[M,N,z]=size(im);
phi=pi/3; f=1;
if z==3
    TMOP.phi=pi/3;
    if k~=1
        img=IDR_Fscaling(im,k,xc,phi,f);
    else
        img=im;
    end
    if r~=1
        img=satRGB(img,r);
        img(img>1)=1;
        img(img<0)=0;
    end
  
else
    TMOP.phi=pi/3;
    if k~=1
        img=IDR_Fscaling_t(im,k,xc,phi,f);
    else
        img=im;
    end
    if r~=1
        pattern=TMOP.pattern;
        img=img+1/65535;
        img=satuation_RGGB2(img,r,pattern);
        img(img>1)=1;
        img(img<0)=0;
    end
end