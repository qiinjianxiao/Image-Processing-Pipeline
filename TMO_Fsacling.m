function [img,im2,TMOP]=TMO_Fsacling(tem,TMOP,k,xc,r,rm)
[M,N,z]=size(tem);
phi=pi/3; f=1;
if z==3
    [lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter(tem, 1 );
    im=zeros(M,N,3);
    maxm=max(max(max(tem)));
    hdr255=tem./maxm.*255.0; 
    if rm~=0
        m=rm;
    end
    for ia=1:3
          img = tmo_mod2( hdr255(:,:,ia), lav, m, f, maxm ); %im
          im(:,:,ia)=img;
    end
    min_im=min(im(:));max_im=max(im(:));
    im=(im-min_im)/(max_im-min_im);
    TMOP.maxm=maxm;
    TMOP.max_im=max_im;
    TMOP.min_im=min_im;
    TMOP.m=m;
    TMOP.lav=lav;
    im2=im;
    TMOP.f=1; TMOP.phi=pi/3;
    if k~=1
        img=IDR_Fscaling(im,k,xc,phi,f);
    else
        img=im;
    end
    if r~=0
        img=satRGB(img,r);
        img(img>1)=1;
        img(img<0)=0;
    end
    
else
    [lav, llav, m, maxy, miny, maxl, minl] = GetTMOParameter(tem, 1);
    maxm=max(max(tem));
    hdr255=tem./maxm.*255.0; 
    if rm~=0
        m=rm;
    end
    im = tmo_mod2( hdr255, lav, m, f, maxm ); %im
    min_im=min(im(:));
    max_im=max(im(:));
    im=(im-min_im)/(max_im-min_im);
    im2=im;
    TMOP.maxm=maxm;
    TMOP.max_im=max_im;
    TMOP.min_im=min_im;
    TMOP.m=m;
    TMOP.lav=lav;
    TMOP.f=1; TMOP.phi=pi/3;
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