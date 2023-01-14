function [cfar,thred,level,L]=reQuantization5(cfa,typ,nbit,Im)
%This is the final version of reQuntization. 

[h,w,d]=size(cfa);

L=round(2^nbit);
delta0=1;  %delta0 is the linear portion of the quantizer, which determines the dynamic range of the final quantized output

if strcmp(typ,'quadratic')
    n = ((2*Im -L) -2*sqrt(Im*Im -Im*L))*2;
    n=floor(n)/2 %%%%%%%%%%%%%%% <================
    if n>0.25
       if floor(n)==n
          level = [0:n,  (2*n+1:L-1+n).^2 /(4*n)];
          thred = [0.5:n,  (2*n+0.5:L-1+n).^2 /(4*n)];
       else
          level = [0:n,  (2*n+0.5:L-1+n).^2 /(4*n)];
          thred = [0.5:n,  (2*n+1:L-1+n).^2 /(4*n)];
       end
    else
       %The first threshold uses only a half quantization step, i.e., the first threshold=0.5delta !!!
       level = (0:L-1).^2;
       thred = (0.5:L-1).^2;
    end
    scl=Im/level(end);
    level=level*scl; thred=thred*scl;
elseif strcmp(typ,'exponential')
    %exponential: =============================================================
    n=1; %assume delta0=1
    r=exp(log(Im/n)/(L-1-n));
    while n*(r-1) < delta0
        n=n+1;
        r=exp(log(Im/n)/(L-1-n));
    end
    level=[0:n   n* r.^(1:L-n-1)];
    thred = (level(1:end-1) +level(2:end)) /2;
elseif  strcmp(typ,'linear')
    %linear: ==================================================================
    delta=Im/(L-1);
    level=0:delta:Im;
    thred = (level(1:end-1) +level(2:end)) /2;
end

%quantization: =========================================
cfar=zeros(h,w);
for ih=1:h
    for iw=1:w
        iL=1;
        while  iL<L  &&  cfa(ih,iw) > thred(iL)
            iL=iL+1;
        end
        cfar(ih,iw) = level(iL);
    end
end
