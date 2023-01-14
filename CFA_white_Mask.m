function [CFA_mask,CFA]=CFA_white_Mask(CFA,white_level,pattern)
CFA=double(CFA);
if strcmp(pattern,'RGGB')||strcmp(pattern,'rggb')
    g0=[1,2];
    [CFA_mask1,te]=pos_Mask(CFA,g0,white_level);
    CFA(1:2:end,2:2:end)=te;
    g0=[2,1];
    [CFA_mask,te]=pos_Mask(CFA,g0,white_level);
    CFA(2:2:end,1:2:end)=te;
    CFA_mask=CFA_mask+CFA_mask1;
    CFA_mask(CFA_mask~=0)=1;
elseif strcmp(pattern,'BGGR')||strcmp(pattern,'bggr')
    g0=[1,2];
    [CFA_mask1,te]=pos_Mask(CFA,g0,white_level);
    CFA(1:2:end,2:2:end)=te;
    g0=[2,1];
    [CFA_mask,te]=pos_Mask(CFA,g0,white_level);
    CFA(2:2:end,1:2:end)=te;
    CFA_mask=CFA_mask+CFA_mask1;
    CFA_mask(CFA_mask~=0)=1;
elseif strcmp(pattern,'GRBG')||strcmp(pattern,'grbg')
    g0=[1,1];
    [CFA_mask1,te]=pos_Mask(CFA,g0,white_level);
    CFA(1:2:end,1:2:end)=te;
    g0=[2,2];
    [CFA_mask,te]=pos_Mask(CFA,g0,white_level);
    CFA(2:2:end,2:2:end)=te;
    CFA_mask=CFA_mask+CFA_mask1;
    CFA_mask(CFA_mask~=0)=1;
elseif strcmp(pattern,'GBRG')||strcmp(pattern,'gbrg')
    g0=[1,1];
    [CFA_mask1,te]=pos_Mask(CFA,g0,white_level);
    CFA(1:2:end,1:2:end)=te;
    g0=[2,2];
    [CFA_mask,te]=pos_Mask(CFA,g0,white_level);
    CFA(2:2:end,2:2:end)=te;
    CFA_mask=CFA_mask+CFA_mask1;
    CFA_mask(CFA_mask~=0)=1;
end


