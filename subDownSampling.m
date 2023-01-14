function [R,GH,GL,B]=subDownSampling(cfa,pattern,flag)
[M,N,z]=size(cfa);
R=zeros(M/2,N/2);
GH=zeros(M/2,N/2);
GL=zeros(M/2,N/2);
B=zeros(M/2,N/2);
if strcmp(pattern,'RGGB')||strcmp(pattern,'rggb')
    R=cfa(1:2:end,1:2:end);
    GH=cfa(2:2:end,1:2:end);
    GL=cfa(1:2:end,2:2:end);
    B=cfa(2:2:end,2:2:end);
elseif strcmp(pattern,'BGGR')||strcmp(pattern,'bggr')
    B=cfa(1:2:end,1:2:end);
    GH=cfa(2:2:end,1:2:end);
    GL=cfa(1:2:end,2:2:end);
    R=cfa(2:2:end,2:2:end);
elseif strcmp(pattern,'GRBG')||strcmp(pattern,'grbg')
    GH=cfa(1:2:end,1:2:end);
    B=cfa(2:2:end,1:2:end);
    R=cfa(1:2:end,2:2:end);
    GL=cfa(2:2:end,2:2:end);
elseif strcmp(pattern,'GBRG')||strcmp(pattern,'gbrg')
    GH=cfa(1:2:end,1:2:end);
    R=cfa(2:2:end,1:2:end);
    B=cfa(1:2:end,2:2:end);
    GL=cfa(2:2:end,2:2:end);
end
if flag==1
    temp=GL;
    GL=GH;
    GH=temp;
end

