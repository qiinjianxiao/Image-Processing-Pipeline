function [mosick,mask]=UpCFA(CFA,pattern)
[M,N]=size(CFA);
mosick=zeros(M,N,3);
mask=zeros(M,N,3);
if strcmp(pattern,'rggb')||strcmp(pattern,'RGGB')
    mosick(1:2:end,1:2:end,1)=CFA(1:2:end,1:2:end);mask(1:2:end,1:2:end,1)=1;
    mosick(1:2:end,2:2:end,2)=CFA(1:2:end,2:2:end);mask(1:2:end,2:2:end,2)=1;
    mosick(2:2:end,1:2:end,2)=CFA(2:2:end,1:2:end);mask(2:2:end,1:2:end,2)=1;
    mosick(2:2:end,2:2:end,3)=CFA(2:2:end,2:2:end);mask(2:2:end,2:2:end,3)=1;
elseif strcmp(pattern,'bggr')||strcmp(pattern,'BGGR') 
    mosick(1:2:end,1:2:end,3)=CFA(1:2:end,1:2:end);mask(1:2:end,1:2:end,3)=1;
    mosick(1:2:end,2:2:end,2)=CFA(1:2:end,2:2:end);mask(1:2:end,2:2:end,2)=1;
    mosick(2:2:end,1:2:end,2)=CFA(2:2:end,1:2:end);mask(2:2:end,1:2:end,2)=1;
    mosick(2:2:end,2:2:end,1)=CFA(2:2:end,2:2:end);mask(2:2:end,2:2:end,1)=1;
elseif strcmp(pattern,'grbg')||strcmp(pattern,'GRBG')
    mosick(1:2:end,1:2:end,2)=CFA(1:2:end,1:2:end);mask(1:2:end,1:2:end,2)=1;
    mosick(1:2:end,2:2:end,1)=CFA(1:2:end,2:2:end);mask(1:2:end,2:2:end,1)=1;
    mosick(2:2:end,1:2:end,3)=CFA(2:2:end,1:2:end);mask(2:2:end,1:2:end,3)=1;
    mosick(2:2:end,2:2:end,2)=CFA(2:2:end,2:2:end);mask(2:2:end,2:2:end,2)=1;
elseif strcmp(pattern,'gbrg')||strcmp(pattern,'GBRG')
    mosick(1:2:end,1:2:end,2)=CFA(1:2:end,1:2:end);mask(1:2:end,1:2:end,2)=1;
    mosick(1:2:end,2:2:end,3)=CFA(1:2:end,2:2:end);mask(1:2:end,2:2:end,3)=1;
    mosick(2:2:end,1:2:end,1)=CFA(2:2:end,1:2:end);mask(2:2:end,1:2:end,1)=1;
    mosick(2:2:end,2:2:end,2)=CFA(2:2:end,2:2:end);mask(2:2:end,2:2:end,2)=1;
end
    