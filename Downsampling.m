function CFA=Downsampling(image,pattern)
[M,N,Z]=size(image);
CFA=zeros(M,N);
if strcmp(pattern,'rggb')||strcmp(pattern,'RGGB')
    CFA(1:2:end,1:2:end)=image(1:2:end,1:2:end,1);
    CFA(1:2:end,2:2:end)=image(1:2:end,2:2:end,2);
    CFA(2:2:end,1:2:end)=image(2:2:end,1:2:end,2);
    CFA(2:2:end,2:2:end)=image(2:2:end,2:2:end,3);
elseif strcmp(pattern,'bggr')||strcmp(pattern,'BGGR')
    CFA(1:2:end,1:2:end)=image(1:2:end,1:2:end,3);
    CFA(1:2:end,2:2:end)=image(1:2:end,2:2:end,2);
    CFA(2:2:end,1:2:end)=image(2:2:end,1:2:end,2);
    CFA(2:2:end,2:2:end)=image(2:2:end,2:2:end,3);
elseif strcmp(pattern,'grbg')||strcmp(pattern,'GRBG')
    CFA(1:2:end,1:2:end)=image(1:2:end,1:2:end,2);
    CFA(1:2:end,2:2:end)=image(1:2:end,2:2:end,1);
    CFA(2:2:end,1:2:end)=image(2:2:end,1:2:end,3);
    CFA(2:2:end,2:2:end)=image(2:2:end,2:2:end,2);
elseif strcmp(pattern,'gbrg')||strcmp(pattern,'GBRG')
    CFA(1:2:end,1:2:end)=image(1:2:end,1:2:end,2);
    CFA(1:2:end,2:2:end)=image(1:2:end,2:2:end,3);
    CFA(2:2:end,1:2:end)=image(2:2:end,1:2:end,1);
    CFA(2:2:end,2:2:end)=image(2:2:end,2:2:end,2);
end
    
    