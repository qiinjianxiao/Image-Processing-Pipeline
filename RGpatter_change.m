function pattern=RGpatter_change(pattern)
if strcmp(pattern,'RGGB')||strcmp(pattern,'rggb')
    pattern='bggr';
elseif strcmp(pattern,'BGGR')||strcmp(pattern,'bggr')
    pattern='rggb';
elseif strcmp(pattern,'GRBG')||strcmp(pattern,'grbg')
    pattern='gbrg';
elseif strcmp(pattern,'GBRG')||strcmp(pattern,'gbrg')
    pattern='grbg';
end