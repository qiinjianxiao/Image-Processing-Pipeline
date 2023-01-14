function img=Demosaic(CFA,pattern,method,maxc,del,iteration)
if maxc<1.01
    CFA=CFA*255;
end
if iteration==0
    iteration=1;
end
if strcmp(method,'MALTAB')||strcmp(method,'maltab')
    img= Ma_demosaic(CFA,pattern,maxc);
elseif strcmp(method,'RI')||strcmp(method,'ri')
    if del~=0
        img=Block_demosaic(CFA,del,pattern,method,maxc,iteration);
    else
        img=ARI_demosaick_RI(CFA,pattern,maxc);
    end
elseif strcmp(method,'MLRI')||strcmp(method,'mlri')
    if del~=0
        img=Block_demosaic(CFA,del,pattern,method,maxc,iteration);
    else
        img=ARI_demosaick_MLRI(CFA,pattern,maxc);
    end
elseif strcmp(method,'ARI')||strcmp(method,'ari')
    if del~=0
        img=Block_demosaic(CFA,del,pattern,method,maxc,iteration);
    else
        img=ARI_demosaick_ARI(CFA,pattern,maxc,iteration);
    end

end
if maxc<1.01
    img=CFA/255;
end