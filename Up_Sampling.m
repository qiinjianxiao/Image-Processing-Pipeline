function cfa=Up_Sampling(RGGB,pattern)
[M,N,z]=size(RGGB);
cfa=zeros(M*2,N*2);
if strcmp(pattern,'RGGB')||strcmp(pattern,'rggb')
    cfa(1:2:end,1:2:end)=RGGB(:,:,1);
    cfa(2:2:end,1:2:end)=RGGB(:,:,2);
    cfa(1:2:end,2:2:end)=RGGB(:,:,3);
    cfa(2:2:end,2:2:end)=RGGB(:,:,4);
elseif strcmp(pattern,'BGGR')||strcmp(pattern,'bggr')
    cfa(1:2:end,1:2:end)=RGGB(:,:,4);
    cfa(2:2:end,1:2:end)=RGGB(:,:,2);
    cfa(1:2:end,2:2:end)=RGGB(:,:,3);
    cfa(2:2:end,2:2:end)=RGGB(:,:,1);
elseif strcmp(pattern,'GRBG')||strcmp(pattern,'grbg')
    cfa(1:2:end,1:2:end)=RGGB(:,:,2);
    cfa(2:2:end,1:2:end)=RGGB(:,:,4);
    cfa(1:2:end,2:2:end)=RGGB(:,:,1);
    cfa(2:2:end,2:2:end)=RGGB(:,:,3);
elseif strcmp(pattern,'GBRG')||strcmp(pattern,'gbrg')
    cfa(1:2:end,1:2:end)=RGGB(:,:,2);
    cfa(2:2:end,1:2:end)=RGGB(:,:,1);
    cfa(1:2:end,2:2:end)=RGGB(:,:,4);
    cfa(2:2:end,2:2:end)=RGGB(:,:,3);
end