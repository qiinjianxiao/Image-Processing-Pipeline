function img=Block_demosaic(CFA,del,pattern,method,maxc,iteration)
[M,N,z]=size(CFA);
de=8;
dk=del+de*2;
kM=floor(M/(del));kN=floor(N/(del));
img=zeros(M,N,3);
CFA= array_extern_symmetric(CFA,de);
CFA=CFA(1:M+de,1:N+de);
if strcmp(method,'MLRI')||strcmp(method,'mlri')
    sh=1;
    for i=1:kM-1
        sw=1;
        for j=1:kN-1
            im=ARI_demosaick_MLRI(CFA(sh:sh+dk-1,sw:sw+dk-1),pattern,maxc);
            sw=sw+del;
            im=im(de+1:end-de,de+1:end-de,:);
            img(1+del*(i-1):del*i,1+del*(j-1):del*j,:)=im;
        end
        ww=N-sw;
        im=ARI_demosaick_MLRI(CFA(sh:sh+dk-1,sw:end),pattern,maxc);
        im=im(de+1:end-de,end-ww:end,:);
        img(1+del*(i-1):del*i,end-ww:end,:)=im;
        sh=sh+del;    
    end
    wh=M-sh;
    sw=1;
    for j=1:kN-1
        im=ARI_demosaick_MLRI(CFA(sh-de:end,sw:sw+dk-1),pattern,maxc);
        sw=sw+del;
        im=im(end-wh:end,de+1:end-de,:);
        img(end-wh:end,1+del*(j-1):del*j,:)=im;
    end
    im=ARI_demosaick_MLRI(CFA(sh-de:end,sw:end),pattern,maxc);
    im=im(end-wh:end,end-ww:end,:);
    img(end-wh:end,end-ww:end,:)=im;
elseif strcmp(method,'ARI')||strcmp(method,'ari')
    sh=1;
    for i=1:kM-1
        sw=1;
        for j=1:kN-1
            im=ARI_demosaick_ARI(CFA(sh:sh+dk-1,sw:sw+dk-1),pattern,maxc,iteration);
            sw=sw+del;
            im=im(de+1:end-de,de+1:end-de,:);
            img(1+del*(i-1):del*i,1+del*(j-1):del*j,:)=im;
        end
        ww=N-sw;
        im=ARI_demosaick_ARI(CFA(sh:sh+dk-1,sw:end),pattern,maxc,iteration);
        im=im(de+1:end-de,end-ww:end,:);
        img(1+del*(i-1):del*i,end-ww:end,:)=im;
        sh=sh+del;    
    end
    wh=M-sh;
    sw=1;
    for j=1:kN-1
        im=ARI_demosaick_ARI(CFA(sh-de:end,sw:sw+dk-1),pattern,maxc,iteration);
        sw=sw+del;
        im=im(end-wh:end,de+1:end-de,:);
        img(end-wh:end,1+del*(j-1):del*j,:)=im;
    end
    im=ARI_demosaick_ARI(CFA(sh-de:end,sw:end),pattern,maxc,iteration);
    im=im(end-wh:end,end-ww:end,:);
    img(end-wh:end,end-ww:end,:)=im;
elseif strcmp(method,'RI')||strcmp(method,'ri')
        sh=1;
    for i=1:kM-1
        sw=1;
        for j=1:kN-1
            im=ARI_demosaick_RI(CFA(sh:sh+dk-1,sw:sw+dk-1),pattern,maxc);
            sw=sw+del;
            im=im(de+1:end-de,de+1:end-de,:);
            img(1+del*(i-1):del*i,1+del*(j-1):del*j,:)=im;
        end
        ww=N-sw;
        im=ARI_demosaick_RI(CFA(sh:sh+dk-1,sw:end),pattern,maxc);
        im=im(de+1:end-de,end-ww:end,:);
        img(1+del*(i-1):del*i,end-ww:end,:)=im;
        sh=sh+del;    
    end
    wh=M-sh;
    sw=1;
    for j=1:kN-1
        im=ARI_demosaick_RI(CFA(sh-de:end,sw:sw+dk-1),pattern,maxc);
        sw=sw+del;
        im=im(end-wh:end,de+1:end-de,:);
        img(end-wh:end,1+del*(j-1):del*j,:)=im;
    end
    im=ARI_demosaick_RI(CFA(sh-de:end,sw:end),pattern,maxc);
    im=im(end-wh:end,end-ww:end,:);
    img(end-wh:end,end-ww:end,:)=im;
end