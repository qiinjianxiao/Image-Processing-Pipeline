function raw=rawpattern(whiteBalance,pattern)
raw=zeros(2,2);
if strcmp(pattern,'rggb')||strcmp(pattern,'RGGB')
    raw(1,1)=whiteBalance(1);
    raw(1,2)=whiteBalance(2);
    raw(2,1)=whiteBalance(2);
    raw(2,2)=whiteBalance(3);
elseif strcmp(pattern,'bggr')||strcmp(pattern,'BGGR') 
    raw(1,1)=whiteBalance(3);
    raw(1,2)=whiteBalance(2);
    raw(2,1)=whiteBalance(2);
    raw(2,2)=whiteBalance(1);
elseif strcmp(pattern,'grbg')||strcmp(pattern,'GRBG')
    raw(1,1)=whiteBalance(2);
    raw(1,2)=whiteBalance(1);
    raw(2,1)=whiteBalance(3);
    raw(2,2)=whiteBalance(2);
elseif strcmp(pattern,'gbrg')||strcmp(pattern,'GBRG')
    raw(1,1)=whiteBalance(2);
    raw(1,2)=whiteBalance(3);
    raw(2,1)=whiteBalance(1);
    raw(2,2)=whiteBalance(2);
end
