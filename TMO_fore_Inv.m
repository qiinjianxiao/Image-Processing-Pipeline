function [De,TMOP]=TMO_fore_Inv(im,TMOP)
[M,N,z]=size(im);
f=1; 
if z==3
    maxt=TMOP.maxt;
    m=TMOP.m;
    lav=TMOP.lav;
%     max_im=TMOP.max_im;
%     min_im=TMOP.min_im;
%     im=im*max_im+(1-im)*min_im;%reNoramal
    hdrR=zeros(M,N,3); ldrR=zeros(M,N,3); 
    for ia=1:3
       [ hdrR(:,:,ia), ldrR(:,:,ia) ] = tmo2_mod2( im(:,:,ia), f, lav, m, maxt );
    end
    De=(hdrR./255.0).*maxt; 
else
%     maxc=TMOP.max_im;
%     minc=TMOP.min_im;
%     im=im*maxc+(1-im)*minc;%reNormaling
    lav=TMOP.lav;m=TMOP.m;maxt=TMOP.maxt;
    hdrR = tmo2_mod2(im, f, lav, m, maxt );
    De=(hdrR./255.0).*maxt;
end