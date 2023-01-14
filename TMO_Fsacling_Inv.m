function De=TMO_Fsacling_Inv(img,TMOP,k,xc,r)
[M,N,z]=size(img);
f=1; phi=pi/3; 
if z==3
    if r~=1
        img=satRGB_Inv(img,r);
    end
    L=10000;
    idr=IDR_Fscaling_inv(img,k,xc,phi,f,L);
%     max(idr(:)-im2(:))
    maxm=TMOP.maxm;
    max_im=TMOP.max_im;
    min_im=TMOP.min_im;
    m=TMOP.m;
    lav=TMOP.lav;
    idr=idr*max_im+(1-idr)*min_im;%reNoramal
    hdrR=zeros(M,N,3); ldrR=zeros(M,N,3); 
    for ia=1:3
       [ hdrR(:,:,ia), ldrR(:,:,ia) ] = tmo2_mod2( idr(:,:,ia), f, lav, m, maxm );
    end
    De=(hdrR./255.0).*maxm; 
else
    pattern=TMOP.pattern;
    if r~=1
        cfaSAT=satuation_RGGB2_Inv(img,r,pattern);
        cfaSAT=cfaSAT-1/65535;
        cfaSAT(cfaSAT<1e-8)=0;
    else
        cfaSAT=img;
    end
    L=10000;
    f=TMOP.f;phi=TMOP.phi;
    imf=cfaSAT;
    if k~=1
        imf=IDR_Fscaling_inv_t(imf,k,xc,phi,f,L);
    end
    maxc=TMOP.max_im;
    minc=TMOP.min_im;
    
%     max(imf(:)-im2(:))
    im=imf*maxc+(1-imf)*minc;%reNormaling

    lav=TMOP.lav;m=TMOP.m;maxm=TMOP.maxm;
    hdrR = tmo2_mod2(im, f, lav, m, maxm );
    % max(abs(hdrR(:)-img1(:)))
    De=(hdrR./255.0).*maxm;
end