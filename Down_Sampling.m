function RGGB=Down_Sampling(cfaWB,pattern)
[M,N,z]=size(cfaWB);
R=zeros(M/2,N/2);
G1=zeros(M/2,N/2);
G2=zeros(M/2,N/2);
B=zeros(M/2,N/2);
if strcmp(pattern,'RGGB')||strcmp(pattern,'rggb')
    R=cfaWB(1:2:end,1:2:end);
    G1=cfaWB(2:2:end,1:2:end);
    G2=cfaWB(1:2:end,2:2:end);
    B=cfaWB(2:2:end,2:2:end);
elseif strcmp(pattern,'BGGR')||strcmp(pattern,'bggr')
    B=cfaWB(1:2:end,1:2:end);
    G1=cfaWB(2:2:end,1:2:end);
    G2=cfaWB(1:2:end,2:2:end);
    R=cfaWB(2:2:end,2:2:end);
elseif strcmp(pattern,'GRBG')||strcmp(pattern,'grbg')
    G1=cfaWB(1:2:end,1:2:end);
    B=cfaWB(2:2:end,1:2:end);
    R=cfaWB(1:2:end,2:2:end);
    G2=cfaWB(2:2:end,2:2:end);
elseif strcmp(pattern,'GBRG')||strcmp(pattern,'gbrg')
    G1=cfaWB(1:2:end,1:2:end);
    R=cfaWB(2:2:end,1:2:end);
    B=cfaWB(1:2:end,2:2:end);
    G2=cfaWB(2:2:end,2:2:end);
else
    fprintf('not find pattern! ');
end

RGGB=cat(3,R,G1,G2,B);
