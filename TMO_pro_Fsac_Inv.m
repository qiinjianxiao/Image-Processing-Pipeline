function [img,TMOP]=TMO_pro_Fsac_Inv(im,TMOP,k,xc,r)
f=1; phi=pi/3; 
[M,N,z]=size(im);
if z==3
    if r~=1
        img=satRGB_Inv(im,r);
    else
        img=im;
    end
    L=100000;
    img=IDR_Fscaling_inv(img,k,xc,phi,f,L);

else
    pattern=TMOP.pattern;
    if r~=1
        img=satuation_RGGB2_Inv(im,r,pattern);
        img=img-1/65535;
        img(img<1e-8)=0;
    else
        img=im;
    end
    L=100000;
    f=TMOP.f;phi=TMOP.phi;
    if k~=1
        img=IDR_Fscaling_inv_t(img,k,xc,phi,f,L);
    end

end