function [cfar,thred,level,L]=reQuantization(cfa,typ,nbit,Im)
%New codes on re-quantization. Refer to "notes_reQuantization.pdf" for details.


[h,w,d]=size(cfa);
cfa=cfa+0.5; %The original values should be at the center point of each quantization step
Im=Im+1; %plus 0.5 at both the darkest and the brightest level
%Im=17

L=round(2^nbit);
delta0=1;  %delta0 is the linear portion of the quantizer, which determines the dynamic range of the final quantized output

if strcmp(typ,'quadratic')
    n = (2*Im -L) -2*sqrt(Im*Im -Im*L);
    n=floor(n);
    if n>0.5
       thred = [0:n,  (2*n+1:L+n).^2 /(4*n)];
       scl=Im/thred(end);
       ds=(1-scl)/(L-n-1);
       scl=1:-ds:scl;
       thred(n+2:end) = thred(n+2:end).*scl;
       level = (thred(2:end)+thred(1:end-1))/2;
    else
       thred = [0  0.5:L-0.5].^2;
       level = (0:L-1).^2;
       scl=Im/thred(end);    thred=thred*scl;    level=level*scl +0.5;
       
%         thred=(0:L).^2;
%         level = thred(1:L) +(0:L-1);
%         scl=Im/thred(end);    thred=thred*scl;    level=level*scl +0.5;
    end
%     level = (thred(2:end)+thred(1:end-1))/2;
elseif strcmp(typ,'exponential')
    %exponential: =============================================================
    n=1; %assume delta0=1
    r=exp(log(Im/n)/(L-n));
    while n*(r-1) < delta0
        n=n+1;
        r=exp(log(Im/n)/(L-n));
    end
    thred=[0:n   n* r.^(1:L-n)];
    
%     r=exp(log(Im/(n*delta0))/(L-n));
%     while n*delta0*(r-1) < delta0
%         n=n+1;
%         r=exp(log(Im/(n*delta0))/(L-n));
%     end
%     ctr=log(2/(1+1/r))/log(r);
%     if Im/(n*delta0)==1, ctr=1; end
%     thred=[0:delta0:n*delta0   n*delta0* r.^(1:L-n)] 
    
    %level=[0.5*delta0:delta0:n*delta0,  n*delta0* r.^(ctr:L-n)]
    level = (thred(2:end) +thred(1:end-1)) /2;
elseif  strcmp(typ,'linear')
    %linear: ==================================================================
    delta=Im/L;
    thred=0:delta:Im;
    level = (thred(2:end) +thred(1:end-1)) /2;
end


%quantization: =========================================
cfar=zeros(h,w,d);
for ih=1:h
    for iw=1:w
        iL=1;
%            [cfa(ih,iw,id) , thred(iL)]
        while cfa(ih,iw) > thred(iL)
            iL=iL+1;
        end
        cfar(ih,iw) = level(iL-1);
    end
end

cfar=cfar-0.5; %recover the value for cfa=cfa+0.5
